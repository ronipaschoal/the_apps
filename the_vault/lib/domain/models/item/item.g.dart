// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  type: json['type'] as String,
  icon: json['icon'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'type': instance.type,
  'icon': instance.icon,
  'image': instance.image,
};
