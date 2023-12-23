import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz_app/generated/assets.gen.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/navigation/route_names.dart';
import 'package:quiz_app/services/storage/storage_service.dart';
import 'package:quiz_app/widgets/components/custom_button.dart';

class CongratulationsView extends StatelessWidget {
  const CongratulationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final _storageService = GetIt.instance<StorageService>();
    final quiz = ModalRoute.of(context)!.settings.arguments as QuizModel;
    final savedCompletedTheory = quiz.completedTheory;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.congratulationsBg.provider(),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Spacer(flex: 2),
              Text(
                'Congratulations!',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Colors.white),
              ),
              RichText(
                text: getText(context),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              CustomButton(
                onPressed: () {
                  if (!savedCompletedTheory) {
                    _storageService.setBool(
                        'completedTheory_${quiz.id + 1}', true);
                  }
                  Navigator.of(context).pushReplacementNamed(
                    RouteNames.questionsView,
                    arguments: quiz,
                  );
                },
                text: 'Start',
              ),
              TextButton(
                onPressed: () {
                  if (!savedCompletedTheory) {
                    _storageService.setBool(
                        'completedTheory_${quiz.id + 1}', true);
                  }
                  Navigator.of(context).pushReplacementNamed(
                    RouteNames.main,
                    arguments: quiz,
                  );
                },
                child: Text(
                  'maybe later',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: Colors.white.withOpacity(0.5)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextSpan getText(context) {
    return TextSpan(
      children: [
        TextSpan(
          text: 'You have successfully passed the theoretical\npart! ',
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: Colors.white),
        ),
        TextSpan(
          text: 'Would you like to be tested on the material you have learned?',
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ],
    );
  }
}
