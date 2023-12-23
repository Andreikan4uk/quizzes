import 'package:flutter/material.dart';
import 'package:quiz_app/generated/assets.gen.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/widgets/components/card_quiz.dart';

class CardsView extends StatefulWidget {
  const CardsView({super.key});

  @override
  State<CardsView> createState() => _CardsViewState();
}

class _CardsViewState extends State<CardsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.cardsBg.provider(),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back!',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(height: 35),
              AspectRatio(
                aspectRatio: 2.17,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Assets.images.frameCardsView.provider(),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(text: getText()),
                      Text(
                        'Start taking investing\ncourses and put\ntogether a great\ninvestor portfolio!',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: Colors.black),
                      ),
                      Spacer(),
                      Assets.icons.rightArrow.svg(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              Expanded(
                child: ListView(
                  children: [
                    ...List.generate(
                      quizzes.length,
                      (index) => CardQuiz(
                        quiz: quizzes[index],
                        index: index,
                      ),
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

  TextSpan getText() {
    return TextSpan(
      children: [
        TextSpan(
          text: 'Want to be a ',
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Colors.black),
        ),
        TextSpan(
            text: 'pro\n',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Colors.black)),
        TextSpan(
          text: 'at investing?',
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
