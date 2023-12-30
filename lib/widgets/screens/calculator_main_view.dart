import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/generated/assets.gen.dart';
import 'package:quiz_app/navigation/route_names.dart';
import 'package:quiz_app/widgets/components/custom_appbar.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
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
                  Text(
                    'Finance Management',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1.49,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Assets.images.frameCalculaterView.provider(),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Want to know more\nabout financial\nmanagement?',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: Colors.black),
                            ),
                            Text(
                              'Take lesson №4 and be\nat all arms in this matter',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: Colors.black),
                            ),
                            Spacer(),
                            CupertinoButton(
                              borderRadius: BorderRadius.circular(30),
                              padding: EdgeInsets.zero,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.black),
                                ),
                                width: 158,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    'Explore',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(color: Colors.black),
                                  ),
                                ),
                              ),
                              onPressed: null,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Card(
                      elevation: 0,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        leading: Assets.icons.creditCalculator.svg(),
                        title: Text(
                          'Credit calculator',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white),
                        ),
                        subtitle: Text(
                          'Loan repayment calculation',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: Colors.white),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          size: 40,
                        ),
                        onTap: () => Navigator.of(context)
                            .pushNamed(RouteNames.creditCalculator),
                      ),
                    ),
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
