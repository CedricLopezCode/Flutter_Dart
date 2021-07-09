class ClassGenerique {
 
  //Attributs
  String question;
  bool reponse;
  String explication;
  String imagePath;
 
  //Constructeurs
  //Question();
  ClassGenerique({
    required this.question,
    required this.reponse,
    required this.explication,
    required this.imagePath
  });
 
  //Méthodes
  @override 
  String toString() {
    return question + "  " + reponse.toString() + "  " + explication + "  " + imagePath;
  }
}