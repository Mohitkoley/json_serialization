import 'package:flutter/foundation.dart';

class Sem {
  String name;
  String sem;
  num roll;

  Sem({required this.name, required this.sem, required this.roll});

  factory Sem.fromJson(Map<String, dynamic> json) =>
      Sem(name: json['name'], sem: json['sem'], roll: json['roll']);

  Map<String, dynamic> toJson() => {'name': name, "sem": sem, "roll": roll};
}
