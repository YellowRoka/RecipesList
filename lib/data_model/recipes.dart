import 'package:json_annotation/json_annotation.dart';

part 'recipes.g.dart';

//flutter pub run build_runner watch
/*
class JSONRecipes{
  final List<RecipeData> recipes;

  JSONRecipes(this.recipes);
}
*/
class RecipeData{
  final int    id;
  final String imageUrl;
  final String name;

  RecipeData(this.id, this.imageUrl, this.name);
}

@JsonSerializable()
class JSONRecipeData extends RecipeData{

  JSONRecipeData(int id, String imageUrl, String name):super(id,imageUrl,name);

  dynamic toJson() => _$JSONRecipeDataToJson(this);
  factory JSONRecipeData.fromJson(dynamic json) => _$JSONRecipeDataFromJson(json);
}
