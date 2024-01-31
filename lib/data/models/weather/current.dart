part of 'weather_models.dart';

@JsonSerializable()
class Current extends Equatable {
  final num? tempC;
  final double? tempF;
  final Condition? condition;
  final double? windMph;
  final num? windKph;
  final num? windDegree;
  final String? windDir;
  final num? pressureMb;
  final double? pressureIn;
  final num? humidity;
  const Current({
    this.tempC,
    this.tempF,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.humidity,
  });

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentToJson(this);

  @override
  List<Object?> get props => [
        condition,
      ];
}
