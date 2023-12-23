import 'package:flutter/material.dart';
import 'package:quiz_app/generated/assets.gen.dart';
import 'package:quiz_app/helpers/data_time_helper.dart';
import 'package:quiz_app/models/arguments.dart';
import 'package:quiz_app/models/news.dart';
import 'package:quiz_app/widgets/components/custom_appbar.dart';
import 'package:quiz_app/widgets/components/custom_back_button.dart';

class NewView extends StatelessWidget {
  final NewViewArguments news;
  NewView({super.key, required this.news});

  factory NewView.create(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as NewViewArguments;
    return NewView(news: arguments);
  }

  News get _article => news.article;

  @override
  Widget build(BuildContext context) {
    final hours = DateTimeHelper.getHours(_article.date);
    final minutes = DateTimeHelper.getMinutes(_article.date);
    final day = DateTimeHelper.getDay(_article.date);
    final month = DateTimeHelper.getMonth(_article.date);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
              CustomAppBar(children: [CustomBackButton()]),
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            _article.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'BroForc $month.$day ${hours}:$minutes',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      _article.body,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
