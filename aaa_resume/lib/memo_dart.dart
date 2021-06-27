void main(){

//   ---------------------------------------------   Types    ---------------------------------------------
var typeVar = 3; //Pas besoin de préciser le type si on donne une valeur direct
int unInt;
unInt = 2; //doit avoir une valeur
double unDouble = 1.54;
num unNombre; //inclus int et double
String unString = "test";
String citation = "Céline a dit \"Mais comment tu fais pour voler ?!\"";//ou alternance simple-double
String surPlusieursLignes = '''
Un string
sur plusieurs lignes
''';
String stringNombre = "43";
bool unBoolean = true;
dynamic unDynamic = 1;
unDynamic = "Change de type en foonction";

//  Spécifique au String
unString.toUpperCase();
citation.toLowerCase();
//Spécifique au num
unInt ~/ unDouble; //renvoie la partie entiere de la division
unInt % unDouble; //renvoie le reste de la division entiere
//  Changement de Type
int toInt = int.parse(stringNombre);
String toString = unDouble.toString();

//  Particularité
String? quiPeutEtreNull; //pas d'erreur si null
const pi = 3.14; 
final uneValeur = 3;

//  ---------------------------------------------  Tableaux   ---------------------------------------------
List<int> intList = [1, 2, 3];
/*List<int> listVide1 = List();*/ //va bugguer si on la laisse vide     //utilité ???
List<String> listVide2 = []; //ça passe même si on la laisse vide

intList.add(1); //ajoute à la fin
listVide2.length;
intList[1];// donc ressors 2
intList.removeAt(2); //donc supprime le 3
intList[2] = 4; //Remplace le 1 à la fin par un 4
intList.insert(2, 3); //insert la valeur 3 à l'index 2 (avant) 
List<int> intListbis = [5, 6, 7, 8];
intList.addAll(intListbis);//permet d'inserer une liste dans une autre 
intList.contains(uneValeur); //renvoie un bool de si la liste contient cette valeur

//    Maps  == list pas forcement ordonnée  Map<key, value> nom = {x:y, a:b}
Map<int, String> mapKeyIntValueString = {0: "Pierre", 50: "Paul", 13: "Jacques"};
Map<String, double> mapKeyStringValueDouble = {"tel": 300.9, "ordi": 1000.5, "tv": 350.1};
Map<String, dynamic> mapVide = {};


mapKeyStringValueDouble.length; //ressors 3
mapKeyIntValueString[7] = "Toto"; //remplace le add
mapKeyIntValueString[7] = "Jean"; //remplace la valeur si la key existe déjà
mapKeyIntValueString.remove(7); //supprime la valeur de la key qui est rentrée
mapKeyIntValueString.clear(); //vide la map
mapKeyIntValueString.isEmpty; //retourne boolean de si elle est vide ou non
print(typeVar + unInt);
print("Pour pas avoir à sortir du string : $unString $quiPeutEtreNull");

// ---------------------------------------------   Conditions   ---------------------------------------------
//  if
if(unBoolean && pi == 3.14) {
  print("if");
}else if(unDynamic == 1 || toInt == 43) {
  print("else if");
} else {
  print("else");
}
//  switch
unNombre = 3;
switch (unNombre) {
  case 0:
    print("zero");
  break;
  case 1:
    print("un");
  break;
  case 2:
    print("deux");
  break;
  case 3:
    print("trois");
  break;
  default:
    print("supérieur à trois"); //break optionnel pour le default
}
// ---------------------------------------------   Ternaire et équiv  ---------------------------------------------
int age = 18;
String majeurOuPas;
String? anniv;

majeurOuPas = (age >= 18) ? "Majeur" : "Mineur";
anniv = anniv ?? "Date de naissance Inconnue"; // donne une valeur par défaut si null
//  ---------------------------------------------  Boucles  ---------------------------------------------
//  for range
for (int month = 1; month <= 12; month++) {
  print(month);
}

//  for in
for (var intValeur in intList) {
  print(intValeur);
}
//marche à moitié pour les maps 
for (var stringKey in mapKeyStringValueDouble.keys) {
  print(stringKey);
}
for (var doubleValue in mapKeyStringValueDouble.values) {
  print(doubleValue);
}
//mais dans ce cas on utilise plutot les for each

//for each
intList.forEach((intValeur) { 
  print(intValeur);
});
mapKeyStringValueDouble.forEach((elec, prix) { 
  print("$elec coute $prix");
});

//  while
age= 3;
while (age < 18) {
  majeurOuPas = "mineur";
  age++;
}

// do While
do{
  majeurOuPas = "mineur";
  age++;
} while (age < 18) ;

//  ---------------------------------------------  Fonctions   ---------------------------------------------
//Comme d'hab mais une façon différente en + avec accolade pour les parametre:
/*void nomEtAge({String nom, int age}){
  print("Je suis $nom et j'ai $age");
}*/ // NE MARCHE PAS TEL QUEL CAR VALEUR PEUVENT ETRE NULLE DONC PLUSIEURS FA9ONS DE CONTOURNER
void nomEtAgev1({String? nom, int? age}){   //avec les not nullable
  print("Je suis $nom et j'ai $age");
}
void nomEtAgev2({String nom = "Paul", int age = 12}){ //avec une valeur par défaut
  print("Je suis $nom et j'ai $age");
}
void nomEtAgev3({required String nom, required int age}){ //avec des required
  print("Je suis $nom et j'ai $age");
}
String returnString(){
  return "le return";
}

nomEtAgev1(nom: "Pierre1", age: 13);
nomEtAgev2(nom: "Pierre2", age: 13);
nomEtAgev3(nom: "Pierre3", age: 13);
  
nomEtAgev1(nom: "Toto");//Je suis Toto et j'ai null
nomEtAgev2(nom: "Toto");//Je suis Toto et j'ai 12

nomEtAgev1();//Je suis null et j'ai null
nomEtAgev2();//Je suis Paul et j'ai 12


//  ---------------------------------------------  XXXXXX   ---------------------------------------------


} //Fin Main
//  ---------------------------------------------  Classes   ---------------------------------------------
//   Les constructeurs:
class TableV1{  //Classique
  int pied = 4;  double? hauteur;  double? longueur;  double? largeur;  String matiere = "Bois";
  
