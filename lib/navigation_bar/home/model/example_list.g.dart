// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExampleList _$ExampleListFromJson(Map<String, dynamic> json) => ExampleList(
      year: json['year'] as int?,
      id: json['id'] as int?,
      horsepower: json['horsepower'] as int?,
      make: json['make'] as String?,
      model: json['model'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      imgUrl: json['imgUrl'] as String?,
    );

Map<String, dynamic> _$ExampleListToJson(ExampleList instance) =>
    <String, dynamic>{
      'year': instance.year,
      'id': instance.id,
      'horsepower': instance.horsepower,
      'make': instance.make,
      'model': instance.model,
      'price': instance.price,
      'imgUrl': instance.imgUrl,
    };
