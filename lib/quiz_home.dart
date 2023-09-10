import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import './start_screen.dart';

class QuizHome extends StatefulWidget {
  const QuizHome({super.key});
  @override
  State<QuizHome> createState() {
    return _QuizHomeState();
  }
}

class _QuizHomeState extends State<QuizHome> {
  // Widget activeScreen = StartScreen(switchScreen);
  // its too early to refernce the switchScreen method rn because the initialization of that function happens almost simultaneously to this line of code
  // Widget?
  //     activeScreen; // '?' means that the value for activeScreen can be widget as well as null

  // void initState() {
  //   //executes only once after the object is created
  //   activeScreenName = 'start-screen';
  //   super.initState();
  // }

  List<String> selectedAnswers =
      []; // we dont reassign but we just append more items
  var activeScreenName = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreenName = 'questions-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreenName = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer); // like append
    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        // this above code was removed because if we do that , then  the results screen will get and empty list
        // due to  the empty list there will be no summary data that we can display later
        activeScreenName = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreenName == 'questions-screen') {
      screenWidget = QuestionsScreen(onChooseAnswer: chooseAnswer);
    }

    if (activeScreenName == 'results-screen') {
      screenWidget = ResultsScreen(
        userChosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 118, 25, 134),
                Color.fromARGB(255, 167, 47, 188)
              ],
              begin: Alignment.center,
              end: Alignment.bottomCenter,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
