import 'package:flutter/material.dart';

class ListeGrille extends StatefulWidget{
  
  @override
  ListeGrilleState createState () => ListeGrilleState();

}
class ListeGrilleState extends State<ListeGrille>{
  
  //Les const et var
 
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Divider(color: Colors.blue, thickness: 2,),
          ListeBasic(),
          Divider(color: Colors.blue, thickness: 2,),
          ListeBuilder(),
          Divider(color: Colors.blue, thickness: 2,),
          ListeSeparated(),
          Divider(color: Colors.blue, thickness: 2,),
          ListeSepDeco(),
          Divider(color: Colors.blue, thickness: 2,),
          Text("data"),
        ],
      )
    ;//fin return
  }
  Container bloc1() {
    return Container(color: Colors.blue, width: 300, height: 100, child: Text("Bloc 1"),);
  }

}
class ListeBasic extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("bbasic"),
      Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry Afsfsfsfs')),
          ),
      ListView( //Tout en brut
        children: <Widget>[
          Text("bbasic"),
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry Afsfsfsfs')),
          ),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Entry Bsffsfsfs')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry sfsfsfsffC')),
          ),
        ],
      ),
    ],)
    ;
  }
}
class ListeBuilder extends StatelessWidget{
      final List<String> entries = <String>['A', 'B', 'C'];
      final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return Column(
    children: <Widget> [

ListView.builder(
  padding: const EdgeInsets.all(8),
  itemCount: entries.length,
  itemBuilder: (BuildContext context, int index) {
    return Container(
      height: 50,
      color: Colors.amber[colorCodes[index]],
      child: Center(child: Text('Entry ${entries[index]}')),
    );
  }
)
    ]
   );
  }
}
class ListeSeparated extends StatelessWidget{
   final List<String> entries = <String>['A', 'B', 'C'];
      final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return Column(
    children: <Widget> [
      ListView.separated(
  padding: const EdgeInsets.all(8),
  itemCount: entries.length,
  itemBuilder: (BuildContext context, int index) {
    return Container(
      height: 50,
      color: Colors.amber[colorCodes[index]],
      child: Center(child: Text('Entry ${entries[index]}')),
    );
  },
  separatorBuilder: (BuildContext context, int index) => const Divider(),
)
    ]
   );
  }
}
class ListeSepDeco extends StatelessWidget{
   final List<String> entries = <String>['A', 'B', 'C'];
      final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return Column(
    children: <Widget> [
      ListView.separated(
  padding: const EdgeInsets.all(8),
  itemCount: entries.length,
  itemBuilder: (BuildContext context, int index) {
    return Container(
      height: 50,
      color: Colors.amber[colorCodes[index]],
      child: Center(child: Text('Entry ${entries[index]}')),
    );
  },
  separatorBuilder: (BuildContext context, int index) => const Divider(),
)
    ]
   );
  }
}