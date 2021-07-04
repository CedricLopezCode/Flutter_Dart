import 'package:flutter/material.dart';

class LesImages extends StatefulWidget{
  
  @override
  LesImagesState createState () => LesImagesState();

}
class LesImagesState extends State<LesImages>{
  
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
    return Column( children: [
          Divider(color: Colors.blue, thickness: 2,),
          bloc1(),
          Divider(color: Colors.blue, thickness: 2,),
          Text("Source", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red,),),

          Text("Image asset basique"),
          Image.asset("images/02.jpg"),

          Text("Image network"),
          Image.network("https://images.pexels.com/photos/1373100/pexels-photo-1373100.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
          
          Divider(color: Colors.blue, thickness: 2,),
          Text("Plusieurs images avec parametres: 2 dimensions", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red,),),
          Text("sans fit: prend la 1ère dimension atteinte et garde le ratio"),
          Image.asset(  
            "images/02.jpg",
            width: 300,
            height: 30,
          ),
          
          Text("Fill redimensionne l'image en la déformant"),
          Image.asset( 
            "images/02.jpg",
            width: 300,
            height: 30,
            fit: BoxFit.fill,
          ),
          
          Text("Cover: coupe l'image si elle dépasse"),
          Image.asset(
            "images/02.jpg",
            width: 300,
            height: 30,
            fit: BoxFit.cover,
          ),
          
          Text("Cover + MediaQuery height = Fond d'écran"),
          Image.asset(
            "images/03.jpg",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
          ),

        ],
      )
    ;//fin return
  }
  Container bloc1() {
    return Container(color: Colors.greenAccent, width: 300, height: 50, child: Text("Ne pas oublier d'ajouter le dossier dans pubspec.yaml"),);
  }
}