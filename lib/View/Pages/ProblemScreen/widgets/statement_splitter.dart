import 'package:codeEditor/Utils/constants/app_typography.dart';
import 'package:flutter/material.dart';

class Statement extends StatelessWidget {
  Statement({super.key, required this.description, required this.heading});
  String description;
  String heading;

  List<String> statement_Splitter(String desc) {
    List<String> parts = desc.split('.');

    return parts;
  }

  @override
  Widget build(BuildContext context) {
    List<String> problem_in_parts = statement_Splitter(description);
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: const Color.fromARGB(68, 158, 158, 158),
          borderRadius: BorderRadius.circular(5)),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: problem_in_parts.length,
        itemBuilder: (context, index) => Column(
          children: [
            Text(
              problem_in_parts[index],
              style: AppTypography.bodyText,
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
