import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final int id;
  final String description;
  final String icon;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String name;
  final String country;
  final DateTime lastUpdated;

  const Weather({
    required this.id,
    required this.description,
    required this.icon,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.name,
    required this.country,
    required this.lastUpdated,
  });

  factory Weather.initial() {
    return Weather(
      id: 800,
      description: '',
      icon: '',
      temp: 100.0,
      tempMin: 100.0,
      tempMax: 100.0,
      name: '',
      country: '',
      lastUpdated: DateTime(1970),
    );
  }

  factory Weather.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    final main = json['main'];
    return Weather(
      id: weather['id'],
      description: weather['description'],
      icon: weather['icon'],
      temp: main['temp'],
      tempMin: main['temp_min'],
      tempMax: main['temp_max'],
      name: '',
      country: '',
      lastUpdated: DateTime.now(),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      description,
      icon,
      temp,
      tempMin,
      tempMax,
      name,
      country,
      lastUpdated
    ];
  }

  Weather copyWith({
    int? id,
    String? description,
    String? icon,
    double? temp,
    double? tempMin,
    double? tempMax,
    String? name,
    String? country,
    DateTime? lastUpdated,
  }) {
    return Weather(
      id: id ?? this.id,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      temp: temp ?? this.temp,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      name: name ?? this.name,
      country: country ?? this.country,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}
