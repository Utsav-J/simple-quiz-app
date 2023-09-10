import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});
  final void Function() switchScreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Opacity(
          //   opacity: 0.75,
          //   child: Image.asset(
          //     "assets/images/quiz-logo.png",
          //     width: 360,
          //     alignment: Alignment.center,
          //   ),
          // ),

          Image.asset(
            "assets/images/quiz-logo.png",
            width: 360,
            alignment: Alignment.center,
            color: Colors.white60,
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Learn Flutter the fun way",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
            onPressed: switchScreen,
            style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 142, 36, 170)),
            ),
            icon: const Icon(Icons.start_rounded),
            label: const Text(
              "Start",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
