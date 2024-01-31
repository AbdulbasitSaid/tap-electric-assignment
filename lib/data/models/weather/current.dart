part of 'weather_models.dart';

@JsonSerializable()
class Current extends Equatable {
  final num? lastUpdatedEpoch;
  final String? lastUpdated;
  final num? tempC;
  final double? tempF;
  final num? isDay;
  final Condition? condition;
  final double? windMph;
  final num? windKph;
  final num? windDegree;
  final String? windDir;
  final num? pressureMb;
  final double? pressureIn;
  final num? precipMm;
  final num? precipIn;
  final num? humidity;
  final num? cloud;
  final double? feelslikeC;
  final double? feelslikeF;
  final num? visKm;
  final num? visMiles;
  final num? uv;
  final double? gustMph;
  final double? gustKph;

  const Current(
      {this.lastUpdatedEpoch,
      this.lastUpdated,
      this.tempC,
      this.tempF,
      this.isDay,
      this.condition,
      this.windMph,
      this.windKph,
      this.windDegree,
      this.windDir,
      this.pressureMb,
      this.pressureIn,
      this.precipMm,
      this.precipIn,
      this.humidity,
      this.cloud,
      this.feelslikeC,
      this.feelslikeF,
      this.visKm,
      this.visMiles,
      this.uv,
      this.gustMph,
      this.gustKph});

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentToJson(this);

  @override
  List<Object?> get props => [cloud, condition, gustKph, gustMph, uv];
}