  TableV1(int pied, double hauteur, double longueur, double largeur, String matiere){
    this.pied = pied; this.hauteur = hauteur; this.longueur = longueur; this.largeur = largeur; this.matiere = matiere;
  }
}
class TableV2{  //Rapide  
  int pied = 4;  double? hauteur;  double longueur;  double largeur;  String matiere = "Bois";
  //plus besoin du ? not nullable car oblige de donner les params

  TableV2(this.pied, this.hauteur, this.longueur, this.largeur, this.matiere);
}
class TableV3{  //Comme Maps => Nom des attributs à l'instanciation
  int pied;  double? hauteur;  double? longueur;  double? largeur;  String matiere;
  //le défault est déplacé des attributs vers le constructeur
  TableV3({this.pied = 4, this.hauteur, this.longueur, this.largeur, this.matiere = "Bois"});
}
//instanciassion différente: comme une Map aveec les noms en brut plus seulement les valeurs
//TableV3 table = TableV3(pied: 1, matiere: "Or");
class TableV4{  //Atribut required
  int pied;  double hauteur;  double longueur;  double largeur;  String matiere;
  //Aucune valeur par défaut et aucun not nullable
  TableV4({required this.pied, required this.hauteur, required this.longueur, required this.largeur, required this.matiere});
  //instanciassion Explicite et complete obligatoire
//TableV4 table = TableV4(pied: 1, hauteur: 150, largeur: 100, longueur: 200, matiere: "Or");
}
//  Héritage
class TableEte extends TableV4{
  String parasol;

// Généralité: 
//TableEte({required this.parasol,super.attributs}) : super(key: value);
  TableEte({required this.parasol, required int pied, required double hauteur, required double longueur, required double largeur, required String matiere}) : super (pied: pied, hauteur: hauteur, largeur: largeur, longueur: longueur, matiere: matiere);
 //instanciassion Explicite et complete obligatoire
//TableEte ete = TableEte(parasol: "Tranquille", pied: 1, hauteur: 150, largeur: 100, longueur: 200, matiere: "Or");
void glander(){print("Tranquille");}
}
//  ---------------------------------------------  Enum   ---------------------------------------------
class TableEteEnum extends TableV4{
  String parasol;
  TypeDeTable type;

  TableEteEnum({required this.type, required this.parasol, required int pied, required double hauteur, required double longueur, required double largeur, required String matiere}) : super (pied: pied, hauteur: hauteur, largeur: largeur, longueur: longueur, matiere: matiere);
  void glander(){print("Tranquille");}
  void checkType(){print(type);}

//TableEteEnum enumer = TableEte(type: TypeDeTable.Jardin, parasol: "Tranquille", pied: 1, hauteur: 150, largeur: 100, longueur: 200, matiere: "Or");
}
enum TypeDeTable{
  Jardin, Salon, Manger
}


