class RouteException implements Exception {
  String message;

  RouteException([this.message = 'Somthing went wrong']) {
    message = 'Route Exception: $message';
  }

  @override
  String toString() => message;
}
