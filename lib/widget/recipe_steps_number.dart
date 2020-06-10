import 'package:flutter/material.dart';

class RecipeStep extends StatelessWidget {
  final String number;
  RecipeStep(this.number);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Center(
        child: Text(
          this.number,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
            fontSize: 18
          ),
        ),
      ),
    );
  }
}