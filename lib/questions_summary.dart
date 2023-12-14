import 'package:flutter/material.dart';
import 'package:quizz_app/color_constants.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;


  @override
  
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: data['is_correct_answer'] == true
                        ? ColorConstants.successGreen
                        : ColorConstants.errorRed,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: TextStyle(
                        color: data['is_correct_answer'] == true
                            ? Colors.black
                            : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'].toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        ...data['is_correct_answer'] == true
                            ? [
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        data['correct_answer'].toString(),
                                        style: TextStyle(
                                          color: ColorConstants.successGreen,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Icon(Icons.check_circle_rounded,
                                        color: ColorConstants.successGreen),
                                  ],
                                ),
                              ]
                            : [
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        data['user_answer'].toString(),
                                        style: TextStyle(
                                          color: ColorConstants.errorRed,
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Icon(Icons.cancel_rounded,
                                        color: ColorConstants.errorRed),
                                  ],
                                ),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(Icons.arrow_forward_rounded,
                                          color: ColorConstants.primaryBlue),
                                      const SizedBox(width: 5),
                                      Text(data['correct_answer'].toString(),
                                          style: TextStyle(
                                            color:
                                                ColorConstants.primaryBlue,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                      ],
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
