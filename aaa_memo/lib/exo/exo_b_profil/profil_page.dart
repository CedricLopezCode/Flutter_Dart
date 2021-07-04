import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:aaa_memo/exo/exo_b_profil/profil.dart';

class PageProfil extends StatefulWidget{
  PageProfilState createState () => PageProfilState();

}
class PageProfilState extends State<PageProfil>{
  Profil profil = Profil(prenom: "Prénom", nom: "Nom", age: 0, taille: 0, genre: Genre.Femme, hobbies: [], langagePref: "Flutter", unSecret: "le Secret en question");
  TextStyle titreBloc = TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16);
  bool secretDevoile = false;
  late TextEditingController lecturePrenom;
  late TextEditingController lectureNom;
  late TextEditingController lectureSecret;
  bool switchGenre = false;
  Map<String, bool> mapHobbies = {"Mangas": false, "Jeux Vidéos": false, "Glaces": false, "Coder": true};
  List<String> listHobbiesPossible = ["Mangas", "Jeux Vidéos", "Glaces", "Coder"];
  List<bool> listeBoolHobbies =[];
  File? imageFile;
  ImagePicker picker = ImagePicker();
 

  @override
  void initState() {
    super.initState();
    lecturePrenom = TextEditingController();
    lectureNom = TextEditingController();
    lectureSecret = TextEditingController();
    //Correction
    lecturePrenom.text = profil.prenom;
    lectureNom.text = profil.nom;
    lectureSecret.text = profil.unSecret;
  }
  @override
  void dispose() {
    lectureNom.dispose();
    lecturePrenom.dispose();
    lectureSecret.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Divider(color: Colors.blue, thickness: 2,),
          boxResume(),
          Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            FloatingActionButton(onPressed: (){pickImage(ImageSource.gallery);}, child: Icon(Icons.photo_library),),
            FloatingActionButton(onPressed: (){pickImage(ImageSource.camera);}, child: Icon(Icons.photo_camera),),
          ],),
          Divider(color: Colors.blue, thickness: 2,),
          infosForm(),
          Divider(color: Colors.blue, thickness: 2,),
          passions(),
          Divider(color: Colors.blue, thickness: 2,),
          preference(),
          Divider(color: Colors.blue, thickness: 2,),
        ],
      )
    ;//fin return
  }
  // ---------------------  Bloc Affichage Infos ------------------------------------------
  Container boxResume() {
    return Container(
      margin: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow:[BoxShadow(
          color: Colors.grey,
          offset: Offset(1, 3),
        )] ,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.lightGreenAccent,
      ),
      padding: EdgeInsets.all(5),
      child: contenuResume(),   
    );
  }//Fin resume
  Column contenuResume() {    
    return Column(
      children: [
        imgProfil(),
        Text("${profil.prenom} ${profil.nom}"),
        Text("Age: ${profil.age} ans"),
        Text("Taille: ${profil.taille.toStringAsFixed(2)} m"),
        //Text("Genre: ${profil.genre == Genre.Homme ? "Masculin : Féminin;}"),
        Text("Genre: ${profil.adjGenre()}"),
        Text("Hobbies: ${profil.hobbies}"),
        Text("Hobbies: ${profil.stringHobbies()}"),
        Text("Langage de Programmation Favori: ${profil.langagePref}"),
        ElevatedButton(
          child: Text(textBoutonSecret()), //Correction: Text((secretDevoile)? "Cacher Secret" : "Dévoiler Secret",
          style: ElevatedButton.styleFrom(
            primary: couleurBouton(),  //Correction: Color couleurBouton() => (secretDevoile)? Colors.green : Colors.red;
            onPrimary: couleurText(),  //Correction:  Color couleurText() => (secretDevoile)? Colors.yellow : Colors.yellow;
          ),
          onPressed: changEtatSecret, 
        ),
        Text(leSecret()),
      ],      
    );
  }//Fin contenuResume
  Container imgProfil(){
    return Container (height: 160, width: 90, margin: EdgeInsets.all(10), 
      child: imageFile != null ? Image.file(imageFile!) : Image.network("https://img2.freepng.fr/20180419/ple/kisspng-super-metroid-metroid-prime-mother-brain-super-nin-gorgeous-vector-5ad83486be0208.4186721615241186627783.jpg"),    
      );
  }
  void changEtatSecret() =>  (setState(() =>  secretDevoile = !secretDevoile));
  String textBoutonSecret() => (secretDevoile)? "Cacher Secret" : "Dévoiler Secret";
  Color couleurBouton() => (secretDevoile)? Colors.green : Colors.red;
  Color couleurText() => (secretDevoile)? Colors.yellow : Colors.yellow;
  String leSecret() => (secretDevoile)? profil.unSecret : "";
  Future pickImage(ImageSource source) async {
    PickedFile? imageChoisie = await picker.getImage(source: source);
    setState(() {
      if(imageChoisie == null){ 
      print("img null");
    }else {
      imageFile = File(imageChoisie.path);
    }
    });
    
  }
  
  // ---------------------  Bloc Formulaire Infos ------------------------------------------
  Container infosForm() {
    return Container(
      child: Column(children: [
        Text("Modifier les infos", style: titreBloc,),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)), 
            hintText: "Prénom",            
          ),
          onChanged: ((newPrenom) => setState(() => profil.prenom = lecturePrenom.text = newPrenom)),
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)), 
            hintText: "Nom",            
          ),
          onChanged: ((newNom) => setState(() => profil.nom = lectureNom.text = newNom)),
        ),
        // Correction
        /*
        myTextField(controller: lecturePrenom, hint: "Prénom"),
        myTextField(controller: lecturePrenom, hint: "Nom"),
        myTextField(controller: lecturePrenom, hint: "Secret", isSecret: true),
        myTextField(controller: lecturePrenom, hint: "Age", type: TextInputType.number),
        */
        
        Row(children: [
          Text("Age: "),
          Slider(
            min: 0, max: 100,
            divisions: 99,
            activeColor: Colors.blue,
            value: profil.age.roundToDouble(), 
            onChanged: ((newAge) => setState(() => profil.age = newAge.floor())),
          ),
          Text("${profil.age} ans"),
        ],),
        Row(children: [
          Text("Taille: "),
          Slider(
            min: 0, max: 2.50,
            divisions: 250,
            activeColor: Colors.blue,
            value: profil.taille, 
            onChanged: ((newTaille) => setState(() => profil.taille = newTaille)),
          ),
          Text("${profil.taille.toStringAsFixed(2)} m"),
        ],),
        Row(children: [
          Text("Genre: "),
          Text(feminin(), style: TextStyle(color: Colors.pink),),
          Switch(
            value: switchGenre, 
            onChanged: ((changGenre) => setState(() { switchGenre = changGenre; profil.genre = switchGenre ? Genre.Homme : Genre.Femme;})),
            activeColor: Colors.blue,
            inactiveThumbColor: Colors.pink, inactiveTrackColor: Colors.pinkAccent,
          ),
          Text(masculin(), style: TextStyle(color: Colors.blue),),
        ],),
          TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)), 
            hintText: "Secret",            
          ),
          onChanged: ((newSecret) => setState(() => profil.unSecret = lectureSecret.text = newSecret)),
          obscureText: true,
        ),
      ],),
      
        );
  }//Fin infos
  String feminin() => (switchGenre) ? "": "Féminin";
  String masculin() => (switchGenre) ? "Masculin": "";
  //Correction:
   TextField myTextField({required TextEditingController controller, required String hint, 
      bool isSecret = false /*Pour savoir si on doit cacher*/, 
      TextInputType type: TextInputType.text}) { //Pour préciser si on veut des chiffre pour l'age
    return TextField(
      controller: controller,
      decoration: InputDecoration(hintText: hint,),
      keyboardType: type,
      obscureText: isSecret,
      onSubmitted: ((newValue) {updateUser(); }), //Donc pas en direct
    );
  }
  updateUser() {
    setState(() {
      profil = Profil(
        prenom: (lecturePrenom.text != profil.prenom) ? lecturePrenom.text: profil.prenom, //Fais une vérif en plus
        nom: (lectureNom.text != profil.nom) ? lectureNom.text: profil.nom,
        unSecret: (lectureSecret.text != profil.unSecret) ? lectureSecret.text: profil.unSecret,
        langagePref: profil.langagePref,
        hobbies: profil.hobbies,
        taille: profil.taille,
        age: profil.age,
        genre: profil.genre
      );
    });
  }
  //Fin Correction
  // ---------------------  Bloc Checkbox Hobbies ------------------------------------------
  
  Container passions() {return  Container(child: 
    Column(children: [
      Text("Hobbies", style: titreBloc,),
      listeHobbiesList(),
    ],),
  );}
