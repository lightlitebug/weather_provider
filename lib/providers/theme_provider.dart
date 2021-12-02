import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../constants/constants.dart';
import 'weather_provider.dart';

enum AppTheme {
  light,
  dark,
}

class ThemeState extends Equatable {
  final AppTheme appTheme;
  ThemeState({
    this.appTheme = AppTheme.light,
  });

  factory ThemeState.initial() {
    return ThemeState();
  }

  @override
  List<Object> get props => [appTheme];

  @override
  bool get stringify => true;

  ThemeState copyWith({
    AppTheme? appTheme,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }
}

class ThemeProvider with ChangeNotifier {
  ThemeState _state = ThemeState.initial();
  ThemeState get state => _state;

  void update(WeatherProvider wp) {
    if (wp.state.weather.theTemp > kWarmOrNot) {
      _state = _state.copyWith(appTheme: AppTheme.light);
    } else {
      _state = _state.copyWith(appTheme: AppTheme.dark);
    }

    notifyListeners();
  }
}
