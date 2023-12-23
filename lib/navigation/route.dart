import 'package:flutter/material.dart';
import 'package:quiz_app/navigation/route_names.dart';
import 'package:quiz_app/widgets/screens/calculator_view.dart';
import 'package:quiz_app/widgets/screens/calcutalor_result_view.dart';
import 'package:quiz_app/widgets/screens/congratulations_view.dart';
import 'package:quiz_app/widgets/screens/end_quiz_view.dart';
import 'package:quiz_app/widgets/screens/feedbackView.dart';
import 'package:quiz_app/widgets/screens/home_view.dart';
import 'package:quiz_app/widgets/screens/news/screens/new_view.dart';
import 'package:quiz_app/widgets/screens/news/screens/news_view.dart';
import 'package:quiz_app/widgets/screens/onboarding_view.dart';
import 'package:quiz_app/widgets/screens/preview_quiz.dart';
import 'package:quiz_app/widgets/screens/privacy_view.dart';
import 'package:quiz_app/widgets/screens/questions_view.dart';
import 'package:quiz_app/widgets/screens/splash_view.dart';
import 'package:quiz_app/widgets/screens/theory_view.dart';
import 'package:quiz_app/widgets/screens/worldSignal/screen/resources_view.dart';

typedef ScreenBuilding = Widget Function(BuildContext);

class Routes {
  static Map<String, ScreenBuilding> get(BuildContext context) {
    return {
      RouteNames.onboarding: (context) => const OnboardingView(),
      RouteNames.main: (context) => const HomeView(),
      RouteNames.newsView: (context) => const NewsView(),
      RouteNames.newView: (context) => NewView.create(context),
      RouteNames.feedbackView: (context) => FeedbackView(),
      RouteNames.previewQuiz: (context) => PreviewQuiz(),
      RouteNames.theoryView: (context) => TheoryView(),
      RouteNames.congratulationsView: (context) => CongratulationsView(),
      RouteNames.questionsView: (context) => QuestionsView(),
      RouteNames.endQuizView: (context) => EndQuizView(),
      RouteNames.creditCalculator: (context) => CreditCalculatorView(),
      RouteNames.calculatorResult: (context) => CalculatorResultView(),
      RouteNames.worldSignal: (context) => ResourcesView(),
      RouteNames.privacy: (context) => PrivacyView(),
      RouteNames.splash: (context) => SplashView(),
    };
  }
}
