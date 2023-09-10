import 'package:quiz_app/models/quiz_questions.dart';

const questions = [
  QuizQuestion(
    "What are the main building blocks of flutter ui?",
    ["Widgets", "Components", "Blocks", "Bricks"],
  ),
  QuizQuestion(
    "What is the latest version of Flutter?",
    ["3.10", "3.20", "3.60", "3.50"],
  ),
  QuizQuestion(
    "Which programming language does flutter internally use?",
    ["Dart", "Python", "Java", "Ruby"],
  ),
  QuizQuestion(
    "What happens if you change data in a StatelessWidget?",
    [
      "The UI is not updated",
      "The UI will adjust accordingly",
      "Compilation Error",
      "The app will crash"
    ],
  )
];
