import 'package:flutter/material.dart';

class IconeApp extends StatefulWidget{
  
  @override
  IconeAppState createState () => IconeAppState();

}
class IconeAppState extends State<IconeApp>{
  
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
    return Column(
        children: [
          Divider(color: Colors.blue, thickness: 2,),
          bloc1(),
          Divider(color: Colors.blue, thickness: 2,),
          bloc2(),
          Divider(color: Colors.blue, thickness: 2,),
          bloc3(),
          Divider(color: Colors.blue, thickness: 2,),
        ],
      )
    ;//fin return
  }
  Container bloc1() {
    return Container(color: Colors.blue, width: 300, height: 100, child: Text("Tout dans le pubspec.yaml et la console"),);
  }
  Container bloc2() {
    return Container(color: Colors.green, width: 300, height: 200, child: Text('''
  dependencies:
      flutter_launcher_icons: ^0.9.0

  flutter_icons:
      image_path: "images/logo_metroid.png"
      android: "launcher_icon"
      ios: true
    '''),);
  }
  Container bloc3() {
    return Container(color: Colors.red, width: 300, height: 100, child: Text('''
    flutter pub get
    flutter pub run flutter_launcher_icons:main
    '''),);
  }
 

}