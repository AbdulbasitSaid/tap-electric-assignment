import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathet_app/di/di.dart';
import 'package:weathet_app/features/weather/cubits/temprature_scale_preference_cubit.dart';
import 'package:weathet_app/features/weather/cubits/weather.dart';
import 'package:weathet_app/utils/constants.dart';
import 'package:weathet_app/utils/helpers.dart';

class CityInfo extends StatelessWidget {
  const CityInfo({super.key, required this.state});
  final WeatherState state;
  @override
  Widget build(BuildContext context) {
    final String? url = makeUri(state.forecastObject);
    final temperatureScalePreferenceState =
        context.watch<TemperatureScalePreferenceCubit>();
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
            InkWell(
              onTap: () => {
                getIt<TemperatureScalePreferenceCubit>().onSubmitChangeScale()
              },
              child: appText(
                size: 60,
                text:
                    '${temperatureScalePreferenceState.state == TemperatureScale.celsius ? state.forecastObject?.current?.tempC?.round() : state.forecastObject?.current?.tempF?.round()}°',
              ),
            ),
            appText(
                size: 30,
                color: Colors.black45,
                text:
                    '${temperatureScalePreferenceState.state == TemperatureScale.fahrenheit ? state.forecastObject?.current?.tempC?.round() : state.forecastObject?.current?.tempF?.round()}°')
          ],
        ),
      ],
    );
  }
}
