import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:quiz_app/generated/assets.gen.dart';
import 'package:quiz_app/helpers/text_helper.dart';
import 'package:quiz_app/navigation/route_names.dart';
import 'package:quiz_app/widgets/components/custom_appbar.dart';
import 'package:quiz_app/widgets/components/custom_button.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  int currentRating = 5;
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
                    'Settings',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 10),
              _CustomButton(
                icon: Assets.icons.worldSignals.svg(),
                buttonText: 'World Signals',
                onPressed: () =>
                    Navigator.of(context).pushNamed(RouteNames.worldSignal),
              ),
              SizedBox(height: 20),
              _CustomButton(
                icon: Assets.icons.privacyPolicy.svg(),
                buttonText: 'Privacy Policy',
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => DialogPrivacyTerms(
                      title: 'Privacy Policy',
                      text: TextHelper.privacyPolicyText,
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              _CustomButton(
                icon: Assets.icons.termsOfUse.svg(),
                buttonText: 'Terms of use',
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => DialogPrivacyTerms(
                      title: 'Terms of use',
                      text: TextHelper.terms,
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              _CustomButton(
                icon: Assets.icons.rateApp.svg(),
                buttonText: 'Rate app',
                onPressed: () => showRating(),
              ),
              SizedBox(height: 20),
              _CustomButton(
                icon: Assets.icons.support.svg(),
                buttonText: 'Support',
                onPressed: () =>
                    Navigator.of(context).pushNamed(RouteNames.feedbackView),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showRating() async {
    showDialog(
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white),
                color: Colors.white.withOpacity(0.26),
              ),
              child: Column(
                children: [
                  Text(
                    'Please rate us!',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    TextHelper.rateUsText,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  RatingBar.builder(
                    minRating: 1,
                    initialRating: currentRating.toDouble(),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    unratedColor: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.4),
                    onRatingUpdate: (rating) =>
                        setState(() => currentRating = rating.toInt()),
                    itemSize: 50,
                  ),
                  SizedBox(height: 10),
                  CustomButton(
                    onPressed: () async {
                      final inAppReview = InAppReview.instance;
                      await inAppReview.openStoreListing(
                        appStoreId: '6474505287',
                      );
                      Navigator.of(context).pop();
                    },
                    text: 'Rate',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DialogPrivacyTerms extends StatelessWidget {
  final String title;
  final String text;
  DialogPrivacyTerms({
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Colors.black),
              ),
              Spacer(),
              DialogBackButton(),
            ],
          ),
          SizedBox(height: 15),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DialogBackButton extends StatelessWidget {
  const DialogBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: Navigator.of(context).pop,
        borderRadius: BorderRadius.circular(20),
        child: const Icon(
          Icons.close,
          color: Colors.black,
          size: 30,
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  final String buttonText;
  final Widget icon;
  final VoidCallback? onPressed;

  _CustomButton({
    required this.icon,
    required this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Row(
        children: [
          icon,
          SizedBox(width: 5),
          Text(
            buttonText,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
