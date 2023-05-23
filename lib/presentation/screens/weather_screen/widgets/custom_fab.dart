import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/blocs/blocs.dart';
import '../../../router/app_router.dart';

class CutomFab extends StatelessWidget {
  const CutomFab({super.key});

  @override
  Widget build(BuildContext context) {
    String? city;
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              heroTag: null,
              child: const Icon(Icons.search),
              onPressed: () async {
                city = await Navigator.pushNamed(
                  context,
                  AppRouter.searchScreen,
                );
                if (city != null) {
                  // ignore: use_build_context_synchronously
                  context.read<WeatherBloc>().add(
                        FetchWeatherEvent(city: city!),
                      );
                }
              },
            ),
          ),
          const SizedBox(width: 15),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              child: const Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRouter.settingScreen,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
