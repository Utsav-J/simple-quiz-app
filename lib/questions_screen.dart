import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onChooseAnswer,
  });

  final void Function(String answer)
      onChooseAnswer; // this property belongs to the widget class and not the state class, but we want it in the state class

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String choosenAnswer) {
    // so we pass the selected answer to this function
    widget.onChooseAnswer(
        choosenAnswer); // this will help us get the function present in the widget class to the state class
    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[
        currentQuestionIndex]; // questions is from the imported questions file
    return SizedBox(
      width: double.infinity, // use as much space as possible
      child: Container(
        // wrapped the column to give it a margin
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.questionText,
              style: GoogleFonts.notoSans(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            // the tripple dots will take out all the list items and inline replace them as comma separated entries
            // children will want alist of widgets but we are instead passing a list inside a list for the widgets
            ...currentQuestion.getShuffledAnswers().map(
              (answer) {
                return AnswerButton(answer, () {
                  answerQuestion(answer);
                });
              },
            ), // will go thru all the items and do the funnction for each item in list
          ],
        ),
      ),
    );
  }
}
