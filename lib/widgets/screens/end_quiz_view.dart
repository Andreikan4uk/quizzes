import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz_app/generated/assets.gen.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/navigation/route_names.dart';
import 'package:quiz_app/services/storage/storage_service.dart';
import 'package:quiz_app/widgets/components/custom_button.dart';

class EndQuizView extends StatefulWidget {
  const EndQuizView({super.key});

  @override
  State<EndQuizView> createState() => _EndQuizViewState();
}

class _EndQuizViewState extends State<EndQuizView> {
  final _storageService = GetIt.instance<StorageService>();
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final rightAnswer = arguments['rightAnswer'] as int;
    final quiz = arguments['quiz'] as QuizModel;
    final savedCompletedTest = quiz.completedTest;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: rightAnswer > 3
                ? Assets.images.congratulationsBg.provider()
                : Assets.images.badEndQuizBg.provider(),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Spacer(flex: 3),
            Text(
              'Amazing score!',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            SizedBox(height: 10),
            Text(
              'You have successfully completed the lesson, now you have access to the next one!',
              style: Theme.of(context).textTheme.labelSmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Container(
              width: 250,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(56),
                  color: Theme.of(context).colorScheme.primary),
              child: Center(
                child: Row(
                  children: [
                    Assets.icons.decorationStar.svg(),
                    SizedBox(width: 5),
                    Text(
                      '$rightAnswer/${quiz.questions.length} correct answers',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Row(
              children: [
                CustomButton(
                  onPressed: () {
                    if (!savedCompletedTest && rightAnswer > 3) {
                      _storageService.setBool(
                          'completedTest_${quiz.id + 1}', true);
                    }
                    quiz.questions
                        .forEach((question) => question.userAnswer = '');
                    Navigator.of(context).pushReplacementNamed(
                      RouteNames.questionsView,
                      arguments: quiz,
                    );
                  },
                  text: 'Repeat',
                ),
                Spacer(),
                CupertinoButton(
                  borderRadius: BorderRadius.circular(30),
                  padding: EdgeInsets.zero,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(30)),
                    width: 158,
                    height: 50,
                    child: Center(
                      child: Text(
                        'Home',
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (!savedCompletedTest && rightAnswer > 3) {
                      _storageService.setBool(
                          'completedTest_${quiz.id + 1}', true);
                    }
                    quiz.questions
                        .forEach((question) => question.userAnswer = '');
                    Navigator.of(context).pushReplacementNamed(RouteNames.main);
                  },
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
