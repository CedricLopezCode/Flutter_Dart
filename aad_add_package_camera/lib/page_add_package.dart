import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PageAddPackage extends StatefulWidget{
  PageAddPackageState createState () => PageAddPackageState();

}
class PageAddPackageState extends State<PageAddPackage>{
  
  
  File? imageFile; //!!!!! prendre l'import dart.io et pas dart.html !!!!!
  ImagePicker picker = ImagePicker();
 
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
          bloc4(),
          Divider(color: Colors.blue, thickness: 2,),
        ],
      )
    ;//fin return
  }
  Container bloc1() {
    return Container(
      width: 300, height: 150,
      color: Colors.greenAccent, 
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text("- Aller sur pub.dev et trouver le package"),
        Text("- Ajouter dans pubspac dans les dépendance \n au niveau de flutter et pas sdk !!!"),
        Text("- Ajouter les clef et string associé dans le plist \n pour iOS toujouts et android peut-etre "),
        Text("- Importer ce package et l'utiliser"),
      ],),
    );
  }
  Container bloc2() {
    return Container(color: Colors.green, width: 300, child: Column(children: [
      imageFile != null ? Image.file(imageFile!, height: MediaQuery.of(context).size.height/2,) : Text("Pas d'image"),
      Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        FloatingActionButton(onPressed: (){pickImage(ImageSource.gallery);}, child: Icon(Icons.photo_library),),
        FloatingActionButton(onPressed: (){pickImage(ImageSource.camera);}, child: Icon(Icons.photo_camera),),
      ],)
    ],),);
  }
  Future pickImage(ImageSource source) async { //Pour dire qu'il faut attendre la réponse de l'utilisateur donc pas immédiat
    PickedFile? imgChoise = await picker.getImage(source: source); 
    //await = Ne passe pas à la ligne suivante tant que ce n'est pas fait
    setState(() {
      if(imgChoise == null) {
        print("Image choisie nulle");
      }else{
        imageFile = File(imgChoise.path);  //  le ! pour dire qu'on est sûr que c'est pas null
      }
    });
  }
  Container bloc3() {
    return Container(color: Colors.red, width: 300, height: 100, child: Text("Bloc 3"),);
  }
  Container bloc4() {
    return Container(color: Colors.yellow, width: 300, height: 100, child: Text("Bloc 4"),);
  }
}