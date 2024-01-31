import 'package:flutter/material.dart';
import 'package:weathet_app/features/weather/weather.dart';
import 'package:weathet_app/utils/constants.dart';

class ForecastHours extends StatelessWidget {
  const ForecastHours({
    super.key,
    required this.state,
  });

  final WeatherState state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemCount: state.forecastObject!.forecast!.forecastday![0].hour!.length,
        itemBuilder: (itemBuilder, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText(
                  size: 12,
                  text:
                      '${state.forecastObject?.forecast?.forecastday?[0].hour?[index].timeToHour}',
                ),
                const SizedBox(height: 16),
                appText(
                    size: 16,
                    text:
                        "${state.forecastObject?.forecast?.forecastday?[0].hour?[index].tempC}°"),
              ],
            ),
          );
        },
      ),
    );
  }
}
