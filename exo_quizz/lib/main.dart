import 'package:exo_quizz/page_question.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exo Quizz',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Exo Quizz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.width, 
          width: MediaQuery.of(context).size.width*0.9 ,
          child: Card(
            color: Colors.blueAccent,
            elevation: 15,
            shadowColor: Colors.black,
            margin: EdgeInsets.all(30),
            child: Padding(padding: EdgeInsets.all(5), 
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset("assets_quizz/cover.jpg", height: 270, fit: BoxFit.cover,),
                  ElevatedButton(
                    onPressed: (){
                      final pageQuizz = PageQuestion();
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext ctx) => pageQuizz)
                      );
                    }, 
                    child: Text("Commencer le Quizz"),
                  )
                ],
              ),
            )
          ),
        )
      ),
    );
  }
}
