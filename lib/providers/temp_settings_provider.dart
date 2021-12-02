import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

enum TempUnit {
  celsius,
  fahrenheit,
}

class TempSettingsState extends Equatable {
  final TempUnit tempUnit;
  TempSettingsState({
    this.tempUnit = TempUnit.celsius,
  });

  factory TempSettingsState.initial() {
    return TempSettingsState();
  }

  @override
  List<Object> get props => [tempUnit];

  @override
  bool get stringify => true;

  TempSettingsState copyWith({
    TempUnit? tempUnit,
  }) {
    return TempSettingsState(
      tempUnit: tempUnit ?? this.tempUnit,
    );
  }
}

class TempSettingsProvider with ChangeNotifier {
  TempSettingsState _state = TempSettingsState.initial();
  TempSettingsState get state => _state;

  void toggleTempUnit() {
    _state = _state.copyWith(
      tempUnit: _state.tempUnit == TempUnit.celsius
          ? TempUnit.fahrenheit
          : TempUnit.celsius,
    );
    print('temp unit: $_state');
    notifyListeners();
  }
}
