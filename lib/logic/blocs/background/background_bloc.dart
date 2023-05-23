import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:weather_animation/weather_animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../weather/weather_bloc.dart';

part 'background_event.dart';
part 'background_state.dart';

class BackgroundBloc extends Bloc<BackgroundEvent, BackgroundState> {
  final WeatherBloc weatherBloc;
  late final StreamSubscription weatherSubscription;

  BackgroundBloc({
    required this.weatherBloc,
  }) : super(
          BackgroundState.initial(),
        ) {
    weatherSubscription = weatherBloc.stream.listen(
      (WeatherState weatherState) {
        int weatherCod = weatherState.weather.id.digitAt(0);
        setBackground(weatherCod);
      },
    );
    on<ChangeBackgroundEvent>(_onChangeBackground);
  }

  void setBackground(int weatherCod) {
    switch (weatherCod) {
      case 1:
        add(
          const ChangeBackgroundEvent(weatherScene: WeatherScene.scorchingSun),
        );
        break;
      case 2:
        add(
          const ChangeBackgroundEvent(weatherScene: WeatherScene.stormy),
        );
        break;
      case 3:
        add(
          const ChangeBackgroundEvent(weatherScene: WeatherScene.frosty),
        );
        break;
      case 4:
        add(
          const ChangeBackgroundEvent(weatherScene: WeatherScene.rainyOvercast),
        );
        break;
      case 6:
        add(
          const ChangeBackgroundEvent(weatherScene: WeatherScene.snowfall),
        );
        break;
      case 7:
      case 8:
        add(
          const ChangeBackgroundEvent(weatherScene: WeatherScene.sunset),
        );
        break;
      default:
        add(
          const ChangeBackgroundEvent(weatherScene: WeatherScene.weatherEvery),
        );
    }
  }

  void _onChangeBackground(
    ChangeBackgroundEvent event,
    Emitter<BackgroundState> emit,
  ) {
    emit(
      state.copyWith(weatherScene: event.weatherScene),
    );
  }

  @override
  Future<void> close() {
    weatherSubscription.cancel();
    return super.close();
  }
}

extension DigitAtOnInt on int {
  int digitAt(int index) => int.parse(toString()[index]);
}
