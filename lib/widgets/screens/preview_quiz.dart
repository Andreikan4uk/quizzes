import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz_app/generated/assets.gen.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/navigation/route_names.dart';
import 'package:quiz_app/services/storage/storage_service.dart';
import 'package:quiz_app/widgets/components/custom_appbar.dart';
import 'package:quiz_app/widgets/components/custom_back_button.dart';
import 'package:quiz_app/widgets/components/custom_button.dart';

class PreviewQuiz extends StatefulWidget {
  const PreviewQuiz({super.key});

  @override
  State<PreviewQuiz> createState() => _PreviewQuizState();
}

class _PreviewQuizState extends State<PreviewQuiz> {
  final _storageService = GetIt.instance<StorageService>();
  @override
  Widget build(BuildContext context) {
    final quiz = ModalRoute.of(context)!.settings.arguments as QuizModel;
    final savedCompletedTheory =
        _storageService.getBool('completedTheory_${quiz.id + 1}') ?? false;
    final savedCompletedTest =
        _storageService.getBool('completedTest_${quiz.id + 1}') ?? false;
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
            children: [
              CustomAppBar(
                children: [
                  CustomBackButton(),
                  Expanded(
                    child: Text(
                      quiz.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                    child: Column(
                      children: [
                        Assets.images.previewCard.image(),
                        SizedBox(height: 20),
                        Text(
                          'Fundamentals of investment: concepts, terms and principles',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        SizedBox(height: 10),
                        Text(
                            'Investments are one of the important tools for financial planning and achieving financial goals. Investments are defined as long-term investments for the purpose of earning a profit or capital growth.',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: Colors.white)),
                        SizedBox(height: 40),
                        CupertinoButton.filled(
                            padding: EdgeInsets.zero,
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              decoration: BoxDecoration(
                                color: savedCompletedTheory
                                    ? Theme.of(context).colorScheme.primary
                                    : null,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    savedCompletedTest
                                        ? 'Test completed!'
                                        : 'Take the test',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.black),
                                  ),
                                  Spacer(),
                                  savedCompletedTest
                                      ? Assets.icons.decorationStar.svg()
                                      : savedCompletedTheory
                                          ? Assets.icons.rightArrow.svg()
                                          : Assets.icons.unlockPreview.svg(),
                                ],
                              ),
                            ),
                            onPressed:
                                savedCompletedTheory || savedCompletedTest
                                    ? () {
                                        if (savedCompletedTest) {
                                          return;
                                        } else if (savedCompletedTheory) {
                                          Navigator.of(context).pushNamed(
                                            RouteNames.questionsView,
                                            arguments: quiz,
                                          );
                                        }
                                      }
                                    : null,
                            disabledColor: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.3)),
                        SizedBox(height: 50),
                        CustomButton(
                          onPressed: () =>
                              Navigator.of(context).pushReplacementNamed(
                            RouteNames.theoryView,
                            arguments: quiz,
                          ),
                          text: 'Get started',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
