import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/generated/assets.gen.dart';
import 'package:quiz_app/navigation/route_names.dart';
import 'package:quiz_app/widgets/components/custom_appbar.dart';
import 'package:quiz_app/widgets/components/custom_back_button.dart';
import 'package:quiz_app/widgets/components/custom_button.dart';

final _formKeySumm = GlobalKey<FormState>();
final _formKeyYears = GlobalKey<FormState>();
final _formKeyRate = GlobalKey<FormState>();

class CreditCalculatorView extends StatefulWidget {
  const CreditCalculatorView({super.key});

  @override
  State<CreditCalculatorView> createState() => _CreditCalculatorViewState();
}

class _CreditCalculatorViewState extends State<CreditCalculatorView> {
  final TextEditingController principalController = TextEditingController();
  final TextEditingController yearsController = TextEditingController();
  final TextEditingController interestRateController = TextEditingController();

  double overpaymentNum = 0.0;
  double overpaymentPercent = 0.0;
  double progressValue = 0.0;
  double credit = 0.0;
  double monthlyPayment = 0.0;

  @override
  Widget build(BuildContext context) {
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
                  SizedBox(width: 20),
                  Text(
                    'Credit calculator',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Amount of credit',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        Form(
                          key: _formKeySumm,
                          child: TextFormField(
                            controller: principalController,
                            keyboardType: TextInputType.number,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: '100000.00',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Colors.black.withOpacity(0.3)),
                              suffixText: '\$',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            validator: (value) {
                              return checkSumm(value);
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Loan period',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        Form(
                          key: _formKeyYears,
                          child: TextFormField(
                            controller: yearsController,
                            keyboardType: TextInputType.number,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: '10',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Colors.black.withOpacity(0.3)),
                              suffixText: 'years',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            validator: (value) {
                              return checkYears(value);
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Annual rate',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        Form(
                          key: _formKeyRate,
                          child: TextFormField(
                            controller: interestRateController,
                            keyboardType: TextInputType.number,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: '10.0',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Colors.black.withOpacity(0.3)),
                              suffixText: 'rate',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            validator: (value) {
                              return checkRate(value);
                            },
                          ),
                        ),
                        SizedBox(height: 50),
                        CustomButton(
                          onPressed: () {
                            if (_formKeySumm.currentState!.validate() &&
                                _formKeyYears.currentState!.validate() &&
                                _formKeyRate.currentState!.validate()) {
                              calculateLoan();
                              Navigator.of(context).pushNamed(
                                RouteNames.calculatorResult,
                                arguments: {
                                  'summ':
                                      double.parse(principalController.text),
                                  'rate':
                                      double.parse(interestRateController.text),
                                  'years': double.parse(yearsController.text),
                                  'credit': credit,
                                  'monthlyPayment': monthlyPayment,
                                  'overpaymentNum': overpaymentNum,
                                  'overpaymentPercent': overpaymentPercent,
                                  'progressValue': progressValue,
                                },
                              );
                              principalController.clear();
                              yearsController.clear();
                              interestRateController.clear();
                            }
                            ;
                          },
                          text: 'Calculate',
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

  String? checkSumm(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the loan amount';
    }
    return null;
  }

  String? checkYears(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the loan term';
    }
    return null;
  }

  String? checkRate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the interest on the loan';
    }
    return null;
  }

  void calculateLoan() {
    double principal = double.parse(principalController.text);
    double interestRate = double.parse(interestRateController.text);
    double years = double.parse(yearsController.text);

    double monthlyInterestRate = interestRate / 1200;
    double numberOfPayments = years * 12;

    double denominator =
        1 - pow(1 + monthlyInterestRate, -numberOfPayments).toDouble();

    monthlyPayment = (principal * monthlyInterestRate) / denominator;
    double totalPayment = monthlyPayment * numberOfPayments;
    double totalInterest = totalPayment - principal;

    double overpaymentPercentage = (totalInterest / principal) * 100;
    double overpaymentNumeric = double.parse(totalInterest.toStringAsFixed(0));

    setState(() {
      progressValue =
          overpaymentPercentage <= 100.0 ? overpaymentPercentage : 100.0;
      overpaymentPercent = overpaymentPercentage;
      overpaymentNum = overpaymentNumeric;
      credit = 100.0 - overpaymentPercentage;
    });
  }
}
