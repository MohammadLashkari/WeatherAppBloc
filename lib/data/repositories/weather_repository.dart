import '../../models/custom_error.dart';
import '../../models/direct_geocoding.dart';

import '../../core/exceptions/weather_exception.dart';
import '../../models/weather.dart';
import '../data providers/weather_api_services.dart';

class WeatherRepository {
  final WeatherApiServices weatherApiServices;

  WeatherRepository({
    required this.weatherApiServices,
  });

  Future<Weather> fetchWeather(String city) async {
    try {
      final DirectGeocoding directGeocoding =
          await weatherApiServices.getDirectGeocoding(city);

      final Weather tempWeather =
          await weatherApiServices.getWeather(directGeocoding);

      final Weather weather = tempWeather.copyWith(
          name: directGeocoding.name, country: directGeocoding.country);

      return weather;
    } on WeatherException catch (e) {
      throw CustomError(errorMessage: e.message);
    } catch (e) {
      throw CustomError(errorMessage: e.toString());
    }
  }
}
