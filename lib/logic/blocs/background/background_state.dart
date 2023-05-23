part of 'background_bloc.dart';

class BackgroundState extends Equatable {
  final WeatherScene weatherScene;

  const BackgroundState({required this.weatherScene});

  factory BackgroundState.initial() {
    return const BackgroundState(weatherScene: WeatherScene.weatherEvery);
  }
  @override
  List<Object> get props => [weatherScene];

  @override
  bool get stringify => true;

  BackgroundState copyWith({
    WeatherScene? weatherScene,
  }) {
    return BackgroundState(
      weatherScene: weatherScene ?? this.weatherScene,
    );
  }
}
