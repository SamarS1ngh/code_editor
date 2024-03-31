import 'package:flutter/material.dart';

class Constraints extends StatelessWidget {
  Constraints({super.key, required this.constraints});
  List<String> constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: const Color.fromARGB(68, 158, 158, 158),
          borderRadius: BorderRadius.circular(5)),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: constraints.length,
        itemBuilder: (context, index) {
          String bullet = "\u2022  ";
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(bullet),
              Flexible(
                child: Text(
                  constraints[index],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
