import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final List<Widget> children;
  CustomAppBar({
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(children: children),
          ),
          Spacer(),
          Divider(),
        ],
      ),
    );
  }
}