//Fin passions
  Column listeHobbiesMap(){
    List<Widget> listeComplete = [];
    mapHobbies.forEach((nomHobby, booleen) {
      Row unHobby = Row(children: [
          Icon(Icons.hourglass_bottom),
          Text(nomHobby),
          Checkbox(
            value: booleen, 
            onChanged: ((changCheckbox) => setState(() { 
                mapHobbies[nomHobby] = changCheckbox ?? false; 
                List<String> listeHobby = [];
                mapHobbies.forEach((leHobby, aime) {
                    if(aime){listeHobby.add(leHobby);} 
                });
                profil.hobbies = listeHobby;
            })),
            activeColor: Colors.green,  //couleur de la case quand checked
            checkColor: Colors.yellow,  //couleur de la croix quand checked
            hoverColor: Colors.red,  // ????
          ),
        ],);
        listeComplete.add(unHobby);// listeComplete.add(Text("listeHobbies()"));
     });
    return Column(children: listeComplete,);
  }
  Column listeHobbiesList(){
    List<Widget> listeComplete = [];
    for(var i = 0 ; i < listHobbiesPossible.length; i++) {
      listeBoolHobbies.add(false);
      Row unHobby = Row(children: [
          Icon(Icons.hourglass_bottom),
          Text(listHobbiesPossible[i]),
          Spacer(),
          Checkbox(
            value: listeBoolHobbies[i], 
            onChanged: ((changCheckbox) => setState(() {
                listeBoolHobbies[i] = changCheckbox ?? false;
                majHobbies();
            })),
            activeColor: Colors.green,  //couleur de la case quand checked
            checkColor: Colors.yellow,  //couleur de la croix quand checked
            hoverColor: Colors.red,  // ????
          ),
        ],);
        listeComplete.add(unHobby);// listeComplete.add(Text("listeHobbies()"));
     }
    return Column(children: listeComplete,);
  }
  void majHobbies(){
    profil.hobbies=[];
    for(var n = 0 ; n < listHobbiesPossible.length; n++) {
      if(listeBoolHobbies[n]) {profil.hobbies.add(listHobbiesPossible[n]);} 
    }
  }
  // ---------------------  Bloc Langage Radio ------------------------------------------
    Container preference() {
    return Container(
         child: Column(children: [
            Text("Choisir Langage Préféré", style: titreBloc,),
            choixLang(),
         ],) 
            
        );
  }//Fin preference 
  Row choixLang(){
     List<String> langPref = ["HTML", "CSS", "JS", "SQL", "Java","Flutter", "C/C++/C#"];
    int indexLang = langPref.indexWhere((nomLang) => nomLang.startsWith(profil.langagePref) );
    List<Widget> listLang =[];
    for (var i = 0; i < langPref.length; i++) { 
      Column unLang = Column(children: [
        Icon(Icons.hourglass_bottom_outlined),
        Text(langPref[i]),
        Radio(
          value: i, 
          groupValue: indexLang, 
          onChanged: ((newIndex) => setState(() { 
              indexLang = newIndex as int; 
              profil.langagePref = langPref[i];
          })),
        ),
      ],)
      
      ;
      listLang.add(unLang);
    }
    return Row(children: listLang,);
  }
}// Fin classe profil_page
