
import 'package:exo_facebook/style_titre_section.dart';
import 'package:exo_facebook/titre_prenom.dart';

import 'post.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
//Infos
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facebook Amelior',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Squelette(),
    );
  }
}
//Squelette
class Squelette extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Post postViaClass = Post(name: "Cécé", time: "3 min", imagePath: "images/Spyre1.jpg", desc: "descripotion") ;
    return Scaffold(
      appBar: AppBar(title: Text("Facebook Amélioration")),
      body: PagePersoWidget(),
    );
  }
}

//-----------------------------------------  Contenu   ----------------------------------------------------
class PagePersoWidget extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  Column(
        children: [
          HeaderWidget(),
          InfosWidget(),
          AmisWidget(),
          PostWidget(),
          PostClassWidget(),
        ],
      )
    );   
  }
}

//-----------------------------------------  Header   ----------------------------------------------------
class HeaderWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderimagesWidget(),
        /* Modif class
        Text(
          "Cédric Lopez",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),*/
        TitrePrenom(titrePrenom: "Cédric "),
        Text(
          '''Chimiste en reconversion dans le développement informatique.
          Il faut bien un peu de texte pour remplir...''',
          style: TextStyle(
            color: Colors.grey,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.center,
        ),
        ModifProfilWidget(),
        Divider(),
      ],
    );
  }
}
class HeaderimagesWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget> [
        Image.asset(
          "images/04.jpg",
          height: 100,
          width: 1000,
          fit: BoxFit.fill,
        ),
        Padding(padding: EdgeInsets.only(top: 50), child: 
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 51,
            child: CircleAvatar(
              radius: 49,
              foregroundImage: AssetImage("images/02.jpg"),
            ),
          ),
        
        )
      ],
    );
  }
}

class ModifProfilWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 40,
          width: 300,
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all(5),
          child: Center(child: Text("Modifier le profil", style: TextStyle(color: Colors.white),)),
          decoration: BoxDecoration(
            color: Colors.blue.shade600,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
         Container(
          height: 40,
          width: 40,
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all(5),
          child: Icon(Icons.border_color, color: Colors.white, size: 20,),
          decoration: BoxDecoration(
            color: Colors.blue.shade600,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ],
    );
  }
}

//-----------------------------------------  Infos   ----------------------------------------------------
class InfosWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("A propos de moi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
        StyleTitreSection("A propos de moi"), //Version avec classe
        Row(children: [
          Icon(Icons.home),
          Text("Grenoble, France")
        ],),
        Row(children: [
          Icon(Icons.work),
          Text("Formation Développeur")
        ],),
        Row(children: [
          Icon(Icons.favorite),
          Text("Célibataire")
        ],),
        Divider(),
      ],
    );
  }
}

//-----------------------------------------  Amis   ----------------------------------------------------
class AmisWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Amis", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
        StyleTitreSection("Amis"), //Version avec classe
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            UnAmiWidget(),
            UnAmiWidget(),
            UnAmiWidget(),
        ],),
        Divider(),
      ],
    );
  }
}
class UnAmiWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(children: [
    Container(
        height: 150,
        width: 120,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/Trace1.jpg"),
            fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
      Text("Prénom"),
    ],);
  }
}
//-----------------------------------------  Post   ----------------------------------------------------
class PostWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UnPostWidget(), 
        UnPostWidget(),
        Text("post"),
        Divider(),
      ],
    );
  }
}
class UnPostWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      color: Colors.grey.shade300,
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          InfoPostWidget(),
          LePostWidget(),
          LikeCommPostWidget(),
        ],
      )
    );
  }
}
class InfoPostWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 20, foregroundImage: AssetImage("images/03.jpg"),),
        Text("Cédric Lopez"),
        Spacer(),
        Text("Il y a tant de temps"),
      ],
    );
  }
}
class LePostWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/05.jpg"),
            ),
          ),
        ),
        Text("La Description de l'image parce que sur les réseaux sociaux on met toujours une description meme si c'est redondant !!!"),
      ],
    );
  }
}
class LikeCommPostWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.favorite),
        Text("150 likes"),
        Icon(Icons.comment),
        Text("12 commentaires"),
      ],
    );
  }
}
//-----------------------------------  Post Amélioré via classe    ----------------------------------------------------
class PostClassWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Début Classe"),
        UnPostClassWidget(), 
        UnPostClassWidget(),
        UnPostClassWidget(),
        Text("Fin Classe"),
        Divider(),
      ],
    );
  }
}
class UnPostClassWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      color: Colors.grey.shade300,
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          InfoPostClassWidget(),
          LePostClassWidget(),
          LikeCommPostClassWidget(),
        ],
      )
    );
  }
}
class InfoPostClassWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 20, foregroundImage: AssetImage("images/03.jpg"),),
        Text("Cédric Lopez"),
        Spacer(),
        Text("Il y a "),
      ],
    );
  }
}
class LePostClassWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/05.jpg"),
            ),
          ),
        ),
        Text("La Description de l'image parce que sur les réseaux sociaux on met toujours une description meme si c'est redondant !!!"),
      ],
    );
  }
}
class LikeCommPostClassWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.favorite),
        Text("150 likes"),
        Icon(Icons.comment),
        Text("12 commentaires"),
      ],
    );
  }
}


//-----------------------------------------  Générique   ----------------------------------------------------
class GeneriqueWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("data"),
        Text("data"),
      ],
    );
  }
}