import 'package:flutter/material.dart';

class XMargin extends StatelessWidget {
  final double width;
  XMargin(this.width);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0,
      width: this.width,
    );
  }
}

class YMargin extends StatelessWidget {
  final double height;
  YMargin(this.height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.height,
      width: 0,
    );
  }
}

