import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:moor/moor.dart';

part 'images_products.g.dart';
@JsonSerializable()
class ImagesProducts {
  List<String> images;

  ImagesProducts(this.images);

  factory ImagesProducts.fromJson(Map<String, dynamic> json) => _$ImagesProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesProductsToJson(this);
}

class ImagesConverter extends TypeConverter<ImagesProducts, String> {
  const ImagesConverter();
  @override
  ImagesProducts mapToDart(String? fromDb) {
    return ImagesProducts.fromJson(json.decode(fromDb!) as Map<String, dynamic>);
  }

  @override
  String mapToSql(ImagesProducts? value) {
    return json.encode(value!.toJson());
  }
}
