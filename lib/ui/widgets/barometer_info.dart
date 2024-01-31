import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathet_app/features/weather/cubits/temprature_scale_preference_cubit.dart';
import 'package:weathet_app/features/weather/cubits/weather.dart';
import 'package:weathet_app/ui/widgets/app_reach_text.dart';
import 'package:weathet_app/ui/widgets/decorated_card.dart';
import 'package:weathet_app/utils/constants.dart';

class BarometerInfo extends StatelessWidget {
  const BarometerInfo({
    super.key,
    required this.weatherState,
  });

  final WeatherState weatherState;

  @override
  Widget build(BuildContext context) {
    final temperatureScalePreferenceState =
        context.watch<TemperatureScalePreferenceCubit>();
    return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appText(
              size: 24,
              text: "Barometer",
              isBold: FontWeight.bold,
            ),
            const SizedBox(height: 4),
            DecoratedCard(
              child: Column(children: [
                BarometerItem(
                  icon: const Icon(Icons.thermostat, color: Color(0xffFF9700)),
                  title: 'Temperature: ',
                  value:
                      '${temperatureScalePreferenceState.state == TemperatureScale.celsius ? weatherState.forecastObject?.current?.tempC : weatherState.forecastObject?.current?.tempF}',
                  unit: '°${temperatureScalePreferenceState.state.unit}',
                ),
                const SizedBox(height: 24),
                BarometerItem(
                    icon: const Icon(
                      Icons.water_drop_outlined,
                      color: Colors.black54,
                    ),
                    title: 'Humidity: ',
                    value: '${weatherState.forecastObject?.current?.humidity}',
                    unit: '%'),
                const SizedBox(height: 24),
                BarometerItem(
                    icon: const Icon(
                      Icons.speed,
                      color: Color(0xffE47373),
                    ),
                    title: 'Pressure: ',
                    value:
                        '${weatherState.forecastObject?.current?.pressureMb}',
                    unit: 'hPa'),
              ]),
            )
          ],
        ));
  }
}

class BarometerItem extends StatelessWidget {
  const BarometerItem({
    super.key,
    this.title,
    this.value,
    this.unit,
    required this.icon,
  });
  final String? title;
  final String? value;
  final String? unit;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        icon,
        const SizedBox(width: 20),
        AppReachText(title: '$title', value: "$value", unit: "$unit")
      ],
    );
  }
}
