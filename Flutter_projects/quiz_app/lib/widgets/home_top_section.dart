import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/utility/home_functions.dart';

import '../app_icons.dart';
import '../utility/shared_providers.dart';
import '../utility/size_config.dart';

class HomeTopSection extends ConsumerWidget {
  const HomeTopSection({
    required this.numOfQuestions,
    required this.questionIdx,
    super.key,
  });

  final int numOfQuestions;
  final int questionIdx;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mistakesCounter = ref.watch(mistakeAttemptsProvider);
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.scaledHeight(2.5),
        bottom: SizeConfig.scaledHeight(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: SizeConfig.scaledWidth(5),
                ),
                Text(
                  "Lives: ",
                  style: TextStyle(
                    fontSize: SizeConfig.scaledHeight(3),
                    fontWeight: FontWeight.w300,
                  ),
                ),
                for (int i = 1; i <= mistakesCounter; i++)
                  Icon(
                    AppIcons.heart3,
                    size: SizeConfig.scaledHeight(3.5),
                  )
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  counterDisplay(
                    questionIdx,
                    numOfQuestions,
                  ),
                  style: TextStyle(
                    fontSize: SizeConfig.scaledHeight(3),
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  width: SizeConfig.scaledWidth(5),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
