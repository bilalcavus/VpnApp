import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final String name;
  final String flag;
  final String? city;
  final int locationCount;
  final int strength;
  final bool isConnected;

  const CountryEntity({
    required this.name,
    required this.flag,
    this.city,
    required this.locationCount,
    required this.strength,
    required this.isConnected
  });
  @override
  List<Object?> get props => [
    name,
    flag,
    city,
    locationCount,
    strength,
    isConnected
  ];
}