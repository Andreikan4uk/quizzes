import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:quiz_app/generated/assets.gen.dart';
import 'package:quiz_app/helpers/text_helper.dart';
import 'package:quiz_app/navigation/route_names.dart';
import 'package:quiz_app/widgets/components/custom_appbar.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
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
                  onPressed: () async {
                    if (await InAppReview.instance.isAvailable()) {
                      await InAppReview.instance.requestReview();
                    }
                  }),
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
