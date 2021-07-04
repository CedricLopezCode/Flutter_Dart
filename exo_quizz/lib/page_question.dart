import 'package:flutter/material.dart';
import 'package:exo_quizz/datas.dart';

class PageQuestion extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => PageQuestionState();
}

class PageQuestionState extends State<PageQuestion>{

  int indexQuestion = 0;
  int scoreActuel = 0;
  Datas datasQuestion = Datas();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Score : $scoreActuel"),),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height, 
          width: MediaQuery.of(context).size.width ,
          child: Card(
            color: Colors.white,
            elevation: 15,
            shadowColor: Colors.black,
            margin: EdgeInsets.all(10),
            child: Padding(padding: EdgeInsets.all(5), 
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Question numéro: ${indexQuestion+1} / ${datasQuestion.listeQuestions.length}", 
                    style: TextStyle(color: Colors.red),
                  ),
                  Text(
                    "${datasQuestion.listeQuestions[indexQuestion].question}", 
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Image.asset(
                    "assets_quizz/${datasQuestion.listeQuestions[indexQuestion].imagePath}", 
                    height: 270, 
                    fit: BoxFit.cover,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround, 
                    children: [
                      ElevatedButton(
                        onPressed: () => montrerReponse(false), 
                        child: Text("Faux"),
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                      ),
                      ElevatedButton(
                        onPressed: () => montrerReponse(true), 
                        child: Text("Vrai"),
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                      ),
                  ],)
                ],
              ),
            )
          ),
        )
      ),
    );
  }
  Future montrerReponse(bool repondu) async{
    await showDialog(
      context: context, 
      builder: ((BuildContext ctx) => verifierReponse(repondu)),
    );
  }
  SimpleDialog verifierReponse(bool repondu){
    bool correct = (repondu == datasQuestion.listeQuestions[indexQuestion].reponse);
    if(correct){scoreActuel++;}
    return SimpleDialog(
      children: [
      Text(correct ? "C'est Gagné !!!" :"Raté !"),
      Image.asset(
        correct ? "assets_quizz/vrai.jpg":"assets_quizz/faux.jpg" , 
        //height: 270, 
        //fit: BoxFit.cover,
      ),
      Text("${datasQuestion.listeQuestions[indexQuestion].explication}"),
      questionSuivante(),
    ],);
  }
  SimpleDialogOption questionSuivante(){
    return SimpleDialogOption(
      child: Text("Passer à la question suivante"),
      onPressed: (){
        if(indexQuestion+1 < datasQuestion.listeQuestions.length){
          setState(() => indexQuestion++);
          Navigator.of(context).pop();
        }else{
          Navigator.of(context).pop();
          showDialog(
            context: context, 
            builder: ((BuildContext ctx) => cEstFini()),
          );
        }
      },
    );
  }
  AlertDialog cEstFini(){
    return AlertDialog(
      title: Text("C'est fini !!!"),
      content: Text("Votre score est de: $scoreActuel points."),
      actions: [
        TextButton(
          onPressed: (){
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          }, 
        child: Text("OK")
        ),
      ],
    );
  }
}