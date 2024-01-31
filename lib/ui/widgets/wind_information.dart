import 'package:flutter/material.dart';
import 'package:weathet_app/features/weather/weather.dart';
import 'package:weathet_app/utils/constants.dart';

class WindInformation extends StatelessWidget {
  const WindInformation({
    super.key,
    required this.weatherState,
  });

  final WeatherState weatherState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appText(
            size: 32,
            text: 'Wind',
            isBold: FontWeight.bold,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.air, color: primaryColor),
              appText(
                size: 18,
                text: '${weatherState.forecastObject?.current?.windKph} km/h',
              ),
              appText(
                size: 18,
                text: '${weatherState.forecastObject?.current?.windDir}°',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
