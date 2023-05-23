class WeatherException implements Exception {
  String message;

  WeatherException([this.message = 'Somthing went wrong']) {
    message = 'Weather Exception: $message';
  }

  @override
  String toString() => message;
}
