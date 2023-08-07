import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswers = quizBrain.getCorrectAnswer();
    if (userPickedAnswer == correctAnswers) {
     scoreKeeper.add(Icon(Icons.check,color: Color.green,))
    } else {
      scoreKeeper.add(Icon(Icons.close))
    }

    setState(() {
      quizBrain.nextQuestion();
    });
  }

  // List<String> question = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.',
  // ];
  // List<bool> answers = [false, true, true];
  // Question q1 = Question(
  //     questionText: 'You can lead a cow down stairs but not up stairs.',
  //     questionAnswer: false);
  // Question q2 = Question(
  //     questionText: 'Approximately one quarter of human bones are in the feet.',
  //     questionAnswer: true);
  // Question q3 =
  //     Question(questionText: 'A slug\'s blood is green.', questionAnswer: true);
  QuizBrain quizBrain = QuizBrain();

  int questionBank = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                bool correctAnswers = quizBrain.getCorrectAnswer();
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                'False',
                style: GoogleFonts.vampiroOne(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                bool correctAnswers = quizBrain.getCorrectAnswer();
                if (correctAnswers == false) {
                  print("user got it right");
                } else {
                  print("user got it wrong");
                }
                setState(() {
                  quizBrain.nextQuestion();
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
