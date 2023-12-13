import 'package:json_annotation/json_annotation.dart';

part 'example_list.g.dart';

@JsonSerializable()
class ExampleList {
  int? year;
  int? id;
  int? horsepower;
  String? make;
  String? model;
  double? price;
  String? imgUrl;

  ExampleList({
    this.year,
    this.id,
    this.horsepower,
    this.make,
    this.model,
    this.price,
    this.imgUrl,
  });

  factory ExampleList.fromJson(Map<String, dynamic> json) =>
      _$ExampleListFromJson(json);
  Map<String, dynamic> toJson() => _$ExampleListToJson(this);
}
