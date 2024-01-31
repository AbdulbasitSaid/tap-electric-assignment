part of 'weather_models.dart';

@JsonSerializable()
class Hour {
  final num? timeEpoch;
  final String? time;
  final double? tempC;
  final double? tempF;

  final Condition? condition;
  final double? windMph;
  final double? windKph;
  final num? windDegree;
  final String? windDir;
  final num? pressureMb;
  final double? pressureIn;

  final num? humidity;

  Hour({
    this.timeEpoch,
    this.time,
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

  String? get timeToHour {
    final DateTime dateTime = DateTime.parse(time!);
    int hour = dateTime.hour;
    String amPm = hour >= 12 ? 'pm' : 'am';
    hour = hour % 12;
    hour = hour == 0 ? 12 : hour;
    return '$hour $amPm';
  }

  factory Hour.fromJson(Map<String, dynamic> json) => _$HourFromJson(json);

  Map<String, dynamic> toJson() => _$HourToJson(this);
}
