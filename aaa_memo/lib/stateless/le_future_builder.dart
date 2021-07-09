import 'package:flutter/material.dart';

class LeFutureBuilder extends StatefulWidget{
  
  @override
  LeFutureBuilderState createState () => LeFutureBuilderState();

}
class LeFutureBuilderState extends State<LeFutureBuilder>{
  
  //Les const et var
 Future lActionDuFuture = Future.delayed(
  const Duration(seconds: 2),
  () => "Le Future est arrivé après 2s",
);
  Future afficherLeFuture() async {
    setState(() {
      lActionDuFuture = Future.delayed(
        const Duration(seconds: 2),
        () => "Le Future est arrivé après 2s",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Column(children: [
      Divider(),
      ElevatedButton(onPressed: afficherLeFuture, child: Text("Le FutureBuilder")),
      futurBuilder(),
    ],);
  }
  Widget futurBuilder() {
    return  FutureBuilder(
      future: lActionDuFuture, // action qui nous fais attendre les données
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        List<Widget> children;
        //Etat des données et quoi afficher en conséquence
        if (snapshot.hasData) {
          children = <Widget>[
            const Icon(Icons.check_circle_outline,color: Colors.green, size: 60,),
            Padding(padding: const EdgeInsets.only(top: 16),  child: Text('Result: ${snapshot.data}'),)
          ];
        } else if (snapshot.hasError) {
          children = <Widget>[
            const Icon(Icons.error_outline, color: Colors.red, size: 60,),
            Padding(padding: const EdgeInsets.only(top: 16),child: Text('Error: ${snapshot.error}'),)
          ];
        } else {
          children = const <Widget>[
            SizedBox( child: CircularProgressIndicator(),width: 60,height: 60,),
            Padding(padding: EdgeInsets.only(top: 16),child: Text('Awaiting result...'),)
            ];
        }
        //affichage
        return Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        );
        },
      );
  }
}//fin return
