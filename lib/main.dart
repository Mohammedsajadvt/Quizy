import 'package:flutter/material.dart';
import 'package:quizapp/questionbank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBank quizBank = QuizBank();
void main() {
  runApp(const Quizzy());
}

class Quizzy extends StatelessWidget {
  const Quizzy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userSelectedAnswer) {
    bool currectAnswer = quizBank.getQuestionAnswer();
    setState(() {
      if (quizBank.isFinished()==true) {
        Alert(
                context: context,
                title: 'Finished',
                desc: 'You are completed the quiz successfully')
            .show();
        quizBank.reset();
        scoreKeeper = [];
      } else {
        if (userSelectedAnswer == currectAnswer) {
        scoreKeeper.add(const Icon(
          Icons.done,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(const Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
       quizBank.nextQuestion();
      }
     
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 7,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                quizBank.getQuestionText(),
                style: const TextStyle(color: Colors.white, fontSize: 25.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0))),
              onPressed: () {
                checkAnswer(true);
              },
              child: const Text('True',
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0))),
              onPressed: () {
                checkAnswer(false);
              },
              child: const Text('False',
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
            ),
          ),
        ),
        Row(children: scoreKeeper)
      ],
    );
  }
}
