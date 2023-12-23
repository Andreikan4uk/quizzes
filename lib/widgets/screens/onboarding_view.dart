import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz_app/generated/assets.gen.dart';
import 'package:quiz_app/navigation/route_names.dart';
import 'package:quiz_app/services/storage/storage_service.dart';
import 'package:quiz_app/widgets/components/custom_button.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int _currentStep = 0;

  final _storageService = GetIt.instance<StorageService>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _navigate());
  }

  void _navigate() {
    final isFirstLaunch =
        _storageService.getBool(StorageKeys.isFirstLaunch) ?? true;
    if (isFirstLaunch) {
      _storageService.setBool(StorageKeys.isFirstLaunch, false);
    } else {
      Navigator.of(context).pushReplacementNamed(RouteNames.main);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                Image.asset('assets/images/onboarding_${_currentStep + 1}.png')
                    .image,
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Visibility(
                visible: _currentStep == 0,
                child: Align(
                  alignment: Alignment(-1, -0.4),
                  child: Text(
                    'Let’s\nstart\ninvesting',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              ),
              Align(
                alignment: getAlignment(),
                child: RichText(
                  text: getTextSpan(),
                  textAlign: getTextAlign(),
                ),
              ),
              Align(
                alignment: const Alignment(0, 0.8),
                child: _currentStep < 2
                    ? CustomButtonOnb(
                        onPressed: () => setState(() => _currentStep++))
                    : CustomButton(
                        text: _currentStep == 4 ? 'Get started' : 'Next',
                        onPressed: () => setState(
                          () {
                            if (_currentStep == 4) {
                              Navigator.of(context)
                                  .pushReplacementNamed(RouteNames.main);
                            } else {
                              _currentStep++;
                            }
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextAlign getTextAlign() {
    if (_currentStep < 2 || _currentStep == 4) {
      return TextAlign.center;
    } else {
      return TextAlign.start;
    }
  }

  Alignment getAlignment() {
    if (_currentStep < 2) {
      return Alignment(0, 0.15);
    } else if (_currentStep == 2) {
      return Alignment(-0.8, -0.5);
    } else if (_currentStep == 3) {
      return Alignment(0.8, -0.9);
    } else {
      return Alignment(0, 0.1);
    }
  }

  InlineSpan getTextSpan() {
    if (_currentStep == 0) {
      return getTextOnb_1();
    } else if (_currentStep == 1) {
      return getTextOnb_2();
    } else if (_currentStep == 2) {
      return getTextOnb_3();
    } else if (_currentStep == 3) {
      return getTextOnb_4();
    } else {
      return getTextOnb_5();
    }
  }

  TextSpan getTextOnb_5() {
    return TextSpan(
      children: [
        TextSpan(
          text: 'Making finance more\naccessible,transparent,\nand fair.',
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ],
    );
  }

  TextSpan getTextOnb_4() {
    return TextSpan(
      children: [
        TextSpan(
            text: 'Stay up to\ndate with\ncurrent news\n',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Theme.of(context).colorScheme.primary)),
        TextSpan(
            text:
                'See the latest investment\nnews and stay up to date with\nall the latest developments.',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: Colors.white)),
      ],
    );
  }

  TextSpan getTextOnb_3() {
    return TextSpan(
      children: [
        TextSpan(
            text: 'Stay top of\nthe market\n',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Theme.of(context).colorScheme.primary)),
        TextSpan(
            text:
                'See world price statistics\nin our app and stay up to\ndate with current values.',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: Colors.white)),
      ],
    );
  }

  TextSpan getTextOnb_2() {
    return TextSpan(
      children: [
        TextSpan(
          text: 'Investment are in high\ndemand at this time\n',
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: Colors.black),
        ),
        TextSpan(
          text:
              'We provide you with funds to build\nyour best portfolio as a medium risk.',
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.black),
        ),
      ],
    );
  }

  TextSpan getTextOnb_1() {
    return TextSpan(
      children: [
        TextSpan(
          text: 'Want to start investing?\n',
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: Colors.black),
        ),
        TextSpan(
          text:
              'Empowering Your Investment Journey:\nEasy Start, Tailored Solutions!',
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.black),
        ),
      ],
    );
  }
}

class CustomButtonOnb extends StatelessWidget {
  final VoidCallback onPressed;
  CustomButtonOnb({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.onboardButton1.provider(),
          ),
        ),
        child: Center(
          child: Assets.icons.buttonIcon1.svg(),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
