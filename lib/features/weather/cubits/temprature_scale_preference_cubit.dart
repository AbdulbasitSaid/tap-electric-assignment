import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';

@lazySingleton
class TemperatureScalePreferenceCubit extends Cubit<TemperatureScale> {
  TemperatureScalePreferenceCubit() : super(TemperatureScale.celsius);

  onSubmitChangeScale() {
    emit(state == TemperatureScale.celsius
        ? TemperatureScale.fahrenheit
        : TemperatureScale.celsius);
  }
}

enum TemperatureScale { fahrenheit, celsius }

extension TemperatureScaleX on TemperatureScale {
  String get unit => this == TemperatureScale.celsius ? 'C' : 'F';
}