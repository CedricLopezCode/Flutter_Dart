import 'package:flutter/material.dart';

class LesConteneurs extends StatefulWidget{
  
  @override
  LesConteneursState createState () => LesConteneursState();

}
class LesConteneursState extends State<LesConteneurs>{
  
  //Les const et var
    bool isPressed = false;
    late double larg;
    late Color coul;
    List<String> listePourChip = ["Métroïd", "Mario", "Zelda", "Civilization", "TESO"];
    List<Widget> listeDesChip = [];
 
  @override
  Widget build(BuildContext context) {
    larg = isPressed ? 150 : 50 ;
    coul = isPressed ? Colors.green : Colors.red ;
    return Column(
        children: [
          Divider(color: Colors.blue, thickness: 2,),
          centre(),
          Divider(color: Colors.blue, thickness: 2,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              conteneur(),
              clipRREect(),
              animatedconteneur(),
          ],) ,
          Divider(color: Colors.blue, thickness: 2,),
          lesBoxDecoration(),
          Divider(color: Colors.blue, thickness: 2,),
          lesCard(),
          Divider(color: Colors.blue, thickness: 2,),
          lesChip(),
          Divider(color: Colors.blue, thickness: 2,),
          colonne(),
          Divider(color: Colors.blue, thickness: 2,),
          ligne(),
          Divider(color: Colors.blue, thickness: 2,),
          pageViewBasic(),
          pageViewVerticale(),
          Divider(color: Colors.blue, thickness: 2,),
          flexible(),
          Divider(color: Colors.blue, thickness: 2,),
          wrap(),
          Divider(color: Colors.blue, thickness: 2,),
          fittedBox(),
          Divider(color: Colors.blue, thickness: 2,),
          interactiveConteneur(),
          Divider(color: Colors.blue, thickness: 2,),
        ],
      )
    ;//fin return
  }

  Center centre() {
    return Center( //Attention au padding
      child: Text("center"),
    );
  }

  Container conteneur() {
    return Container(
      height: 50,
      width: 50,
      color: Colors.green,
    );
  }
  Widget animatedconteneur() {
    return InkWell(
      onTap: (() => setState(() => isPressed = !isPressed)),
      child:AnimatedContainer(
        duration: Duration(seconds: 2),
        height: 50,
        width: larg,
        color: coul,
      ),
    ); 
  }
  Container lesBoxDecoration() {
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
      child: Text("Box Décoration", style: TextStyle(color: Colors.red,)),
    );
  }
  ClipRRect clipRREect() {  //Pour avoir facilement les angles arrondis
    return ClipRRect(child: 
      Container(
        height: 50,
        width: 50,
        color: Colors.green,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
 Widget lesCard() {
    return Row( children: [
      conteneur(),

      Card(
        child: conteneur(),
        elevation: 5, //met une ombre qui donne l'impression de sur-élevé
      ),

      Card(//Astuce pour ajouter du padding à des élément qui n'en ont pas(Card)
        child: conteneur(),
        elevation: 5, 
      ),

      Card(//Astuce pour ajouter du padding à des élément qui n'en ont pas(Card)
        child: Padding(
          padding: EdgeInsets.all(10),
          child: conteneur(),
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
  Widget lesChip(){
    if(listeDesChip.length == 0) {listStringDeviensListWidget();}
    return Wrap(children: [
      Chip(label: Text("Un Chip Simple")),
      Chip(
        avatar: CircleAvatar(child: Text("UC", style: TextStyle(color: Colors.white)), backgroundColor: Colors.blueAccent,),
        label: Text("Un Chip"),
        backgroundColor: Colors.yellow,
        onDeleted: (){},
        deleteIconColor: Colors.red,
        labelStyle: TextStyle(color: Colors.black),      
        //et encre beaucoup d'autre
      ),
      ...listeDesChip,
      
    ]);
  }
  listStringDeviensListWidget(){
    for (int i = 0; i < listePourChip.length; i++) { 
      Chip unChip = Chip(
        avatar: CircleAvatar(child: Text(listePourChip[i].substring(0,1), style: TextStyle(color: Colors.white)), backgroundColor: Colors.blueAccent,),
        label: Text(listePourChip[i]),
        backgroundColor: Colors.yellow,
        onDeleted: () => setState(() => listeDesChip.removeAt(i)),
        deleteIcon: Icon(Icons.delete),
        deleteIconColor: Colors.red,
        labelStyle: TextStyle(color: Colors.black),
        elevation: 10,
        labelPadding: EdgeInsets.symmetric(horizontal: 20),
        //shape: ,
        //et encre beaucoup d'autre
      );
      listeDesChip.add(unChip);
    }
  }

  Column colonne() {
    return Column(
      mainAxisSize: MainAxisSize.min,  
      mainAxisAlignment: MainAxisAlignment.start,   //Optionel//memes valeurs que le flex
      crossAxisAlignment: CrossAxisAlignment.start, //Optionel//memes valeurs que le flex
      children: [
        Text("Col1"),
        Text("Col2"),
        Text("Col3"),
        Text("Col4"),
      ]
    );
  }

  Row ligne() {
    return Row(
      mainAxisSize: MainAxisSize.min,   
      mainAxisAlignment: MainAxisAlignment.center,   //Optionel//memes valeurs que le flex
      crossAxisAlignment: CrossAxisAlignment.start, //Optionel//memes valeurs que le flex
      children: [
        Text("Row1"),
        Text("Row2"),
        Text("Row3"),
        Text("Row4"),
      ]
    );
  }
  Widget pageViewBasic(){
    return Container(width: 300, height: 200, color: Colors.black,child: 
      PageView(children: [
        Text("PageView scroller à droite"),
        Image.asset("images/02.jpg"),
        Image.asset("images/03.jpg"),
        Image.asset("images/04.jpg"),
        Image.asset("images/05.jpg"),
      ],),
    );
  }
  Widget pageViewVerticale(){
    return Container(width: 300, height: 200, color: Colors.black,child: 
      PageView(
        //onPageChanged: (){},
        //pageSnapping: false, ??????
        //physics: , ?????
        //scrollBehavior: ,  ????
        reverse: true,
        scrollDirection: Axis.vertical,
        children: [
          Text("PageView scroller en haut"),
          Image.asset("images/02.jpg"),
          Image.asset("images/03.jpg"),
          Image.asset("images/04.jpg"),
          Image.asset("images/05.jpg"),
        ],
      ),
    );
  }
  Widget flexible() {// Le container doit avoir une size défini si scrollable
    return Container(height: 30, child: Row(children: [
          Flexible(flex: 2, child: Container(color: Colors.blue,)),
          Flexible(flex: 5, child: Container(color: Colors.green,)),
          Flexible(flex: 1, child: Container(color: Colors.yellow,)),
          Flexible(flex: 3, child: Container(color: Colors.red,)),
        ])
    ,);
  }
  Widget wrap() {// Le container doit avoir une size défini si scrollable
    return Wrap(children: [
      Container(color: Colors.blue, height: 30, width: 100,),
      Container(color: Colors.green, height: 30, width: 100,),
        Container(color: Colors.yellow, height: 30, width: 100,),
        Container(color: Colors.red, height: 30, width: 100,),
        Container(color: Colors.black, height: 30, width: 100,),
      Container(color: Colors.blue, height: 30, width: 100,),
      Container(color: Colors.green, height: 30, width: 100,),
        Container(color: Colors.yellow, height: 30, width: 100,),
        Container(color: Colors.red, height: 30, width: 100,),
        Container(color: Colors.black, height: 30, width: 100,),
    ]);
  }
   Widget fittedBox() { //le child s'adapte automatiquement
    return Container(
      height: 400,
      width: 300,
      color: Colors.red,
      child: FittedBox(
        child: Text("FittedBox"),
        //fit: BoxFit.fill,
      ),
    );
  }
   Widget interactiveConteneur() { //permet de zoomer par exemple
    return InteractiveViewer(
      child: Image.asset("images/02.jpg")
    );
  }
}