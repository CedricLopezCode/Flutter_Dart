import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:location/location.dart';
import 'package:geocode/geocode.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Tester'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 List<String> villes = ["Grenoble", "Paris", "Brest"];
  String villeChoisie ="Grenoble";

//--------------------  Location  -----------------------------------------------------
  Location location;
  LocationData locationData;
  Stream<LocationData>? stream;

//--------------------  GeoCode  -----------------------------------------------------
  Coordinates coordonnees = Coordinates();


  @override
  void initState() {
    // TODO: implement initState
  
    super.initState();
    //location = Location();
    getFirstLocation();// pas besoin puisque le stream
    /*
    ecouteurChangementPosition();

    villeDonneCoord();
    //coordDonneVille();*/

  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        ElevatedButton(
          onPressed: ouvrirNvVille, 
          child: Text("Récupérer Coordonnées"),
        ),
        Text("Coordonnées récupérées: lat ${locationData.latitude} ,  long ${locationData.longitude}"),
        ElevatedButton(
          onPressed: ouvrirNvVille, 
          child: Text("Coordonnées => Ville"),
        ),
        Text("Coordonnées récupérées"),
        ElevatedButton(
          onPressed: ouvrirNvVille, 
          child: Text("Ville => Coordonnées"),
        ),  
        Text("Coordonnées récupérées"),
        Divider(color: Colors.red,),
        listeVille(),
      ],);
  }

 
  //-------------------------  Localisation ---------------------------------
  getFirstLocation() async {
    try{
      print("Lavant");
      location = Location();
      print("Localisation ok");
      locationData = await location.getLocation();
      print("Localisation data ok");
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
     return Container( height: 500, width: 300,color: Colors.yellow , child: 
      ListView.builder(
        itemCount: villes.length+2,
        itemBuilder: (context, index){

          if(index == 0){
            return Column(children: [
            Text("Ville actuelle: $villeChoisie", style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic, fontSize: 20,)),
            Text("Coordonnées actuelles:", style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic, fontSize: 20,)),
            Text("lat ${coordonnees.latitude} ", style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic, fontSize: 20,)),
            Text("long ${coordonnees.longitude}", style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic, fontSize: 20,)),
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
          Navigator.of(context).pop();
        });},
      ),
      
    ],);
  }
  createVille(String nvVille) async{
    if(!villes.contains(nvVille)){ 
        List<String> lesVilles = villes;
        lesVilles.add(nvVille);
        setState(() => villes = lesVilles);
    }
  }
}
