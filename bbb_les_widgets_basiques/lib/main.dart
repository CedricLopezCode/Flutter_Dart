import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basics Widgets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BasicsPage(),
    );
  }
}

class BasicsPage extends StatelessWidget{
  @override   //TOUJOURS un override du build !!!!
  Widget build(BuildContext context) { //Context == infos (taille, couleur, langues, etc...)
    var size = MediaQuery.of(context).size; //Récupère la taille depuis le context
    var theme = Theme.of(context).platform; //Récupère le theme depuis le context
    print("size: $size  width: ${size.width}   height: ${size.height}");
    print("theme: $theme");
    //return Container(height: 10, width: 20); //juste voir les retour dans console
    return Scaffold( //squelette donc classsiquement:
      /*appBar: ,
      body: ,
      bottomNavigationBar: ,*/
      body: Container(
        //  Taille
        height: size.height, //(double) size.height == MediaQuery.of(context).size.height == tout l'écran
        width: size.width, //(double) size.width == MediaQuery.of(context).size.width == tout l'écran

        //  Couleur == background
        //color: Theme.of(context).accentColor, //accentColor = primary swatch dans materialApp
        //color: Color.fromRGBO(0, 200, 0, 0.5), //Color. a différente façon de choisir la couleur
        color: Colors.blue.shade600, //Colors. == les noms de couleur (shade optionnel)


        //  Margin et padding
        margin: EdgeInsets.all(10), //margin all
        //margin: EdgeInsets.zero, // On précise explicitement qu'on veut pas de margin
        //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20), //symetrique suivant la direction //pas obliger de donner les 2
        //margin: EdgeInsets.fromLTRB(left, top, right, bottom), //On met une valeur pour chaque direction (obligé toutes)
        //margin: EdgeInsets.only(left: 10, top: 30), //On choisit chaque direction individuellement mais pas obligé toutes
        //padding: EdgeInsets.all(50), //padding all
        //padding: EdgeInsets.zero, //padding all
        padding: EdgeInsets.only(top: 10),

        //  child
        child: Contenu(),
      ),
    );
  }
}

class Contenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        CenterWidget(),
        //ContainerWidget(),
        TextWidget(),
        IconWidget(),
        //ImageWidget(), 
        CardWidget(), 
        ParamsWidget(),
      ]
    );
  }
}
//---------------------------   Container Center  ----------------------------------
class ContainerWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    print(context);
    return Container(
      height: 50,
      width: 50,
      color: Colors.green,
    );
  }
}

class CenterWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center( //Attention au padding
      child: ContainerWidget(),
    );
  }
}
//---------------------------   Text  ----------------------------------
class TextWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var age = 12;
    return Column(
      children: <Widget> [
        Text("texte simple"),
        Text("texte avec variable age = $age"),
        Text("texte avec alignement enfin si ça veut bien marcher parce que pour l'instant ça veut pas", textAlign: TextAlign.right),
        Text("texte avec 1 style", style: TextStyle(color: Colors.orange)),
        Text(
          "texte avec plusieurs styles",
            style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color.fromRGBO(130, 20, 60, 0.5),
            //background: Color.fromARGB(1, 20, 2, 20),
            //fontFamily: , //  plus tard car necessite des import  //arial black, time new roman, etc...
          )
        ),
        Text.rich( //plusieurs styles dans 1 seul texte
          TextSpan(
            text: "Texte principal",
            style: TextStyle(color: Colors.red),
            children: [
              TextSpan(
                text: "1er enfant avec un second style",
                style: TextStyle(color: Colors.grey)
              ),
              TextSpan(
                  text: "2eme enfant reprend le style du parent si pas changé",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  )
              )
            ]
          )
        )
      ]
    );
  }
}
//---------------------------   Image  ----------------------------------
class IconWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
    children: <Widget> [
      Icon(Icons.memory), //liste: https://api.flutter.dev/flutter/material/Icons-class.html
       Icon( 
          Icons.house,
          color: Colors.yellow, //la couleur du dessin à l'intérieur
          size: 50,
       ),
       Image.asset( 
        "images/02.jpg",
        height: 30,
      ),
    ]
   );
  }
}

class ImageWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
    children: <Widget> [
      Image.asset("images/02.jpg"), //Ne pas oublier d'ajouter le dossier dans pubspec.yaml
      Image.network("https://images.pexels.com/photos/1373100/pexels-photo-1373100.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
      Image.asset(  // 2 dimensions sans fit: BoxFit.
        "images/02.jpg",
        width: 300,
        height: 30,
        //prend la 1ère dimension atteinte et garde le ratio
      ),
      Image.asset( // 2 dimensions avec fit: BoxFit.
        "images/02.jpg",
        width: 300,
        height: 30,
        fit: BoxFit.fill, //redimensionne l'image en la déformant
      ),
        Image.asset(
        "images/02.jpg",
        width: 300,
        height: 30,
        fit: BoxFit.cover, //coupe l'image si elle dépasse
      ),
        Image.asset(// == fond d'ecran
        "images/03.jpg",
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height,
      ),
    ]
   );
  }
}
//---------------------------   Card  ----------------------------------
class CardWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
    children: <Widget> [
      ContainerWidget(),
      Card(
        child: ContainerWidget(),
        elevation: 5, //met une ombre qui donne l'impression de sur-élevé
      ),
      Card(//Astuce pour ajouter du padding à des élément qui n'en ont pas(Card)
        child: PaddingWidget(),
        elevation: 5, 
      ),
      Card(//Astuce pour ajouter du padding à des élément qui n'en ont pas(Card)
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ContainerWidget(),
        ),
        elevation: 5, 
      ),
      Card(
        child: Text("texte"),
        color: Colors.green,
        elevation: 5,
        margin: EdgeInsets.all(20),
      ),
    ]
   );
  }
}

//Astuce pour ajouter du padding à des élément qui n'en ont pas(Card)
class PaddingWidget extends StatelessWidget{ 
  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: EdgeInsets.all(10),
    child: ContainerWidget(),
   );
  }
}
//---------------------------   Avec Parametres  ----------------------------------
class ParamsWidget extends StatelessWidget{
 @override
  Widget build(BuildContext context) {
    return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget> [
      RectangleWidget(),  //par défaut
      RectangleWidget(largeur: 100), 
      RectangleWidget(hauteur: 50), 
      RectangleWidget(hauteur: 30, largeur: 30),
    ]
   );
  }
}

//widget avec parametres
class RectangleWidget extends StatelessWidget{ 
  const RectangleWidget ({ //Constructeur qui passera ses valeur dans le context ????
    Key? key,
    this.hauteur = 20,  //Valeurs par défaut
    this.largeur = 40,  //Valeurs par défaut
  }) : super(key: key);

  final double hauteur;   //nommage variaable
  final double largeur;   //nommage variaable

  @override
  Widget build(BuildContext context) { //Constructeur ordinaire
    return Container(
      height: hauteur, 
      width: largeur, 
      color: Colors.green
    );
  }
}
//---------------------------   Text  ----------------------------------

//----------------------------------------------------------------------------------
class Generique extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
    children: <Widget> [
      Text("blabla"),
      Text("blablabla"),
    ]
   );
  }
}