class Profil {
  String prenom;
  String nom;
  int age;
  int taille;
  Genre genre;
  Map<String, bool> hobbies;  
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
String stringHobbies() { //hobbyOne; //hobbyTo;  //hobbyStro;
  String stringHobby = "";
  this.hobbies.forEach((nomHobby, vrai) {
   stringHobby+= (vrai) ? " $nomHobby," : "";
  });
  return stringHobby;
}


}
enum Genre{Homme, Femme}