import 'package:flutter/material.dart';

class AppBarTop extends StatefulWidget{
  const AppBarTop({Key ? key}) : super(key : key);

  @override
  State<AppBarTop> createState() => _AppBarTopState();
}

class _AppBarTopState extends State<AppBarTop>{
@override
  Widget build(BuildContext context) {
    return AppBar( //Tout est optionnel  //Ordre automatique 
        title: Text("Mon titre"),
        centerTitle: true,
        leading: Icon(Icons.star),// == logo  toujours à gauche
        leadingWidth: 20, //Change la largeur de l'espace réserve au logo, pas la taille de l'icon
        actions: [//Liste de widgets  toujours à droite
          Icon(Icons.handyman),
          Icon(Icons.border_color),
          Icon(Icons.add),
        ],
        
        flexibleSpace: Text("FlexibleSpace"), //apparait dans la barre des tache avec les icones android
        elevation: 7.5,
        shadowColor: Colors.green,
        toolbarHeight: 30.5,
        toolbarOpacity: 0.8, //0-0.4 tout invisible 0.5-0.8 texte terne par defaut == 1
        primary: true, // si false remonte les éléments dans la barre
        backgroundColor: Colors.red, // Si on veut une couleur différente du theme
        /*
        Comment utiliser ???: foregroundColor, bottom, shape(relation avec shadow), textTheme, titleTextStyle
        Pas compris l'utilité : automaticallyImplyLeading,  
        */
    );
  }
}


