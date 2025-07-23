import 'package:vpn_app/data/models/country_model.dart';
import 'package:vpn_app/domain/entity/connection_stats_entity.dart';

class ConnectionStatsModel extends ConnectionStatsEntity {
  const ConnectionStatsModel({
    required super.downloadSpeed,
    required super.uploadSpeed,
    required super.connectedTime,
    super.connectedCountry,
    });
  
  static  Duration parseDuration(String timeString) {
      final parts = timeString.split(':');
      if (parts.length != 3) return Duration.zero;

      final hours = int.tryParse(parts[0]) ?? 0;
      final minutes = int.tryParse(parts[1]) ?? 0;
      final seconds = int.tryParse(parts[2]) ?? 0;
      return Duration(hours: hours, minutes: minutes, seconds: seconds);
  }

  factory ConnectionStatsModel.fromJson(Map<String, dynamic> map) => ConnectionStatsModel(
    downloadSpeed: map['downloadSpeed'] as int,
    uploadSpeed: map['uploadSpeed'] as int,
    connectedTime: parseDuration(map['connectedTime'] as String),
    connectedCountry: map['connectedCountry'] != null
      ? CountryModel.fromJson(map['connectedCountry'])
      : null,
    );
  

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