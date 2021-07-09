import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clicker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Clicker'),
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
  int _counter = 0;
  /*var vingt = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
  var pi = 3.14;*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Nombre de clics: $_counter',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 20,
                color: Colors.green
              )
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            if(_counter > 0) Text("Continuez à cliquer"),
            if(_counter > 5 && _counter < 10) Text("entre 5 et 9"),
            if(_counter >= 10 && _counter < 20) Text("entre 10 et 19"),
            if(_counter >= 20 && _counter < 35) Text("entre 20 et 34"),
            if(_counter == 200) Text('juste 200'),
            if(_counter > 350) Text("On a dépassé 350 !!)"),
            if(_counter > 350) Text("Les choses sérieuses peuvent commencer  :)"),
          ],
        ),
      ),
         
      floatingActionButton: FloatingActionButton( //Le bouton rond
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(  //L'icone à l'intérieur
          Icons.add, //add parce que un + //favorite: coeur //audiotrack: note croche
          color: Colors.red, //la couleur du dessin à l'intérieur, pas la couleur du bouton
          size: 50, 
        ), 
      ), 
    );
  }
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}
