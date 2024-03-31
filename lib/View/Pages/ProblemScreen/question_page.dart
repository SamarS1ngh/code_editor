import 'package:codeEditor/Utils/constants/app_constants.dart';
import 'package:codeEditor/View/Pages/ProblemScreen/widgets/constraints.dart';
import 'package:codeEditor/View/Pages/ProblemScreen/widgets/examples.dart';
import 'package:codeEditor/View/Pages/ProblemScreen/widgets/statement_splitter.dart';
import 'package:codeEditor/models/problem_model.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatelessWidget {
  QuestionPage({super.key, required this.problem});
  ProblemModel problem;

  List<String> statementSplitter(String desc) {
    List<String> parts = desc.split('.');

    return parts;
  }

  @override
  Widget build(BuildContext context) {
    List<String> problem_in_parts = statementSplitter(problem.description);
    var height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 15, 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Problem heading
            Padding(
              padding: EdgeInsets.only(bottom: height / 65),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '238. ',
                    style: AppTypography.titleText,
                  ),
                  Text(
                    problem.heading,
                    style: AppTypography.titleText,
                  ),
                ],
              ),
            ),

            //Problem description
            Statement(
                description: problem.description, heading: problem.heading),
            SizedBox(
              height: height / 20,
            ),

            //Problem examples
            Examples(examples: problem.examples),
            SizedBox(
              height: height / 20,
            ),
            //Problem constraints
            Text(
              'Constraints:',
              style: AppTypography.bodyText
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            Constraints(constraints: problem.constraints)
          ],
        ),
      ),
    );
  }
}
