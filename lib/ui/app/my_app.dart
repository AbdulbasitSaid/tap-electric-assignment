import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathet_app/di/injected_bloc_provider.dart';
import 'package:weathet_app/features/weather/cubits/temprature_scale_preference_cubit.dart';
import 'package:weathet_app/features/weather/cubits/weather.dart';
import 'package:weathet_app/features/weather/weather_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        InjectedBlocProvider<WeatherCubit>(),
        InjectedBlocProvider<TemperatureScalePreferenceCubit>(),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: WeatherScreen(),
        ),
      ),
    );
  }
}
