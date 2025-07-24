// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) => CountryModel(
      name: json['name'] as String,
      flag: json['flag'] as String,
      city: json['city'] as String?,
      locationCount: (json['locationCount'] as num).toInt(),
      strength: (json['strength'] as num).toInt(),
      isConnected: json['isConnected'] as bool,
    );

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'flag': instance.flag,
      'city': instance.city,
      'locationCount': instance.locationCount,
      'strength': instance.strength,
      'isConnected': instance.isConnected,
    };
