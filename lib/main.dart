import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'core/constants/strings.dart';
import 'data/data%20providers/weather_api_services.dart';
import 'data/repositories/weather_repository.dart';
import 'logic/blocs/blocs.dart';
import 'presentation/router/app_router.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(
        weatherApiServices: WeatherApiServices(
          httpClient: http.Client(),
        ),
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<WeatherBloc>(
            create: (context) => WeatherBloc(
              weatherRepository: context.read<WeatherRepository>(),
            ),
          ),
          BlocProvider<TempSettingBloc>(
            create: (context) => TempSettingBloc(),
          ),
          BlocProvider<BackgroundBloc>(
            create: (context) => BackgroundBloc(
              weatherBloc: context.read<WeatherBloc>(),
            ),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Constant.appTitle,
          initialRoute: AppRouter.weatherScreen,
          onGenerateRoute: AppRouter.onGenerateRoute,
          theme: FlexThemeData.light(scheme: FlexScheme.aquaBlue),
        ),
      ),
    );
  }
}
