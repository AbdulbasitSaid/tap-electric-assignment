import 'package:flutter/material.dart';
import 'package:weathet_app/features/weather/cubits/weather.dart';
import 'package:weathet_app/ui/widgets/app_reach_text.dart';
import 'package:weathet_app/ui/widgets/decorated_card.dart';
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
            size: 24,
            text: 'Wind',
            isBold: FontWeight.bold,
          ),
          const SizedBox(height: 4),
          DecoratedCard(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.air, color: Color(0xff2096F2)),
                AppReachText(
                    title: "Wind Speed:",
                    value: "${weatherState.forecastObject?.current?.windKph}",
                    unit: 'km/h'),
                appText(
                    size: 16,
                    text: '${weatherState.forecastObject?.current?.windDir}',
                    color: Colors.black38),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
