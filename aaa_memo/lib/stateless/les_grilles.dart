import 'package:flutter/material.dart';

class LesGrilles extends StatefulWidget{
  
  @override
  LesGrillesState createState () => LesGrillesState();

}
class LesGrillesState extends State<LesGrilles>{
  
  //Les const et var
  final List<String> leTexte = ["aaa", "bbb", "ccc", "ddd", "eee", "fff", "ggg", "hhh", "iii", "jjj"];
  
 
  @override
  Widget build(BuildContext context) {
    return Column( crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(color: Colors.blue, thickness: 2,),
          Text("Basique (en brut)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          grilleEnBrut(),
          Divider(color: Colors.blue, thickness: 2,),
          grilleBuilder(),
          Divider(color: Colors.blue, thickness: 2,),
          grilleSeparated(),
          Divider(color: Colors.blue, thickness: 2,),
          Text("data"),
        ],
      )
    ;//fin return
  }
  Container bloc1() {
    return Container(color: Colors.blue, width: 300, height: 100, child: Text("Bloc 1"),);
  }
  Widget grilleEnBrut() {
    return Container(height: 600, margin: EdgeInsets.all(10), color: Colors.red, child: 
      GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10, //espace entre les colonnes
        mainAxisSpacing: 10,  //espace entre les lignes
        crossAxisCount: 2,  //nombre d'items / lignes
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text("He'd have you all unravel at the"),
            color: Colors.teal[100],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Heed not the rabble'),
            color: Colors.teal[200],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Sound of screams but the'),
            color: Colors.teal[300],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Who scream'),
            color: Colors.teal[400],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution is coming...'),
            color: Colors.teal[500],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution, they...'),
            color: Colors.teal[600],
          ),
        ],
      ),
      )
    ;
  }
  Widget grilleBuilder() {
    return Container(height: 1000, margin: EdgeInsets.all(10), color: Colors.yellow, child: 
      GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Container(//forcement des carre donc pas besoin de height
            color: Colors.blue[100*(index%10)], //donc multiple de 10 transparent
            child: Center(child: Text("$index")),
          );
        }
      )
    );
  }
  Widget grilleSeparated() {
    return Container(height: 600, margin: EdgeInsets.all(10), color: Colors.red, child: 
      GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10, //espace entre les colonnes
          mainAxisSpacing: 10,  //espace entre les lignes
        ),
        itemCount: 22,
        
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.blue[100*(index%10)], //donc multiple de 10 transparent
            child: Center(child: Text("$index")),
          );
        }
      )
    );
  }
 /*
  Widget grilleSepDeco() {
    return Container(height: 200, color: Colors.lightGreenAccent, child: 
      ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            color: Colors.amber[100*index],
            child: Center(child: Text('Entry $index')),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),

      )
    );
  }
  */
}

