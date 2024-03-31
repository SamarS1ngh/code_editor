import 'package:codeEditor/data/local/mock_data.dart';
import 'package:codeEditor/models/problem_model.dart';
import 'package:flutter/material.dart';

class SomeChangenotifierClass extends ChangeNotifier {
  //intialising the mock data class mimicking the api call class
  MockData mock_data = MockData();

  //This list will contain everything and we will not need the categories list in homePage.dart
  //and questions_list in problem_screen.dart
  List<ProblemModel> problems = [];

//Feeds the list with problems after converting them from json to problemModel
  callingProblems() {
    for (var i in mock_data.quest_data['data']) {
      problems.add(ProblemModel.fromJson(i));
    }
    return problems[0];
  }
}
