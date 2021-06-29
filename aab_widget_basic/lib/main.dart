//-----------------------------   Imports  ------------------------------------------------
import 'package:flutter/material.dart';

//-----------------------------   On touche pas  ------------------------------------------------
void main() {
  runApp(MyApp());
}
//-----------------------------   Infos Générales  ------------------------------------------------
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basics Widgets',
      debugShowCheckedModeBanner: false,  //Ne pas oublier !!!
      theme: ThemeData(
        primarySwatch: Colors.blue,   //Couleur du theme
      ),
      home: BasicsPage(),   //Permet de séparer
    );
  }
}

//-----------------------------   Structure de la Page  ------------------------------------------------
class BasicsPage extends StatelessWidget{
  @override   //TOUJOURS un override du build !!!!
  Widget build(BuildContext context) { //Context == infos (taille, couleur, langues, etc...)
    var size = MediaQuery.of(context).size; //Récupère la taille depuis le context
    var theme = Theme.of(context).platform; //Récupère le theme depuis le context
    print("size: $size  width: ${size.width}   height: ${size.height}");
    print("theme: $theme");
    //return Container(height: 10, width: 20); //juste voir les retour dans console
    return Scaffold( //Squelette donc classsiquement:
      /*
      appBar: AppBar(),
      body: avec juste un child contenu qui change,
      bottomNavigationBar: ,
      */
      appBar: AppBar( //Tout est optionnel  //Ordre automatique 
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
      ),
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
//-----------------------------   Contenu de la Page  ---------------------------------------
class Contenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(   //pour scroller si on dépasse
      scrollDirection: Axis.vertical,   //Par défaut
      child: Column(
        children: <Widget> [
          Text("tittr"),
          //ListeWidget(),
          ContainerWidget(),
          ColumnWidget(),
          RowWidget(),
          Divider(),
          BoxDecorWidget(),
          Divider(),
          ExpandedWidget(),
          CenterWidget(),
          IconWidget(),
          CirlcleAvatarWidget(),
          Row(children: [ColumnWidget(),Expanded(child: RowWidget())],),
          SpacerWidget(),
          StackWidget(),
          ImageWidget(), 
          Row(children: [CenterWidget(),IconWidget(),CirlcleAvatarWidget(),],),
          TextWidget(),
          CardWidget(), 
          DividerWidget(),
          ParamsWidget(),
        ]
      )
    );
  }
}
//---------------------------   Gestion Postion ----------------------------------
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
class ColumnWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,  
      mainAxisAlignment: MainAxisAlignment.start,   //Optionel//memes valeurs que le flex
      crossAxisAlignment: CrossAxisAlignment.start, //Optionel//memes valeurs que le flex
      children: <Widget> [
        Text("Col1"),
        Text("Col2"),
        Text("Col3"),
        Text("Col4"),
      ]
    );
  }
}
class RowWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,   
      mainAxisAlignment: MainAxisAlignment.center,   //Optionel//memes valeurs que le flex
      crossAxisAlignment: CrossAxisAlignment.start, //Optionel//memes valeurs que le flex
      children: <Widget> [
        Text("Row1"),
        Text("Row2"),
        Text("Row3"),
        Text("Row4"),
      ]
    );
  }
}
class StackWidget extends StatelessWidget{  //Empile les uns sur les autres
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget> [
        Image.asset("images/02.jpg", height: 200),
        CircleAvatar(radius: 50, backgroundColor: Colors.yellow),
        Text("Stack"),
        Padding(
          padding: EdgeInsets.only(top: 50, right: 40),
          child: Text("+padding"),
        )
      ]
    );
  }
}

//Astuce pour mieux gerer l'espace
//Par exemple quand 2 en flex le 1ere a gauche et le 2nd centre sur la place qu'il reste
class ExpandedWidget extends StatelessWidget{//Permet d'étendre 1 widget pour aligner 
  @override
  Widget build(BuildContext context) {
    return Container(
     color: Colors.red,
     padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Text("Je veux texte au centre de l'espace restant laissé par l'image"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset("images/02.jpg", height: 50),
              Text("sans expanded", textAlign: TextAlign.center)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset("images/02.jpg", height: 50),
              Expanded(child: Text("avec expanded", textAlign: TextAlign.center))
            ],
          ),
        ],
      )   
    );
  }
}

class DividerWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Column(
      children: <Widget> [
        Divider(),
        Divider(
          color: Colors.red,
          height: 10, //a moitie pertinent
          thickness: 2, //epaisseur
          indent: 30, //décalage pour pas toucher le bord au début
          endIndent: 50,  //décalage pour pas toucher le bord a la fin
        ),
      ]
    );
  }
} 
class SpacerWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, //Optionel//memes valeurs que le flex
      children: <Widget> [
        Icon(Icons.brightness_2),
        Icon(Icons.brightness_7_sharp),
        Spacer(),
        Text("Mon texte à droite grace au spacer"),
      ]
    );
  }
}
class ScrollWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Column(),
        )
      ],
    );
  }
}

