import 'package:flutter/material.dart';

class CustomImageWidget extends StatelessWidget {
  final String assetName;
  final EdgeInsets margin;
  final double height;
  final double width;
  final Alignment alignment;
  final BoxFit boxFit;

  const CustomImageWidget({
    Key? key,
    required this.assetName,
    required this.margin,
    required this.height,
    required this.width,
    required this.alignment,
    this.boxFit = BoxFit.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = Image.asset(
      assetName,
      height: height,
      width: width,
      fit: boxFit,
    );
    final padding = Padding(
      padding: margin,
      child: image,
    );
    return Align(
      alignment: alignment,
      child: padding,
    );
  }
}
