import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/generated/assets.gen.dart';
import 'package:quiz_app/helpers/email_helper.dart';
import 'package:quiz_app/widgets/components/custom_back_button.dart';
import 'package:quiz_app/widgets/components/custom_button.dart';

final _formKeyMessage = GlobalKey<FormState>();
final _formKeyEmail = GlobalKey<FormState>();
final _formKeySubject = GlobalKey<FormState>();

class FeedbackView extends StatelessWidget {
  FeedbackView({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController textController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.bgAll.provider(),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    const CustomBackButton(),
                    Spacer(flex: 4),
                    Text('Support',
                        style: Theme.of(context).textTheme.labelLarge),
                    Spacer(flex: 5),
                  ],
                ),
                SizedBox(height: 130),
                _buildForm(
                  context: context,
                  key: _formKeyMessage,
                  controller: textController,
                  hintText: 'Message text',
                  validator: checkMessage,
                ),
                SizedBox(height: 20),
                _buildForm(
                  context: context,
                  key: _formKeyEmail,
                  controller: emailController,
                  hintText: 'Your email',
                  keyboardType: TextInputType.emailAddress,
                  validator: checkEmail,
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'the answer will be sent to this email',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: Colors.white.withOpacity(0.5)),
                  ),
                ),
                SizedBox(height: 20),
                _buildForm(
                  context: context,
                  key: _formKeySubject,
                  controller: subjectController,
                  hintText: 'Subject of the message',
                  keyboardType: TextInputType.text,
                  validator: checkSubject,
                ),
                SizedBox(height: 30),
                CustomButton(
                  text: 'Send',
                  onPressed: () async {
                    if (_formKeyMessage.currentState!.validate() &&
                        _formKeyEmail.currentState!.validate() &&
                        _formKeySubject.currentState!.validate()) {
                      await _send(context);
                      _clearControllers();
                      _showSuccessDialog(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm({
    required BuildContext context,
    required GlobalKey<FormState> key,
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
  }) {
    return Form(
      key: key,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: Colors.white.withOpacity(0.5)),
        ),
        validator: validator,
      ),
    );
  }

  void _clearControllers() {
    textController.clear();
    emailController.clear();
    subjectController.clear();
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 350,
              height: 150,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white),
                color: Colors.white.withOpacity(0.26),
              ),
              child: Center(
                child: Text(
                  'The action has been\ncompleted successfully',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _send(context) async => await EmailHelper.launchEmailSubmission(
        toEmail: 'phamninhhoang697@gmail.com',
        subject: subjectController.text,
        body: textController.text,
        errorCallback: () => showDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            content: Text(
              'Some error has occured. Please\ntry again.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            actions: [
              CupertinoActionSheetAction(
                onPressed: Navigator.of(context).pop,
                child: Text('OK'),
              ),
            ],
          ),
        ),
        doneCallback: Navigator.of(context).pop,
      );

  String? checkEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email';
    }
    return null;
  }

  String? checkMessage(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter message';
    }
    return null;
  }

  String? checkSubject(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the subject of the message';
    }
    return null;
  }
}
