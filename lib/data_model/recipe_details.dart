import 'package:json_annotation/json_annotation.dart';


part 'recipe_details.g.dart';

//flutter pub run build_runner watch

class RecipeDetailsData{
  final String                 id;
  final String                 imageUrl;
  final List<IngredientsData?> ingredients;
  final int                    kcal;
  final int                    minutes;
  final String                 name;
  final String                 steps;

  RecipeDetailsData(this.id, this.imageUrl, this.ingredients, this.kcal, this.minutes, this.name, this.steps);
}

@JsonSerializable()
class JSONRecipeDetails extends RecipeDetailsData{

  JSONRecipeDetails(String id, String imageUrl, List<IngredientsData?> ingredients, int kcal, int minutes, String name, String steps) :
    super (id, imageUrl, ingredients, kcal, minutes, name, steps);

  dynamic toJson() => _$JSONRecipeDetailsToJson(this);
  factory JSONRecipeDetails.fromJson(dynamic json) => _$JSONRecipeDetailsFromJson(json);
}

@JsonSerializable()
class IngredientsData {
  @JsonKey(name: "ing_measure") final int?    ingMeasure;
  @JsonKey(name: "ing_name")    final String  ingName;
  @JsonKey(name: "ing_unit")    final String? ingUnit;

  IngredientsData(this.ingMeasure, this.ingName, this.ingUnit);

  dynamic toJson() => _$IngredientsDataToJson(this);
  factory IngredientsData.fromJson(dynamic json) =>_$IngredientsDataFromJson(json);
}
