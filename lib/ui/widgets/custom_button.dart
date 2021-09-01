import 'package:flutter/material.dart';
import 'package:airplane/shared/theme.dart';

class CustomBtn extends StatelessWidget {
  final String title;
  final double width;
  final VoidCallback onPressed;
  final EdgeInsets margin;

  const CustomBtn({
    Key? key,
    required this.title,
    this.width = double.infinity,
    required this.onPressed,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: width,
      margin: margin,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          backgroundColor: purpleColor,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: btnTextStyle,
        ),
      ),
    );
  }
}
