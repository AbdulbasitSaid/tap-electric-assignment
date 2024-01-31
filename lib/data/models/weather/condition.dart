part of 'weather_models.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Condition extends Equatable {
  final String? text;
  final String? icon;
  final num? code;

  const Condition({this.text, this.icon, this.code});

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);
  Map<String, dynamic> toJson() => _$ConditionToJson(this);

  @override
  List<Object?> get props => [code];
}
