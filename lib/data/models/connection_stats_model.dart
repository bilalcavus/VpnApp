import 'package:json_annotation/json_annotation.dart';
import 'package:vpn_app/data/models/country_model.dart';
import 'package:vpn_app/domain/entity/connection_stats_entity.dart';

part 'connection_stats_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ConnectionStatsModel extends ConnectionStatsEntity {
  const ConnectionStatsModel({
    required super.downloadSpeed,
    required super.uploadSpeed,
    required super.connectedTime,
    super.connectedCountry,
  });

  factory ConnectionStatsModel.fromJson(Map<String, dynamic> json) => _$ConnectionStatsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ConnectionStatsModelToJson(this);

  factory ConnectionStatsModel.fromEntity(ConnectionStatsEntity entity) => ConnectionStatsModel(
    downloadSpeed: entity.downloadSpeed,
    uploadSpeed: entity.uploadSpeed,
    connectedTime: entity.connectedTime,
    connectedCountry: entity.connectedCountry != null
        ? CountryModel.fromEntity(entity.connectedCountry!)
        : null,
  );

  ConnectionStatsModel copyWith({
    int? downloadSpeed,
    int? uploadSpeed,
    Duration? connectedTime,
    CountryModel? connectedCountry,
    bool resetConnectedCountry = false,
  }) {
    return ConnectionStatsModel(
      downloadSpeed: downloadSpeed ?? this.downloadSpeed,
      uploadSpeed: uploadSpeed ?? this.uploadSpeed,
      connectedTime: connectedTime ?? this.connectedTime,
      connectedCountry: resetConnectedCountry
        ? null
        : connectedCountry ?? this.connectedCountry,
    );
  }
}