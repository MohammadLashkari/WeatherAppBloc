part of 'temp_setting_bloc.dart';

abstract class TempSettingEvent extends Equatable {
  const TempSettingEvent();

  @override
  List<Object> get props => [];
}

class ToggleTempUnitEvent extends TempSettingEvent {}
