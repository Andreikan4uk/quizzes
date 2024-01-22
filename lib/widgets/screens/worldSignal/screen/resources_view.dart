import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/constants/constants.dart';
import 'package:quiz_app/generated/assets.gen.dart';
import 'package:quiz_app/models/resource.dart';
import 'package:quiz_app/models/resource_query.dart';
import 'package:quiz_app/widgets/components/custom_appbar.dart';
import 'package:quiz_app/widgets/components/custom_back_button.dart';
import 'package:quiz_app/widgets/screens/worldSignal/controller/resources_controller.dart';

class ResourcesView extends StatefulWidget {
  const ResourcesView({super.key});

  @override
  State<ResourcesView> createState() => _ResourcesViewState();
}

class _ResourcesViewState extends State<ResourcesView> {
  final _resourcesController = ResourcesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: Assets.images.bgAll.provider(),
          fit: BoxFit.cover,
        )),
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                children: [
                  CustomBackButton(),
                  Spacer(flex: 6),
                  Text(
                    'Signals',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.white),
                  ),
                  Spacer(flex: 8),
                ],
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: _resourcesController,
                  builder: (context, value, child) {
                    if (value.isLoading) {
                      return _LoadingState(remainingTime: value.remainingTime);
                    } else if (value.errorMessage != null) {
                      return _ErrorState(refresh: _resourcesController.refresh);
                    } else if (value.isTimeout) {
                      return _ErrorState(
                        refresh: _resourcesController.refresh,
                        errorMessage:
                            'Loading timeout. Please, check your\ninternet connection and try again!',
                      );
                    } else {
                      return _LoadedState(
                        resources: value.resources,
                        queries: Constants.reourseQueries,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoadingState extends StatelessWidget {
  final int remainingTime;
  const _LoadingState({
    required this.remainingTime,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoActivityIndicator(
            radius: 15,
            color: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(height: 10),
          Text(
            'Remainig loading time: ${remainingTime}s',
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final VoidCallback refresh;
  final String? errorMessage;
  const _ErrorState({
    required this.refresh,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMessage ?? 'Some error has occured.\nPlease, try again',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: refresh,
          ),
        ],
      ),
    );
  }
}

class _LoadedState extends StatelessWidget {
  final List<Resource> resources;
  final List<ResourceQuery> queries;
  const _LoadedState({
    required this.resources,
    required this.queries,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
      itemBuilder: (context, index) => _ResourceTile(
        resource: resources[index],
        query: queries[index],
      ),
      separatorBuilder: (context, index) => Divider(thickness: 0.5),
      itemCount: resources.length,
    );
  }
}

class _ResourceTile extends StatelessWidget {
  final Resource resource;
  final ResourceQuery query;
  const _ResourceTile({
    required this.resource,
    required this.query,
  });

  @override
  Widget build(BuildContext context) {
    final startPrice = 1 / resource.open;
    final closePrice = 1 / resource.close;
    final changePercentege = ((closePrice - startPrice) / startPrice) * 100;
    final changePrice = 1 / (closePrice - startPrice);
    String getText() {
      if (changePercentege == 0.0) {
        return '(${changePercentege.toStringAsFixed(1)}%)';
      } else {
        return '${changePrice.toStringAsFixed(2)}(${changePercentege.toStringAsFixed(1)}%)';
      }
    }

    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 40,
            alignment: Alignment.center,
            child: query.icon.image(width: 40, height: 40),
          ),
          SizedBox(width: 8),
          Text(query.name, style: Theme.of(context).textTheme.bodySmall),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${closePrice.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                getText(),
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: changePrice.isNegative
                          ? Colors.red
                          : Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
