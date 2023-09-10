// import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary_in_results.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.userChosenAnswers,
    required this.onRestart,
  });
  final void Function() onRestart;
  final List<String> userChosenAnswers;

  // map is a ds that maps values to keys
  // they are created using curly braces and putting Key Value pairs
  // object is a flexbile type that allows all kinds of values
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < userChosenAnswers.length; i++) {
      summary.add(
        {
          "currentQuestionIndex": i,
          "question": questions[i].questionText,
          "correct_answer": questions[i].answers[
              0], // the first entry is always the right one (in our program)
          "user_answer": userChosenAnswers[i]
        },
      );
    }
    return summary; // returns the summary data that we will pass into the placeholder
  }

  @override
  Widget build(context) {
    final summaryData =
        getSummaryData(); // call it once so that it cant be reused later
    final numTotalQuesions = questions.length;
    final numCorrectQuestions = summaryData.where((datamap) {
      return datamap["correct_answer"] == datamap["user_answer"];
    }).length;

    //summary.where returns a new list so that the length method will give us the total correct answers

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrectQuestions out of $numTotalQuesions questions correctly !",
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 245, 143, 177),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 40,
            ),
            TextButton.icon(
              icon: const Icon(
                CupertinoIcons.restart,
                color: Colors.white,
              ),
              onPressed: onRestart,
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 171, 50, 192),
              ),
              label: const Text(
                "Restart Quiz",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
