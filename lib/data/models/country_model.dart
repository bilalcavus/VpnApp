import 'package:vpn_app/domain/entity/country_entity.dart';

class CountryModel extends CountryEntity {
  const CountryModel
  (
    {
    required super.name,
    required super.flag,
    super.city,
    required super.locationCount,
    required super.strength,
    required super.isConnected
    }
  );

  factory CountryModel.fromJson(Map<String, dynamic> map) => CountryModel(
    name: map['name'] as String,
    flag: map['flag'] as String,
    city: map['city'] as String?,
    locationCount: map['locationCount'] as int,
    strength: map['strength'] as int,
    isConnected: map['isConnected'] as bool);

    factory CountryModel.fromEntity(CountryEntity entity) => CountryModel(
      name: entity.name,
      flag: entity.flag,
      locationCount: entity.locationCount,
      strength: entity.strength,
      isConnected: entity.isConnected
    );
}