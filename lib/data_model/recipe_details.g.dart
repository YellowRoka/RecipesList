// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JSONRecipeDetails _$JSONRecipeDetailsFromJson(Map<String, dynamic> json) =>
    JSONRecipeDetails(
      json['id'] as String,
      json['imageUrl'] as String,
      (json['ingredients'] as List<dynamic>)
          .map((e) => e == null ? null : IngredientsData.fromJson(e))
          .toList(),
      json['kcal'] as int,
      json['minutes'] as int,
      json['name'] as String,
      json['steps'] as String,
    );

Map<String, dynamic> _$JSONRecipeDetailsToJson(JSONRecipeDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'ingredients': instance.ingredients,
      'kcal': instance.kcal,
      'minutes': instance.minutes,
      'name': instance.name,
      'steps': instance.steps,
    };

IngredientsData _$IngredientsDataFromJson(Map<String, dynamic> json) =>
    IngredientsData(
      json['ing_measure'] as int?,
      json['ing_name'] as String,
      json['ing_unit'] as String?,
    );

Map<String, dynamic> _$IngredientsDataToJson(IngredientsData instance) =>
    <String, dynamic>{
      'ing_measure': instance.ingMeasure,
      'ing_name': instance.ingName,
      'ing_unit': instance.ingUnit,
    };
