// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toInt(),
      thumbnail: json['thumbnail'] as String?,
      stock: (json['stock'] as num?)?.toInt(),
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'thumbnail': instance.thumbnail,
      'stock': instance.stock,
      'discountPercentage': instance.discountPercentage,
    };
