import 'package:json_annotation/json_annotation.dart';

part 'sem_auto.g.dart';

@JsonSerializable()
class Sem {
  final String name;
  final String sem;
  final num roll;
  Sem(this.name, this.sem, this.roll);

  factory Sem.fromJson(Map<String, dynamic> json) => _$SemFromJson(json);

  Map<String, dynamic> toJson() => _$SemToJson(this);
}
