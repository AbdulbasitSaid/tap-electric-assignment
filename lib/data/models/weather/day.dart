part of 'weather_models.dart';

@JsonSerializable()
class Day {
  final double? maxtempC;
  final double? maxtempF;
  final num? mintempC;
  final double? mintempF;
  final double? avgtempC;
  final double? avgtempF;
  final double? maxwindMph;
  final double? maxwindKph;
  final double? totalprecipMm;
  final double? totalprecipIn;
  final double? avgvisKm;
  final num? avgvisMiles;
  final num? avghumidity;
  final num? dailyWillItRain;
  final num? dailyChanceOfRain;
  final num? dailyWillItSnow;
  final num? dailyChanceOfSnow;
  final Condition? condition;
  final num? uv;

  const Day(
      {this.maxtempC,
      this.maxtempF,
      this.mintempC,
      this.mintempF,
      this.avgtempC,
      this.avgtempF,
      this.maxwindMph,
      this.maxwindKph,
      this.totalprecipMm,
      this.totalprecipIn,
      this.avgvisKm,
      this.avgvisMiles,
      this.avghumidity,
      this.dailyWillItRain,
      this.dailyChanceOfRain,
      this.dailyWillItSnow,
      this.dailyChanceOfSnow,
      this.condition,
      this.uv});

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
  Map<String, dynamic> toJson() => _$DayToJson(this);
}
