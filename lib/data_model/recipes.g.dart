// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JSONRecipeData _$JSONRecipeDataFromJson(Map<String, dynamic> json) =>
    JSONRecipeData(
      json['id'] as int,
      json['imageUrl'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$JSONRecipeDataToJson(JSONRecipeData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
    };
