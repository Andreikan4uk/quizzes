import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/theme/custom_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? disabledColor;
  CustomButton({
    required this.onPressed,
    required this.text,
    this.disabledColor,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      borderRadius: BorderRadius.circular(30),
      padding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
            color: disabledColor ??
                Theme.of(context).extension<CustomColors>()!.buttonOnbColor,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(30)),
        width: 158,
        height: 50,
        child: Center(
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
