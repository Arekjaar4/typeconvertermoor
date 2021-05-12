// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagesProducts _$ImagesProductsFromJson(Map<String, dynamic> json) {
  return ImagesProducts(
    (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ImagesProductsToJson(ImagesProducts instance) =>
    <String, dynamic>{
      'images': instance.images,
    };
