import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/blocs/blocs.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          title: const Text(
            'Temperature Units',
            style: TextStyle(fontSize: 18),
          ),
          subtitle: const Text(
            'Celsius/Fahrenheit (Default: Celsius)',
            style: TextStyle(fontSize: 13),
          ),
          trailing: Switch(
            value: context.watch<TempSettingBloc>().state.tempUnit ==
                TempUnit.celsius,
            onChanged: (_) {
              context.read<TempSettingBloc>().add(ToggleTempUnitEvent());
            },
          ),
        ),
      ),
    );
  }
}
