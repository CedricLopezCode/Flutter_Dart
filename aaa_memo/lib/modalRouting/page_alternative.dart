import 'package:flutter/material.dart';

class PageAlternative extends StatefulWidget{
  
  final couleur;

  PageAlternative({required this.couleur});

  @override
  State<StatefulWidget> createState() => PageAlternativeState();
}

class PageAlternativeState extends State<PageAlternative>{

  //Const

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page Alternative"), backgroundColor: widget.couleur,),
      body: Center(child: Column(children: [
        Text("Page Alternative"),
        Divider(),
        Hero(
          tag: "hero", 
          child: Image.asset("images/02.jpg")
        )

      ],)
      ),
    );
  }
  
  //Méthodes
}