import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_animation/weather_animation.dart';

import '../../../../logic/blocs/blocs.dart';

class WeatherBackground extends StatelessWidget {
  const WeatherBackground({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherScene weatherConditon =
        context.watch<BackgroundBloc>().state.weatherScene;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: weatherConditon.getWeather(),
    );
  }
}
