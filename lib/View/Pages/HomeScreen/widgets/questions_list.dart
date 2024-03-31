import 'package:codeEditor/Utils/constants/app_constants.dart';
import 'package:codeEditor/ViewModel/someClass_VM/someclass.dart';
import 'package:codeEditor/models/problem_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class QuestionCategories extends StatelessWidget {
  QuestionCategories({super.key, required this.category});

  //Asking question category and list of all questions of that category under the constructor
  final String category;
  final List<String> questions = [
    //mock question list
    "Product of Array Except Self",
    "2Sum Problem",
    "Sort an array of 0's 1's and 2's",
    "Stock Buy and Sell",
    "Rearrange the array in alternating positive and negative items",
  ];

  @override
  Widget build(BuildContext context) {
    //calling the method which transforms raw data into problem model and feeds in the list
    //for now, since we are using a mock data, this method only returns 1 problem from the list
    ProblemModel prblm1 =
        Provider.of<SomeChangenotifierClass>(context, listen: false)
            .callingProblems();
    return ExpansionTile(
      title: RichText(
          text: TextSpan(
              text: category,
              style: AppTypography.titleText,
              children: [
            TextSpan(
                text: ' (${questions.length})', style: AppTypography.bodyText)
          ])),

      // Each question leads to its own problem page
      //Since questions list will contain all details related to a problem
      //there are 5 problem headings but they all lead to same one problem (prblm1),due to mock
      //but each heading will lead to its respective problem statement
      children: questions
          .map((e) => ListTile(
              onTap: () {
                context.go(
                  '/question',
                  extra: {'topic': category, 'problem': prblm1},
                );
              },
              title: Text(
                e,
                style: AppTypography.bodyText,
              )))
          .toList(),
    );
  }
}
