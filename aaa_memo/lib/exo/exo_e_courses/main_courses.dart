import 'package:aaa_memo/exo/exo_e_courses/home_courses.dart';
import 'package:flutter/material.dart';

class MainCourses extends StatefulWidget{
  
  @override
  MainCoursesState createState () => MainCoursesState();

}
class MainCoursesState extends State<MainCourses>{
  
  //Les const et var
  String nvListe = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Liste Courses"),
        actions: [
          IconButton(
            onPressed: ouvrirAlertAjouter, 
            icon: Icon(Icons.add)
          ),
        ],
      ),
      body: SingleChildScrollView(child: HomeCourses(),),
    );
  }

  Future ouvrirAlertAjouter() async{
    await showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (BuildContext ctx) => ajouterListe(),
      barrierColor: Colors.black,
    );
  }
  AlertDialog ajouterListe(){
    return AlertDialog( //il faut cliquer dehors pour que ça parte
      title: Text("Ajouter une liste"), 
      content: TextField(
        decoration: InputDecoration(hintText: "Nom de la liste",),
        onSubmitted: (leInput) {setState(() {
          nvListe = leInput;
          Navigator.of(context).pop();
        });},
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("Annuler", style: TextStyle(color: Colors.red),)
        ),
        TextButton(
          onPressed: (){
            // ajouter code pour DB
            Navigator.of(context).pop();
          },
          child: Text("Valider")
        ),
      ],
      backgroundColor: Colors.amber,
      elevation: 10,
    );
  }
}