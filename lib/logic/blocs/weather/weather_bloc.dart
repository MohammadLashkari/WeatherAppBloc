import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_cubit/data/repositories/weather_repository.dart';
import '../../../models/custom_error.dart';
import '../../../models/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({
    required this.weatherRepository,
  }) : super(
          WeatherState.initial(),
        ) {
    on<FetchWeatherEvent>(_onFetchWeather);
  }

  Future<void> _onFetchWeather(
    FetchWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(
      state.copyWith(status: WeatherStatus.loading),
    );

    try {
      final Weather weather = await weatherRepository.fetchWeather(event.city);
      emit(
        state.copyWith(status: WeatherStatus.loaded, weather: weather),
      );
    } on CustomError catch (e) {
      emit(
        state.copyWith(status: WeatherStatus.error, error: e),
      );
    }
  }
}
