import 'package:flutter/material.dart';
import 'package:quiz_app/generated/assets.gen.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/navigation/route_names.dart';
import 'package:quiz_app/widgets/components/custom_appbar.dart';
import 'package:quiz_app/widgets/components/custom_back_button.dart';
import 'package:quiz_app/widgets/components/custom_button.dart';

class TheoryView extends StatefulWidget {
  const TheoryView({super.key});

  @override
  State<TheoryView> createState() => _TheoryViewState();
}

class _TheoryViewState extends State<TheoryView> {
  late PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
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
                    'Step ${_currentPage + 1}',
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
                  itemCount: quiz.theoryText.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 190,
                          height: 170,
                          child: Assets.images.theoryBook.image(),
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Finished ${_currentPage + 1} of ${quiz.theoryText.length}',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: Colors.white.withOpacity(0.5)),
                          ),
                        ),
                        SizedBox(height: 5),
                        LinearProgressIndicator(
                          minHeight: 5,
                          value: (index + 1) / quiz.theoryText.length,
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(quiz.theoryText[index]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CustomButton(
                onPressed: () {
                  if (_currentPage < quiz.theoryText.length - 1) {
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                    setState(() => _currentPage++);
                  } else {
                    Navigator.of(context).pushReplacementNamed(
                      RouteNames.congratulationsView,
                      arguments: quiz,
                    );
                  }
                },
                text: _currentPage != quiz.theoryText.length - 1
                    ? 'Next'
                    : 'Finish',
              ),
              SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}
