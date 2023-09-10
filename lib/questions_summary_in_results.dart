import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryDataForResults, {super.key});
  final List<Map<String, Object>> summaryDataForResults;

  @override
  Widget build(context) {
    return SizedBox(
      // a fixed size box with height inside which, we can add scrollable content
      height: 360,
      child: SingleChildScrollView(
        child: Column(
          children: summaryDataForResults.map(
            (data) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: (data["user_answer"] == data["correct_answer"])
                            ? Colors.green.shade200
                            : Colors.pink.shade300,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        ((data["currentQuestionIndex"] as int) + 1).toString(),
                        style: const TextStyle(
                          color: Color.fromRGBO(67, 26, 73, 1),
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (data["question"] as String),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              (data["user_answer"] as String),
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(243, 172, 255, 1),
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              (data["correct_answer"] as String),
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(155, 246, 226, 1),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

// expanded is a widget that helps a child widget that is inside the parent widget 
// it restricst the size of child widgets to be fitted inside the parent widget