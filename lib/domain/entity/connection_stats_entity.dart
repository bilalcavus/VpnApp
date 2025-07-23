import 'package:equatable/equatable.dart';
import 'package:vpn_app/data/models/country_model.dart';

class ConnectionStatsEntity extends Equatable {
  final int downloadSpeed;
  final int uploadSpeed;
  final Duration connectedTime;
  final CountryModel? connectedCountry;

  const ConnectionStatsEntity({
    required this.downloadSpeed,
    required this.uploadSpeed,
    required this.connectedTime,
    this.connectedCountry,
  });
  @override
  List<Object?> get props => [
    downloadSpeed,
    uploadSpeed,
    connectedTime,
    connectedCountry,
  ];
  
}