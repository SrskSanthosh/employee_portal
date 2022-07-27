import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final Color primaryColor;
  final Color surfaceColor;
  final TextStyle buttonTestStyle;
  final EdgeInsets buttonMargin;
  final EdgeInsets buttonPadding;
  final String buttonName;
  final double buttonHeight;
  final double buttonWidth;
  final double buttonCornerRadius;
  final Color buttonBorderColor;
  final double textScaleFactor;

  CustomButton({
    required this.primaryColor,
    required this.surfaceColor,
    required this.buttonTestStyle,
    required this.buttonName,
    required this.buttonMargin,
    required this.buttonPadding,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.buttonCornerRadius,
    required this.buttonBorderColor,
    required this.onPressed,
    required this.textScaleFactor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight,
      width: buttonWidth,
      margin: buttonMargin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(buttonCornerRadius),
          gradient: LinearGradient(
            colors: [primaryColor, surfaceColor],
            begin: FractionalOffset.centerLeft,
            end: FractionalOffset.centerRight,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 0.5,
            )
          ]),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          buttonName,
          textAlign: TextAlign.center,
          textScaleFactor: textScaleFactor,
          style: buttonTestStyle,
        ),
      ),
    );
  }
}
