import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget{
  
  @override
  DrawerMenuState createState () => DrawerMenuState();

}
class DrawerMenuState extends State<DrawerMenu>{
  
  //Les const et var
  List<String> villes = ["Grenoble", "Paris", "Brest"];
  String villeChoisie ="";

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
    return Drawer(
        child: Container(color: Colors.yellow, child: 
          ListView.builder(
            itemCount: villes.length+2,
            itemBuilder: (context, index){
              if(index == 0){
                return DrawerHeader(child: Column(children: [
                  Text("Mes Villes"),
                  ElevatedButton(
                    onPressed: (){}, 
                    child: Text("Ajouter une ville"),
                  )
                ],),);
              }else if (index == 1){
                return ListTile(
                  title: Text("Ville actuelle:  $villeChoisie"),
                  onTap: () {
                    setState(() {
                      villeChoisie = villeChoisie;
                      Navigator.of(context).pop();
                    });
                  }
                );
              }else{
                return ListTile(
                  title: Text(villes[index-2]),
                  onTap: (){setState(() {
                    villeChoisie = villes[index-2];
                    Navigator.of(context).pop();
                  });},
                );
              }
            }
          ),
        ),
      );//fin return
  }
  Container bloc1() {
    return Container(color: Colors.blue, width: 300, height: 100, child: Text("Bloc 1"),);
  }

}



