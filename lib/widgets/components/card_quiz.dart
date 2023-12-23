import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/navigation/route_names.dart';
import 'package:quiz_app/services/storage/storage_service.dart';

class CardQuiz extends StatelessWidget {
  final QuizModel quiz;
  // final Function() onTap;
  final int index;
  CardQuiz({
    super.key,
    // required this.onTap,
    required this.quiz,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final _storageService = GetIt.instance<StorageService>();
    final savedCompletedTheory =
        _storageService.getBool('completedTheory_${quiz.id + 1}') ?? false;
    final savedCompletedTest =
        _storageService.getBool('completedTest_${quiz.id + 1}') ?? false;
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 10),
      color: savedCompletedTest
          ? Theme.of(context).colorScheme.primary
          : savedCompletedTheory
              ? Colors.white
              : Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: savedCompletedTest
              ? Theme.of(context).colorScheme.primary
              : savedCompletedTheory
                  ? Colors.black
                  : Colors.white,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        leading: Text(
          '${index + 1}',
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: savedCompletedTest
                    ? Colors.black
                    : savedCompletedTheory
                        ? Colors.black
                        : Colors.white,
              ),
        ),
        title: Text(
          quiz.title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: savedCompletedTest
                    ? Colors.black
                    : savedCompletedTheory
                        ? Colors.black
                        : Colors.white,
              ),
        ),
        subtitle: Text(
          '15 minutes',
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: savedCompletedTest
                  ? Colors.black
                  : savedCompletedTheory
                      ? Colors.black
                      : Colors.white.withOpacity(0.5)),
        ),
        trailing: Icon(
          Icons.chevron_right,
          size: 40,
          color: savedCompletedTest
              ? Colors.black
              : savedCompletedTheory
                  ? Colors.black
                  : Colors.white,
        ),
        onTap: () => Navigator.of(context).pushNamed(
          RouteNames.previewQuiz,
          arguments: quiz,
        ),
      ),
    );
  }
}
