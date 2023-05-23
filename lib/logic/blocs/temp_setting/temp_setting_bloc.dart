import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
part 'temp_setting_event.dart';
part 'temp_setting_state.dart';

class TempSettingBloc extends Bloc<TempSettingEvent, TempSettingState> {
  TempSettingBloc()
      : super(
          TempSettingState.initial(),
        ) {
    on<ToggleTempUnitEvent>(
      (_onToggleTempUnit),
    );
  }

  void _onToggleTempUnit(
    ToggleTempUnitEvent event,
    Emitter<TempSettingState> emit,
  ) {
    emit(
      state.copyWith(
        tempUnit: state.tempUnit == TempUnit.celsius
            ? TempUnit.fahrenheit
            : TempUnit.celsius,
      ),
    );
  }
}
