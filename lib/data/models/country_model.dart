import 'package:vpn_app/domain/entity/country_entity.dart';

class CountryModel extends CountryEntity {
  const CountryModel({
    required super.name,
    required super.flag,
    super.city,
    required super.locationCount,
    required super.strength,
    required super.isConnected,
  });

  factory CountryModel.fromJson(Map<String, dynamic> map) {
    return CountryModel(
      name: map['name'] as String,
      flag: map['flag'] as String,
      city: map['city'] as String? ?? '',
      locationCount: map['locationCount'] as int,
      strength: map['strength'] as int,
      isConnected: map['isConnected'] as bool? ?? false,
    );
  }

  factory CountryModel.fromEntity(CountryEntity entity) {
    return CountryModel(
      name: entity.name,
      flag: entity.flag,
      city: entity.city,
      locationCount: entity.locationCount,
      strength: entity.strength,
      isConnected: entity.isConnected,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'flag': flag,
      'city': city,
      'locationCount': locationCount,
      'strength': strength,
      'isConnected': isConnected,
    };
  }

  CountryModel copyWith({
    String? name,
    String? flag,
    String? city,
    int? locationCount,
    int? strength,
    bool? isConnected,
  }) {
    return CountryModel(
      name: name ?? this.name,
      flag: flag ?? this.flag,
      city: city ?? this.city,
      locationCount: locationCount ?? this.locationCount,
      strength: strength ?? this.strength,
      isConnected: isConnected ?? this.isConnected,
    );
  }
}
