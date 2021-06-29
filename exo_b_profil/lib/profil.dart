class Profil {
  String _prenom = "";
  String _nom = "";
  int _age = 0;
  int _taille = 0;
  Genre _genre = Genre.Homme;
  //List<String> hobbies = [];
  /*Map<String, bool> _hobbies = {};*/
  //String _hobbyOne;
  //String _hobbyTo;
  //String _hobbyStro;
  String _langagePref = "";
  String _secret = "";
 
  Profil({
    String prenom = "",
    String nom = "",
    int age = 0,
    int taille = 0, //cm
    Genre genre = Genre.Homme,
    //List<String> hobbies =[],
   /* Map<String, bool> hobbies = {};*/
    //String hobbyOne = ;
    //String hobbyTo;
    //String hobbyStro;
    String langagePref = "",
    String secret = ""
  }){
    this._prenom = prenom;
    this._nom = nom;
    this._age = age;
    this._taille = taille;
    this._genre = genre;
    //this._hobbies = hobbies;
    /*this.hobbies = {};*/
    //String _hobbyOne;
    //String _hobbyTo;
    //String _hobbyStro;
    this._langagePref = langagePref;
    this._secret = secret;
  }//fin constructeur

  String get prenom => _prenom;
  set prenom(String value) => this._prenom = value;
  /*set prenom(String value){_prenom = value;}*/

  String get nom => _nom;
  set nom(String value) => this._nom = value;

  int get age => _age;
  set age(int value) => this._age = value;

  int get taille => _taille;
  set taille(int value) => this._taille = value;

  Genre get genre => _genre;
  set genre(Genre value) => this._genre = value;
/*
  Map<String, bool> get getHobbies => hobbies;
  set setHobbies(Map<String, bool> hobbies) => this.hobbies = hobbies;
*/
  String get langagePref => _langagePref;
  set langagePref(String value) => this._langagePref = value;

  String get secret => _secret;
  set secret(String value) => this._secret = value;

}
enum Genre{Homme, Femme}