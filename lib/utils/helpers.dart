import '../data/models/weather/weather_models.dart';

String? makeUri(WeatherForecast? model) {
  return model?.current!.condition?.icon != null
      ? 'https://${((model?.current!.condition?.icon).toString().substring(2)).replaceAll("64", "128")}'
      : null;
}
