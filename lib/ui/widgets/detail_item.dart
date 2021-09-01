import 'package:flutter/material.dart';
import 'package:airplane/shared/theme.dart';

class DetailItem extends StatelessWidget {
  final String title;
  final String valueText;
  final Color valueColor;

  const DetailItem({
    Key? key,
    required this.title,
    required this.valueText,
    required this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
            title,
            style: keyTextStyle,
          ),
          Spacer(),
          Text(
            valueText,
            style: valueTextStyle.copyWith(
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
