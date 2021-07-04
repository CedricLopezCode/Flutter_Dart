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
      body: Center(child: Text("Page Alternative"),),
    );
  }
  
  //Méthodes
}