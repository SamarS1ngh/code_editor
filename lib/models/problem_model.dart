import 'package:codeEditor/models/examples.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class ProblemModel {
  String type;
  String heading;
  String description;
  List<Example> examples;
  List<String> constraints;

  ProblemModel(
      {required this.description,
      required this.heading,
      required this.type,
      required this.examples,
      required this.constraints});

  factory ProblemModel.fromJson(Map<String, dynamic> json) => ProblemModel(
      heading: json["heading"],
      description: json["description"],
      type: json["type"],
      examples:
          List<Example>.from(json["examples"].map((e) => Example.fromJson(e))),
      constraints: List<String>.from(json["constraints"].map((e) => e)));
}
