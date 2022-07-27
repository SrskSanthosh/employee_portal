import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String title;
  final TextStyle textStyle;
  final EdgeInsets margin;
  final TextAlign? align;

  const CustomTextWidget({
    Key? key,
    required this.title,
    required this.textStyle,
    required this.margin,
    this.align = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = Text(
      title,
      style: textStyle,
      textAlign: align,
    );
    final padding = Padding(
      padding: margin,
      child: text,
    );
    return padding;
  }
}
