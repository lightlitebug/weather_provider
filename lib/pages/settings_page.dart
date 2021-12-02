import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/temp_settings_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        child: ListTile(
          title: Text('Temperature Unit'),
          subtitle: Text('Celsius/Fahrenheit (Default: Celsius)'),
          trailing: Switch(
            value: context.watch<TempSettingsProvider>().state.tempUnit ==
                TempUnit.celsius,
            onChanged: (_) {
              context.read<TempSettingsProvider>().toggleTempUnit();
            },
          ),
        ),
      ),
    );
  }
}
