import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../core/constants/strings.dart';
import '../../core/exceptions/weather_exception.dart';
import '../../models/direct_geocoding.dart';
import '../data%20providers/http_error_handler.dart';

import '../../models/weather.dart';

class WeatherApiServices {
  final http.Client httpClient;

  WeatherApiServices({
    required this.httpClient,
  });

  Future<DirectGeocoding> getDirectGeocoding(String city) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: Constant.kApiHost,
      path: '/geo/1.0/direct',
      queryParameters: {
        'q': city,
        'limit': Constant.kLimit,
        'appid': dotenv.env['APPID'],
      },
    );

    try {
      final http.Response response = await httpClient.get(uri);
      if (response.statusCode != 200) {
        throw httpErrorHandler(response);
      }
      final responseBody = json.decode(response.body);
      if (responseBody.isEmpty) {
        throw WeatherException('Cannot get the location of $city');
      }
      final DirectGeocoding directGeocoding =
          DirectGeocoding.fromJson(responseBody);
      return directGeocoding;
    } catch (e) {
      rethrow;
    }
  }

  Future<Weather> getWeather(DirectGeocoding directGeocoding) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: Constant.kApiHost,
      path: '/data/2.5/weather',
      queryParameters: {
        'lat': '${directGeocoding.lat}',
        'lon': '${directGeocoding.lon}',
        'units': Constant.kUnit,
        'appid': dotenv.env['APPID'],
      },
    );

    try {
      final http.Response response = await httpClient.get(uri);
      if (response.statusCode != 200) {
        throw httpErrorHandler(response);
      }
      final responseBody = json.decode(response.body);
      final Weather weather = Weather.fromJson(responseBody);
      return weather;
    } catch (e) {
      rethrow;
    }
  }
}
