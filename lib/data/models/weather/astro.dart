part of 'weather_models.dart';

@JsonSerializable()
class Astro {
  final String? sunrise;
  final String? sunset;
  final String? moonrise;
  final String? moonset;
  final String? moonPhase;
  final num? moonIllumination;

  const Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
  });

  factory Astro.fromJson(Map<String, dynamic> json) => _$AstroFromJson(json);
  Map<String, dynamic> toJson() => _$AstroToJson(this);
}
