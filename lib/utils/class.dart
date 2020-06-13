import 'dart:ui';

class Nutrients {
  String name;
  String weight;
  double percent;
  Nutrients({this.name, this.weight, this.percent});
}

class Recipe{
  String id,imageUrl,title,time;
  Color color;
  List<String> steps;
  List<String> ingredients;
  List<Nutrients> nutrients;
  Recipe({this.id,this.title,this.imageUrl,this.steps,this.ingredients,this.nutrients,this.time, this.color});
}




class LocalRecipe{
  String id,imageUrl,title,time;
  Color color;
  List<String> steps;
  List<String> ingredients;
  List<Nutrients> nutrients;
   LocalRecipe({this.id,this.title,this.imageUrl,this.steps,this.ingredients,this.nutrients,this.time, this.color});
}
