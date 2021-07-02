class Profil {
  String prenom;
  String nom;
  int age;
  double taille;
  Genre genre;
  //Map<String, bool> hobbies;  
  List<String> hobbies;  
  String langagePref;
  String unSecret;
 
  Profil({
    required this.prenom,
    required this.nom,
    required this.age,
    required this.taille,
    required this.genre,
    required this.hobbies,
    required this.langagePref,
    required this.unSecret
  });//fin constructeur

String adjGenre() => (this.genre == Genre.Homme ? "Masculin" : "Féminin");
bool hommeOuPas() => (this.genre == Genre.Homme ? true : false);
String stringHobbies() { //hobbyOne; //hobbyTo;  //hobbyStro;
  String stringHobby = "";
  /*this.hobbies.forEach((nomHobby, vrai) {
   stringHobby+= (vrai) ? " $nomHobby, " : "";
  });*/
  this.hobbies.forEach((nomHobby) {stringHobby +=  " $nomHobby, ";});
  return stringHobby;
}

}
enum Genre{Homme, Femme}