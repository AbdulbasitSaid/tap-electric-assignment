part of 'weather_models.dart';

@JsonSerializable()
class Day {
  final Condition? condition;

  const Day({
    this.condition,
  });

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
  Map<String, dynamic> toJson() => _$DayToJson(this);
}
