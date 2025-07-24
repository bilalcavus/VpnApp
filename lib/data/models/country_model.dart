import 'package:json_annotation/json_annotation.dart';
import 'package:vpn_app/domain/entity/country_entity.dart';

part 'country_model.g.dart';

@JsonSerializable()
class CountryModel extends CountryEntity {
  const CountryModel({
    required super.name,
    required super.flag,
    super.city,
    required super.locationCount,
    required super.strength,
    required super.isConnected,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => _$CountryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CountryModelToJson(this);

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
