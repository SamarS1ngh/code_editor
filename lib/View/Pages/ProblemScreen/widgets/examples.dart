import 'package:codeEditor/Utils/constants/app_typography.dart';
import 'package:codeEditor/models/examples.dart';
import 'package:flutter/material.dart';

class Examples extends StatelessWidget {
  Examples({super.key, required this.examples});
  List<Example> examples;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: examples.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Example ${index + 1}',
              style: AppTypography.bodyText
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Row(
                    children: [
                      Text(
                        'Input: ',
                        style: AppTypography.bodyText,
                      ),
                      Text(examples[index].input.toString()),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Row(
                    children: [
                      Text(
                        'Output: ',
                        style: AppTypography.bodyText,
                      ),
                      Text(examples[index].output.toString()),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            )
          ],
        );
      },
    );
  }
}
