part of 'background_bloc.dart';

abstract class BackgroundEvent extends Equatable {
  const BackgroundEvent();

  @override
  List<Object> get props => [];
}

class ChangeBackgroundEvent extends BackgroundEvent {
  final WeatherScene weatherScene;

  const ChangeBackgroundEvent({required this.weatherScene});
}
