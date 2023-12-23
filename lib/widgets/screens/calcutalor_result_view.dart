import 'package:flutter/material.dart';
import 'package:quiz_app/generated/assets.gen.dart';
import 'package:quiz_app/widgets/components/custom_appbar.dart';
import 'package:quiz_app/widgets/components/custom_back_button.dart';

class CalculatorResultView extends StatelessWidget {
  const CalculatorResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final summ = arguments['summ'] as double;
    final rate = arguments['rate'] as double;
    final years = arguments['years'] as double;
    final credit = arguments['credit'] as double;
    final monthlyPayment = arguments['monthlyPayment'] as double;
    final overpaymentPercent = arguments['overpaymentPercent'] as double;
    final overpaymentNum = arguments['overpaymentNum'] as double;
    final progressValue = arguments['progressValue'] as double;
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
                    'Result',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.white),
                  ),
                  Spacer(flex: 5),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                child: Column(
                  children: [
                    LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(5.5),
                      minHeight: 15,
                      value: progressValue / 100,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          '${overpaymentPercent.toStringAsFixed(2)}% overpayment',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: Colors.red),
                        ),
                        Spacer(),
                        Text(
                          '${credit.toStringAsFixed(2)}% credit',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Credit data',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 10),
                    Report(
                      icon: Icons.brightness_1,
                      color: Theme.of(context).colorScheme.primary,
                      title: 'Credit',
                      value: '$summ \$',
                    ),
                    SizedBox(height: 10),
                    Report(
                      icon: Icons.brightness_1,
                      color: Colors.red,
                      title: 'Overpayment',
                      value: '$overpaymentNum \$',
                    ),
                    SizedBox(height: 20),
                    Report(title: 'Interest rate', value: '$rate %'),
                    SizedBox(height: 10),
                    Report(
                        title: 'Loan term',
                        value: '${years.toStringAsFixed(0)} years'),
                    SizedBox(height: 10),
                    Report(title: 'Type of payment', value: 'Annuitant'),
                    SizedBox(height: 10),
                    Report(
                        title: 'Monthly payment',
                        value: '${monthlyPayment.toStringAsFixed(2)} \$'),
                    SizedBox(height: 10),
                    Divider(),
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

class Report extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String value;
  final Color? color;
  Report({
    super.key,
    this.icon,
    required this.title,
    required this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null)
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(
              icon,
              color: color,
              size: 10,
            ),
          )
        else
          SizedBox.shrink(),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white),
        ),
        Spacer(),
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
