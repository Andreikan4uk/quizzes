import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/generated/assets.gen.dart';
import 'package:quiz_app/helpers/data_time_helper.dart';
import 'package:quiz_app/models/arguments.dart';
import 'package:quiz_app/models/news.dart';
import 'package:quiz_app/navigation/route_names.dart';
import 'package:quiz_app/widgets/components/article_cover.dart';
import 'package:quiz_app/widgets/components/custom_appbar.dart';
import 'package:quiz_app/widgets/screens/news/controller/news_controller.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  late final _newsController = NewsController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.bgAll.provider(),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Actual',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                color: Theme.of(context).colorScheme.primary),
                      ),
                      Text(
                        'News',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: _newsController,
                  builder: (context, value, child) {
                    if (value.isLoading) {
                      return const _LoadingState();
                    } else {
                      if (value.errorMessage != null) {
                        return _ErrorState(
                          errorMessage: value.errorMessage!,
                          refresh: _newsController.refresh,
                        );
                      } else {
                        return _LoadedState(
                          news: value.news,
                          refresh: _newsController.refresh,
                        );
                      }
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
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        radius: 15,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? refresh;
  const _ErrorState({required this.errorMessage, this.refresh});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Error has occured: $errorMessage',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 20),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: refresh,
          child: const Icon(Icons.refresh_outlined, size: 30),
        ),
      ],
    );
  }
}

class _LoadedState extends StatelessWidget {
  final List<News> news;
  final VoidCallback? refresh;
  const _LoadedState({
    required this.news,
    this.refresh,
  });

  @override
  Widget build(BuildContext context) {
    return news.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Data could not be retrieved.\nPlease, try again',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 20),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: refresh,
                  child: const Icon(Icons.refresh_outlined, size: 30),
                ),
              ],
            ),
          )
        : ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            itemBuilder: (context, index) => _NewsCard(
              news: news[index],
              onPressed: () {
                Navigator.of(context).pushNamed(
                  RouteNames.newView,
                  arguments: NewViewArguments(article: news[index]),
                );
              },
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: news.length,
          );
  }
}

class _NewsCard extends StatelessWidget {
  final News news;
  final VoidCallback? onPressed;
  const _NewsCard({
    required this.news,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final hours = DateTimeHelper.getHours(news.date);
    final minutes = DateTimeHelper.getMinutes(news.date);
    final day = DateTimeHelper.getDay(news.date);
    final month = DateTimeHelper.getMonth(news.date);
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        // width: double.infinity,
        // height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            ArtcileCover(url: news.imageUrl),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '$hours:$minutes',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: Colors.white.withOpacity(0.6)),
                        ),
                        Spacer(),
                        Text('$month.$day',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    color: Colors.white.withOpacity(0.6))),
                        Spacer(),
                        Text('TradingView',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    color: Colors.white.withOpacity(0.6))),
                        Spacer(flex: 2)
                      ],
                    ),
                    SizedBox(height: 7),
                    Text(
                      news.title,
                      maxLines: 3,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

                  // const SizedBox(height: 3),
                  // SizedBox(
                  //   height: 78,
                  //   child: Text(
                  //     news.body,
                  //     overflow: TextOverflow.ellipsis,
                  //     maxLines: 5,
                  //     style: Theme.of(context)
                  //         .textTheme
                  //         .displayMedium!
                  //         .copyWith(color: Colors.black.withOpacity(0.42)),
                  //   ),
                  // ),
                  // const SizedBox(height: 5),
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: Text(
                  //     'Today, ${hours}:$minutes',
                  //     style: Theme.of(context)
                  //         .textTheme
                  //         .displayMedium!
                  //         .copyWith(color: Colors.black.withOpacity(0.42)),
                  //   ),
                  // ),