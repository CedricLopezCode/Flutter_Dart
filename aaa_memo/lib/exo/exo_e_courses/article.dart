

class Article {
 
  //Attributs
  int? id;
  String? nom;
  int? idListe;
  double? prix;
  String? magasin;
  String? image;

 
  //Constructeurs
  Article();
 
 
  //Méthodes
  recupInfos(Map<String, dynamic> mapSrc) {
    this.id = mapSrc["id"];
    this.nom = mapSrc["nom"];
    this.idListe = mapSrc["idListe"];
    this.prix = mapSrc["prix"];
    this.magasin = mapSrc["magasin"];
    this.image = mapSrc["image"];
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
    return id.toString() + "  " ;
  }
}