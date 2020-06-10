

import 'package:flutter/material.dart';

double getScreenHeight(BuildContext context){
  return MediaQuery.of(context).size.height;
}

double getScreenWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}