//---------------------------   Text  ----------------------------------
class TextWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var age = 12;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        Text("texte simple"),
        Text("texte avec variable age = $age"),
        Text("texte avec alignement enfin si ça veut bien marcher parce que là je suis obligé de prendre 2 lignes", 
          textAlign: TextAlign.right),
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
//---------------------------  Liste && Grille  ----------------------------------
class ListeWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
    children: <Widget> [
      Text("data"),
      ListeBasic(),
      ListeBuilder(),
      ListeSeparated(),
      ListeSepDeco(),
    ]
   );
  }
}
class ListeBasic extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("bbasic"),
      Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry Afsfsfsfs')),
          ),
      ListView( //Tout en brut
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry Afsfsfsfs')),
          ),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Entry Bsffsfsfs')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry sfsfsfsffC')),
          ),
        ],
      ),
    ],)
    ;
  }
}
class ListeBuilder extends StatelessWidget{
      final List<String> entries = <String>['A', 'B', 'C'];
      final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return Column(
    children: <Widget> [

ListView.builder(
  padding: const EdgeInsets.all(8),
  itemCount: entries.length,
  itemBuilder: (BuildContext context, int index) {
    return Container(
      height: 50,
      color: Colors.amber[colorCodes[index]],
      child: Center(child: Text('Entry ${entries[index]}')),
    );
  }
)
    ]
   );
  }
}
class ListeSeparated extends StatelessWidget{
   final List<String> entries = <String>['A', 'B', 'C'];
      final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return Column(
    children: <Widget> [
      ListView.separated(
  padding: const EdgeInsets.all(8),
  itemCount: entries.length,
  itemBuilder: (BuildContext context, int index) {
    return Container(
      height: 50,
      color: Colors.amber[colorCodes[index]],
      child: Center(child: Text('Entry ${entries[index]}')),
    );
  },
  separatorBuilder: (BuildContext context, int index) => const Divider(),
)
    ]
   );
  }
}
class ListeSepDeco extends StatelessWidget{
   final List<String> entries = <String>['A', 'B', 'C'];
      final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return Column(
    children: <Widget> [
      ListView.separated(
  padding: const EdgeInsets.all(8),
  itemCount: entries.length,
  itemBuilder: (BuildContext context, int index) {
    return Container(
      height: 50,
      color: Colors.amber[colorCodes[index]],
      child: Center(child: Text('Entry ${entries[index]}')),
    );
  },
  separatorBuilder: (BuildContext context, int index) => const Divider(),
)
    ]
   );
  }
}

//---------------------------  Icon && Image  ----------------------------------
//https://fonts.google.com/icons?selected=Material+Icons
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

class CirlcleAvatarWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.green,
          foregroundImage: AssetImage("images/03.jpg"),
        ),
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.green,
          foregroundImage: NetworkImage("https://images.pexels.com/photos/1373100/pexels-photo-1373100.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
        )
      ],
    );    
  }
}
//---------------------------   Card && Padding ----------------------------------
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

//---------------------------   Box Décorations  ----------------------------------
class BoxDecorWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        //  Image
        image: DecorationImage(
          image: AssetImage("images/02.jpg"),
          fit: BoxFit.cover
        ),
        //  Ombre
        boxShadow: [
          BoxShadow(
            color: Colors.yellow,
            offset: Offset(3, 3),  //décalage horizontal puis vertical
            blurRadius: 2,  //Floute l'ombre
            spreadRadius: 5,//Etale l'ombre
          ),
        ],
        //  Angles
        //shape: BoxShape.circle, //Change la forme de la décoration
        borderRadius: BorderRadius.all(Radius.circular(15)), //Arrondi les angles
      ),
      child: Text("Box Décoration"),
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
  const RectangleWidget ({ //Constructeur qui passera ses valeurs dans le context ????
    Key? key,
    this.hauteur = 20,  //Valeurs par défaut
    this.largeur = 40,  //Valeurs par défaut
  }) : super(key: key);

  final double hauteur;   //nommage variable
  final double largeur;   //nommage variable

  @override
  Widget build(BuildContext context) { //Constructeur ordinaire
    return Container(
      height: hauteur, 
      width: largeur, 
      color: Colors.green
    );
  }
}
//-----------------------------   AppBar  ------------------------------------------------
class navBarWidget extends StatelessWidget{
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

//-----------------------------   Généric  ------------------------------------------------
//-----------------------------   Généric  ------------------------------------------------
//-----------------------------   Généric  ------------------------------------------------
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