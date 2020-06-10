import 'package:flutter/material.dart';

class TextWithYellowUnderline extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color underlineColor;

  const TextWithYellowUnderline(this.text, {Key key, this.style, this.underlineColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(  
            width: 2,
            color: this.underlineColor == null ? Theme.of(context).primaryColor : this.underlineColor
          )
        )
      ),
      child: Text(
        text,
        style: this.style,
      ),
    );
  }
}