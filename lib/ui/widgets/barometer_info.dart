import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weathet_app/features/weather/weather.dart';
import 'package:weathet_app/utils/constants.dart';

class BarometerInfo extends StatelessWidget {
  const BarometerInfo({
    super.key,
    required this.weatherState,
  });

  final WeatherState weatherState;

  @override
  Widget build(BuildContext context) {
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
            Column(children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.thermostat_outlined, color: primaryColor),
                  appText(
                    size: 18,
                    text:
                        'Temperature: ${weatherState.forecastObject?.current?.tempC} °C',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.opacity, color: primaryColor),
                  appText(
                    size: 18,
                    text:
                        'Humidity: ${weatherState.forecastObject?.current?.humidity} °%',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.speed, color: primaryColor),
                  appText(
                    size: 18,
                    text:
                        'Pressure: ${weatherState.forecastObject?.current?.pressureMb} hPa',
                  ),
                ],
              ),
            ])
          ],
        ));
  }
}
