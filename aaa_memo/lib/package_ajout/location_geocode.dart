
import 'package:flutter/material.dart';

import 'package:location/location.dart';
import 'package:geocode/geocode.dart';


class LocationGeoCode extends StatefulWidget {
  @override
  _LocationGeoCodeState createState() => _LocationGeoCodeState();
}

class _LocationGeoCodeState extends State<LocationGeoCode> {
  List<String> villes = ["Grenoble", "Paris", "Brest"];
  String villeChoisie ="Grenoble";

//--------------------  Location  -----------------------------------------------------
  Location location = Location();
  late LocationData locationData;
  Stream<LocationData>? stream;

//--------------------  GeoCode  -----------------------------------------------------
  Coordinates coordonnees = Coordinates();

  @override
  void initState() {
    // TODO: implement initState
  
    super.initState();
    villeDonneCoord();
    ecouteurChangementPosition();


  }

  @override
  Widget build(BuildContext context) {
    getFirstLocation();
    return Column(children: [ 
        listeVille(),
      ],);
  }

 
  //-------------------------  Localisation ---------------------------------
  getFirstLocation() async {
    try{
      locationData = await location.getLocation();
    }catch(e){
      print("erreur $e");
    }
  }
  ecouteurChangementPosition(){
    stream = location.onLocationChanged;
    stream!.listen((nvPosition){
      print("pas bouge: ");
      if(locationData.latitude != nvPosition.latitude || locationData.longitude != nvPosition.longitude){
        print("Localisation: lat ${locationData.latitude} ,  long ${locationData.longitude}");
        setState(() {
          locationData = nvPosition;
          coordDonneVille();
        });
      }
    });
  }
//-------------------------  GeoCoder ---------------------------------
//-------------------------  Coordonnées <=> Adresse ---------------------------------
  coordDonneVille() async {
    GeoCode geocode = GeoCode();
    try {
      Address nomVille = await geocode.reverseGeocoding(latitude: locationData.latitude ?? 1, longitude: locationData.longitude ?? 1);
      print("coord via nom ville:  ${nomVille.city}");
    } catch (e) {
      print("erreur $e");
    }
  }
  villeDonneCoord() async {
    GeoCode geocode = GeoCode();
    try {
      Coordinates coord = await geocode.forwardGeocoding(address: villeChoisie);
      print("coord via nom ville: ${coord.latitude} , ${coord.longitude}");
      setState(() => coordonnees = coord);
      print("coord villeChoisie: ${coordonnees.latitude} , ${coordonnees.longitude}");
    } catch (e) {
      print("erreur $e");
    } 
  }

  //---------------- Liste des Villes  -------------------------------
   Widget listeVille(){
     return Container( height: 500, width: 500,color: Colors.yellow , child: 
      ListView.builder(
        itemCount: villes.length+2,
        itemBuilder: (context, index){

          if(index == 0){
            return Column(children: [
              Text("Ville actuelle: $villeChoisie", style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic, fontSize: 20,)),
              Text("Coordonnées actuelles:", style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic, fontSize: 20,)),
              Text("lat ${coordonnees.latitude}      /      long ${coordonnees.longitude}", style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic, fontSize: 20,)),
            ],);

          }else if (index == 1){
            return ElevatedButton(
                onPressed: ouvrirNvVille, 
                child: Text("Ajouter une ville"),
            );

          }else{
            return ListTile(
              title: Text(villes[index-2]),
              onTap: () => setState(() {
                villeChoisie = villes[index-2];
                villeDonneCoord();
              }), 
            );
          }
        }
      )
     )
    ;
   }
   //-------------------- Dialog nv ville ---------------------------------------------
  Future ouvrirNvVille() async{
    await showDialog(
      context: context, 
      builder: ((BuildContext ctx) => rentrerNvVille()),
    );
  }
  SimpleDialog rentrerNvVille(){
    return SimpleDialog(
      backgroundColor: Colors.lightBlueAccent,
      title: Text("Ajouter une ville"),
      children: [
      TextField(
        decoration: InputDecoration(hintText: "Rentrer ville",),
        onSubmitted: (nvVille) {setState(() {
          villeChoisie = nvVille;
          villeDonneCoord();
          createVille(nvVille);
          Navigator.of(context).pop();
        });},
      ),
      
    ],);
  }
  createVille(String nvVille) async{
    if(!villes.contains(nvVille)){ 
        setState(() =>  villes.add(nvVille));
        print(villes);
    }
  }



}
