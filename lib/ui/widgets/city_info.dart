import 'package:flutter/material.dart';
import 'package:weathet_app/features/weather/weather.dart';
import 'package:weathet_app/utils/constants.dart';
import 'package:weathet_app/utils/helpers.dart';

class CityInfo extends StatelessWidget {
  const CityInfo({super.key, required this.state});
  final WeatherState state;
  @override
  Widget build(BuildContext context) {
    final String? url = makeUri(state.forecastObject);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        url != null ? Image.network(url, scale: 1.2) : const SizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appText(
              size: 24,
              text: '${state.forecastObject?.location?.name}',
              isBold: FontWeight.bold,
              color: primaryColor,
            ),
            RotationTransition(
              turns: AlwaysStoppedAnimation(
                  (state.forecastObject?.current?.windDegree ?? 0) / 360),
              child: const Icon(Icons.north, color: primaryColor),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appText(
              size: 60,
              text: '${state.forecastObject?.current?.tempC?.round()}°',
            ),
            appText(
                size: 30,
                color: Colors.black45,
                text: '${state.forecastObject?.current?.tempF?.round()}°')
          ],
        ),
      ],
    );
  }
}
