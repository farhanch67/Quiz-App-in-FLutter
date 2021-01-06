import 'package:flutter/material.dart';
import 'Ques.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'QUIZ APP',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade900, fontSize: 20),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Quiz(),
          ),
        ),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

// ignore: non_constant_identifier_names
List<Icon> ScoreKeeper = [];
int questionnumber = 0;
List<Ques> questionsbank = [
  Ques(q: '2+2=4', a: true),
  Ques(q: '5-2=4', a: false),
  Ques(q: '8+2=9', a: false),
  Ques(q: '7+4=11', a: true),
  Ques(q: '8/2=3', a: false),
  Ques(q: '2*2=4', a: true),
  Ques(q: '5-2=3', a: false),
];
void check(bool ans){
  bool CorrectAnswer = questionsbank[questionnumber].answers;
  if (ans ==CorrectAnswer ) {
    ScoreKeeper.add(
      Icon(
        Icons.check,
        color: Colors.green.shade400,
      ),
    );
  } else {
    ScoreKeeper.add(Icon(
      Icons.close,
      color: Colors.red.shade800,
    ));
  }
}
class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                // Questions
                questionsbank[questionnumber].question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          // flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              color: Colors.green.shade900,
              splashColor: Colors.white,
              // textColor: Colors.white,
              child: Text(
                'True',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey.shade900,
                ),
              ),
              onPressed: () {
                  check(true);
                  setState(() {
                    questionnumber++;
                  });
              },
            ),
          ),
        ),
        Expanded(
          // flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              color: Colors.red.shade800,
              textColor: Colors.grey.shade900,
              splashColor: Colors.white,
              child: Text(
                'False',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                check(false);
                setState(() {
                  questionnumber++;
                });
              },
            ),
          ),
        ),
        Container(
          // color: Colors.blue,
          child: Row(
            children: ScoreKeeper,
          ),
        )
      ],
    );
  }
}
