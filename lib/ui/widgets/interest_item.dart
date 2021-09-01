import 'package:flutter/material.dart';
import 'package:airplane/shared/theme.dart';

class InterestItem extends StatelessWidget {
  final text;

  const InterestItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/icon_check.png',
            height: 16,
            width: 16,
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            text,
            style: keyTextStyle,
          ),
        ],
      ),
    );
  }
}
