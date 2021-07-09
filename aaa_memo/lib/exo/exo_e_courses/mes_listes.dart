

class MesListes {
 
  //Attributs
  int? id ;
  String nom = "";
 
  //Constructeurs
  MesListes();
 
 
  //Méthodes
  recupInfos(Map<String, dynamic> mapSrc) {
    this.id = mapSrc["id"];
    this.nom = mapSrc["nom"];
  }

  Map<String, dynamic> envoiInfos() {
    Map<String, dynamic> mapInfos = {
      "nom": this.nom
    };
    if (id != null) {mapInfos["id"] = this.id;}

    return mapInfos;
  }

  @override 
  String toString() {
    return id.toString() + "  " + nom;
  }
}