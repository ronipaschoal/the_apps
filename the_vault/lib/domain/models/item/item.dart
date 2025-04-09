import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  String id;
  String name;
  String description;
  String type;
  String? icon;
  String? image;
  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    this.icon,
    this.image,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
