
import 'package:flutter/material.dart';

class HomeCourses extends StatefulWidget{
  
  @override
  HomeCoursesState createState () => HomeCoursesState();

}
class HomeCoursesState extends State<HomeCourses>{
  
  //Les const et var
 

  @override
  void initState() {
    super.initState();
    //à l'init
  }
  @override
  void dispose() {
    //a la destruction
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
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
                  Image.asset("images/assets_quizz/cover.jpg", height: 270, fit: BoxFit.cover,),
                  ElevatedButton(
                    onPressed: (){/*
                      final pageQuizz = PageQuestion();
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext ctx) => pageQuizz)
                      );*/
                    }, 
                    child: Text("Commencer le Quizz"),
                  )
                ],
              ),
            )
          ),
        )
      )
    ;//fin return
  }

}