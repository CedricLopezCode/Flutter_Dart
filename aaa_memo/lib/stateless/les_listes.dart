import 'package:flutter/material.dart';

class LesListes extends StatefulWidget{
  
  @override
  LesListesState createState () => LesListesState();

}
class LesListesState extends State<LesListes>{
  
  //Les const et var
  final List<String> entries = ['A', 'B', 'C'];
  final List<int> colorCodes = [600, 500, 100];
  final List<Widget> listeWidget = [];
  


 
  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 10; i++) {
      listeWidget.add(ElevatedButton(onPressed: (){}, child: Text("Bouton ${i+1}")));
    }
    return Column( crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(children: listeWidget,),
          Divider(color: Colors.blue, thickness: 2,),
          ...listeWidget,
          Divider(color: Colors.blue, thickness: 2,),
          Text("Basique (en brut)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          listeEnBrut(),
          Divider(color: Colors.blue, thickness: 2,),
          Text("Builder", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          listeBuilder(),
          Divider(color: Colors.blue, thickness: 2,),
          Text("Separated", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          listeSeparated(),
          Divider(color: Colors.blue, thickness: 2,),
          Text("Separated Deco", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          listeSepDeco(),
          Divider(color: Colors.blue, thickness: 2,),
          Text("data"),
        ],
      )
    ;//fin return
  }
  Container bloc1() {
    return Container(color: Colors.blue, width: 300, height: 100, child: Text("Bloc 1"),);
  }
  Widget listeEnBrut() {
    return Container(height: 200, color: Colors.green, child: 
      ListView( //Tout en brut
          semanticChildCount: 3,
          children: [
            Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry A')),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry C')),
            ),
          ],
        ),
      )
    ;
  }
  Widget listeBuilder() {
    return Container(height: 200, color: Colors.blue, child: 
      ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            color: Colors.amber[this.colorCodes[index]],
            child: Center(child: Text("Entry ${this.entries[index]}")),
          );
        }
      )
    );
  }
  Widget listeSeparated() {
    return Container(height: 200, color: Colors.red, child: 
      ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      )
    );
  }
  Widget listeSepDeco() {
    return Container(height: 200, color: Colors.lightGreenAccent, child: 
      ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),

      )
    );
  }
  
}

