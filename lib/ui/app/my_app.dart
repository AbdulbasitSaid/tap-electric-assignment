import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathet_app/di/injected_bloc_provider.dart';
import 'package:weathet_app/features/weather/weather.dart';
import 'package:weathet_app/ui/main_screen/main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [InjectedBlocProvider<WeatherCubit>()],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: MainScreen(),
        ),
      ),
    );
  }
}
