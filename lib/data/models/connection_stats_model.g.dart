// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConnectionStatsModel _$ConnectionStatsModelFromJson(
        Map<String, dynamic> json) =>
    ConnectionStatsModel(
      downloadSpeed: (json['downloadSpeed'] as num).toInt(),
      uploadSpeed: (json['uploadSpeed'] as num).toInt(),
      connectedTime:
          Duration(microseconds: (json['connectedTime'] as num).toInt()),
      connectedCountry: json['connectedCountry'] == null
          ? null
          : CountryModel.fromJson(
              json['connectedCountry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConnectionStatsModelToJson(
        ConnectionStatsModel instance) =>
    <String, dynamic>{
      'downloadSpeed': instance.downloadSpeed,
      'uploadSpeed': instance.uploadSpeed,
      'connectedTime': instance.connectedTime.inMicroseconds,
      'connectedCountry': instance.connectedCountry?.toJson(),
    };
