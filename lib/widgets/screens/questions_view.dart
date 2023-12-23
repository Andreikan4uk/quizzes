import 'package:flutter/material.dart';
import 'package:quiz_app/generated/assets.gen.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/navigation/route_names.dart';
import 'package:quiz_app/widgets/components/custom_appbar.dart';
import 'package:quiz_app/widgets/components/custom_back_button.dart';

class QuestionsView extends StatefulWidget {
  const QuestionsView({super.key});

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  PageController _pageController = PageController();
  late Map<String, dynamic> arguments;
  int rightAnswer = 0;
  int _currentPage = 0;

  @override
  void initState() {
    resetQuiz();
    super.initState();
  }

  void resetQuiz() {
    setState(() {
      _currentPage = 0;
      rightAnswer = 0;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quiz = ModalRoute.of(context)!.settings.arguments as QuizModel;

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
                  Spacer(flex: 4),
                  Text(
                    'Question ${_currentPage + 1}',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.white),
                  ),
                  Spacer(flex: 5),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  itemCount: quiz.questions.length,
                  itemBuilder: (context, index) {
                    final quizQuestion = quiz.questions[index];
                    return ListView(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      children: [
                        Text(
                          quiz.questions[index].question,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: Colors.white),
                        ),
                        SizedBox(height: 25),
                        ...List.generate(
                          quiz.questions[index].options.length,
                          (optionIndex) {
                            final options = quizQuestion.options[optionIndex];
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: RadioListTile(
                                value: options,
                                groupValue: quizQuestion.userAnswer,
                                selected: quizQuestion.userAnswer ==
                                    quizQuestion.answer,
                                title: Text(
                                  options,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: quizQuestion.answer !=
                                                  quizQuestion.userAnswer
                                              ? Colors.white
                                              : options ==
                                                      quizQuestion.userAnswer
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .primary
                                                  : Colors.white),
                                ),
                                subtitle: quizQuestion.answer ==
                                        quizQuestion.userAnswer
                                    ? Text('',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(color: Colors.red))
                                    : options == quizQuestion.userAnswer
                                        ? Text(
                                            '''Oops, that's the wrong answer, try again''',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium!
                                                .copyWith(color: Colors.red),
                                          )
                                        : Text(''),
                                activeColor: quizQuestion.answer ==
                                        quizQuestion.userAnswer
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.red,
                                onChanged: (value) {
                                  setState(() {
                                    quizQuestion.userAnswer = value!;
                                    if (quizQuestion.answer ==
                                        quizQuestion.userAnswer) {
                                      rightAnswer++;
                                    }
                                    if (_currentPage ==
                                        quiz.questions.length - 1) {
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                        RouteNames.endQuizView,
                                        arguments: arguments = {
                                          'rightAnswer': rightAnswer,
                                          'quiz': quiz,
                                        },
                                      );
                                    } else {
                                      _currentPage++;
                                    }
                                  });
                                  _pageController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 25),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Finished ${_currentPage} of ${quiz.questions.length}',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: Colors.white.withOpacity(0.5)),
                          ),
                        ),
                        SizedBox(height: 5),
                        LinearProgressIndicator(
                          minHeight: 5,
                          value: (index) / quiz.questions.length,
                        ),
                      ],
                    );
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
