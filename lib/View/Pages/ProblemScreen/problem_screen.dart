import 'package:codeEditor/View/Pages/ProblemScreen/editor_page.dart';
import 'package:codeEditor/View/Pages/ProblemScreen/question_page.dart';
import 'package:codeEditor/View/Pages/ProblemScreen/submission.dart';
import 'package:codeEditor/models/problem_model.dart';
import 'package:flutter/material.dart';

class ProblemScreen extends StatefulWidget {
  ProblemScreen({super.key, required this.topic, required this.problem});
  String topic;
  ProblemModel problem;

  @override
  State<ProblemScreen> createState() => _ProblemScreenState();
}

class _ProblemScreenState extends State<ProblemScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
  }

//Tab Bar Page contains the question and the editor page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topic),
        bottom: TabBar(
            controller: _tabController,
            tabs: const [Text('Problem'), Text('Editor'), Text('Submission')]),
      ),

      //Feeding question into the question page
      body: TabBarView(controller: _tabController, children: [
        QuestionPage(problem: widget.problem),
        const EditorPage(),
        const SubmissionPage()
      ]),
    );
  }
}
