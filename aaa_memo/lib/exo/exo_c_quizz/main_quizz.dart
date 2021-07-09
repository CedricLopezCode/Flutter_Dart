import 'package:aaa_memo/exo/exo_c_quizz/page_question.dart';
import 'package:aaa_memo/exo/exo_c_quizz/quizz.dart';
import 'package:flutter/material.dart';


class MainQuizz extends StatefulWidget {
  MainQuizz({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MainQuizzState createState() => _MainQuizzState();
}

class _MainQuizzState extends State<MainQuizz> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Quizz()
    );
  }
}
