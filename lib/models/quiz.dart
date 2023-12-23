import 'package:quiz_app/helpers/text_helper.dart';
import 'package:quiz_app/models/quiz_question.dart';
import 'package:quiz_app/services/storage/storage_service.dart';

class QuizModel {
  final int id;
  final String title;
  final List<String> theoryText;
  final List<QuizQuestion> questions;
  final bool completedTheory;
  final bool completedTest;

  QuizModel({
    required this.id,
    required this.title,
    required this.theoryText,
    required this.questions,
    required this.completedTheory,
    required this.completedTest,
  });
}

List<QuizModel> quizzes = [
  QuizModel(
    id: 0,
    title: 'Basics of Investments: Concepts, Terms, and Principles',
    theoryText: [
      TextHelper.theoryText_1_1,
      TextHelper.theoryText_1_2,
      TextHelper.theoryText_1_3,
      TextHelper.theoryText_1_4,
      TextHelper.theoryText_1_5,
    ],
    questions: questions_1,
    completedTest:
        StorageService().getBool(StorageKeys.completedTest_1) ?? false,
    completedTheory:
        StorageService().getBool(StorageKeys.completedTheory_1) ?? false,
  ),
  QuizModel(
    id: 1,
    title:
        'Various Types of Investments: Stocks, Bonds, Real Estate, and Others',
    theoryText: [
      TextHelper.theoryText_2_1,
      TextHelper.theoryText_2_2,
      TextHelper.theoryText_2_3,
      TextHelper.theoryText_2_4,
    ],
    questions: questions_2,
    completedTest:
        StorageService().getBool(StorageKeys.completedTest_2) ?? false,
    completedTheory:
        StorageService().getBool(StorageKeys.completedTheory_2) ?? false,
  ),
  QuizModel(
    id: 2,
    title: 'Risk and Return in Investments',
    theoryText: [
      TextHelper.theoryText_3_1,
      TextHelper.theoryText_3_2,
      TextHelper.theoryText_3_3,
    ],
    questions: questions_3,
    completedTest:
        StorageService().getBool(StorageKeys.completedTest_3) ?? false,
    completedTheory:
        StorageService().getBool(StorageKeys.completedTheory_3) ?? false,
  ),
  QuizModel(
    id: 3,
    title: 'Rules of Portfolio Diversification',
    theoryText: [
      TextHelper.theoryText_4_1,
      TextHelper.theoryText_4_2,
      TextHelper.theoryText_4_3,
      TextHelper.theoryText_4_4,
    ],
    questions: questions_4,
    completedTest:
        StorageService().getBool(StorageKeys.completedTest_4) ?? false,
    completedTheory:
        StorageService().getBool(StorageKeys.completedTheory_4) ?? false,
  ),
  QuizModel(
    id: 4,
    title: 'Analysis of Financial Indicators of Companies Before Investing',
    theoryText: [
      TextHelper.theoryText_5_1,
      TextHelper.theoryText_5_2,
      TextHelper.theoryText_5_3,
      TextHelper.theoryText_5_4,
    ],
    questions: questions_5,
    completedTest:
        StorageService().getBool(StorageKeys.completedTest_5) ?? false,
    completedTheory:
        StorageService().getBool(StorageKeys.completedTheory_5) ?? false,
  ),
  QuizModel(
    id: 5,
    title: 'Technical Analysis in Investments: Charts, Trends, and Indicators',
    theoryText: [
      TextHelper.theoryText_6_1,
      TextHelper.theoryText_6_2,
      TextHelper.theoryText_6_3,
      TextHelper.theoryText_6_4,
    ],
    questions: questions_6,
    completedTest:
        StorageService().getBool(StorageKeys.completedTest_6) ?? false,
    completedTheory:
        StorageService().getBool(StorageKeys.completedTheory_6) ?? false,
  ),
  QuizModel(
    id: 6,
    title:
        'Fundamental Analysis in Investments: Evaluation of Asset and Company Value',
    theoryText: [
      TextHelper.theoryText_7_1,
      TextHelper.theoryText_7_2,
      TextHelper.theoryText_7_3,
    ],
    questions: questions_7,
    completedTest:
        StorageService().getBool(StorageKeys.completedTest_7) ?? false,
    completedTheory:
        StorageService().getBool(StorageKeys.completedTheory_7) ?? false,
  ),
  QuizModel(
    id: 7,
    title: 'Psychology of Investing: Emotions and Decision-Making',
    theoryText: [
      TextHelper.theoryText_8_1,
      TextHelper.theoryText_8_2,
      TextHelper.theoryText_8_3,
      TextHelper.theoryText_8_4,
    ],
    questions: questions_8,
    completedTest:
        StorageService().getBool(StorageKeys.completedTest_8) ?? false,
    completedTheory:
        StorageService().getBool(StorageKeys.completedTheory_8) ?? false,
  ),
  QuizModel(
    id: 8,
    title: 'Long-Term Investment Strategies',
    theoryText: [
      TextHelper.theoryText_9_1,
      TextHelper.theoryText_9_2,
      TextHelper.theoryText_9_3,
      TextHelper.theoryText_9_4,
    ],
    questions: questions_9,
    completedTest:
        StorageService().getBool(StorageKeys.completedTest_9) ?? false,
    completedTheory:
        StorageService().getBool(StorageKeys.completedTheory_9) ?? false,
  ),
  QuizModel(
    id: 9,
    title: 'Trading on the Stock Market: Basic Rules and Strategies',
    theoryText: [
      TextHelper.theoryText_10_1,
      TextHelper.theoryText_10_2,
      TextHelper.theoryText_10_3,
      TextHelper.theoryText_10_4,
    ],
    questions: questions_10,
    completedTest:
        StorageService().getBool(StorageKeys.completedTest_10) ?? false,
    completedTheory:
        StorageService().getBool(StorageKeys.completedTheory_10) ?? false,
  ),
  QuizModel(
    id: 10,
    title: 'Investing in Startups and Venture Projects',
    theoryText: [
      TextHelper.theoryText_11_1,
      TextHelper.theoryText_11_2,
      TextHelper.theoryText_11_3,
    ],
    questions: questions_11,
    completedTest:
        StorageService().getBool(StorageKeys.completedTest_11) ?? false,
    completedTheory:
        StorageService().getBool(StorageKeys.completedTheory_11) ?? false,
  ),
  QuizModel(
    id: 11,
    title: 'Cryptocurrencies and Blockchain: Opportunities and Risks',
    theoryText: [
      TextHelper.theoryText_12_1,
      TextHelper.theoryText_12_2,
      TextHelper.theoryText_12_3,
      TextHelper.theoryText_12_4,
    ],
    questions: questions_12,
    completedTest:
        StorageService().getBool(StorageKeys.completedTest_12) ?? false,
    completedTheory:
        StorageService().getBool(StorageKeys.completedTheory_12) ?? false,
  ),
  QuizModel(
    id: 12,
    title: 'Investing in Own Business: Opening and Developing a Startup',
    theoryText: [
      TextHelper.theoryText_13_1,
      TextHelper.theoryText_13_2,
      TextHelper.theoryText_13_3,
      TextHelper.theoryText_13_4,
    ],
    questions: questions_13,
    completedTest:
        StorageService().getBool(StorageKeys.completedTest_13) ?? false,
    completedTheory:
        StorageService().getBool(StorageKeys.completedTheory_13) ?? false,
  ),
  QuizModel(
    id: 13,
    title: 'Real Estate Investment: Purchase, Rent, Development',
    theoryText: [
      TextHelper.theoryText_14_1,
      TextHelper.theoryText_14_2,
      TextHelper.theoryText_14_3,
      TextHelper.theoryText_14_4,
    ],
    questions: questions_14,
    completedTest:
        StorageService().getBool(StorageKeys.completedTest_14) ?? false,
    completedTheory:
        StorageService().getBool(StorageKeys.completedTheory_14) ?? false,
  ),
  QuizModel(
    id: 14,
    title: 'Investing in Art and Collectibles',
    theoryText: [
      TextHelper.theoryText_15_1,
      TextHelper.theoryText_15_2,
      TextHelper.theoryText_15_3,
      TextHelper.theoryText_15_4,
    ],
    questions: questions_15,
    completedTest:
        StorageService().getBool(StorageKeys.completedTest_15) ?? false,
    completedTheory:
        StorageService().getBool(StorageKeys.completedTheory_15) ?? false,
  ),
  QuizModel(
    id: 15,
    title: 'Pension Planning and Investments',
    theoryText: [
      TextHelper.theoryText_16_1,
      TextHelper.theoryText_16_2,
      TextHelper.theoryText_16_3,
      TextHelper.theoryText_16_4,
    ],
    questions: questions_16,
    completedTest:
        StorageService().getBool(StorageKeys.completedTest_16) ?? false,
    completedTheory:
        StorageService().getBool(StorageKeys.completedTheory_16) ?? false,
  ),
  QuizModel(
    id: 16,
    title: 'Investing in Gold and Precious Metals',
    theoryText: [
      TextHelper.theoryText_17_1,
      TextHelper.theoryText_17_2,
      TextHelper.theoryText_17_3,
      TextHelper.theoryText_17_4,
    ],
    questions: questions_17,
    completedTest:
        StorageService().getBool(StorageKeys.completedTest_17) ?? false,
    completedTheory:
        StorageService().getBool(StorageKeys.completedTheory_17) ?? false,
  ),
  QuizModel(
    id: 17,
    title: 'Investing in Funds and ETFs (Exchange-Traded Funds)',
    theoryText: [
      TextHelper.theoryText_18_1,
      TextHelper.theoryText_18_2,
      TextHelper.theoryText_18_3,
      TextHelper.theoryText_18_4,
    ],
    questions: questions_18,
    completedTest:
        StorageService().getBool(StorageKeys.completedTest_18) ?? false,
    completedTheory:
        StorageService().getBool(StorageKeys.completedTheory_18) ?? false,
  ),
  QuizModel(
    id: 18,
    title:
        'Social Investing: Contribution to Charity and Sustainable Development',
    theoryText: [
      TextHelper.theoryText_19_1,
      TextHelper.theoryText_19_2,
      TextHelper.theoryText_19_3,
    ],
    questions: questions_19,
    completedTest:
        StorageService().getBool(StorageKeys.completedTest_19) ?? false,
    completedTheory:
        StorageService().getBool(StorageKeys.completedTheory_19) ?? false,
  ),
  QuizModel(
    id: 19,
    title: 'Investing in Education and Personal Growth',
    theoryText: [
      TextHelper.theoryText_20_1,
      TextHelper.theoryText_20_2,
      TextHelper.theoryText_20_3,
    ],
    questions: questions_20,
    completedTest:
        StorageService().getBool(StorageKeys.completedTest_20) ?? false,
    completedTheory:
        StorageService().getBool(StorageKeys.completedTheory_20) ?? false,
  ),
];
