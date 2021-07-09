


import 'package:aaa_memo/exo/exo_d_meteo/meteo_datas.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:location/location.dart';
import 'package:geocode/geocode.dart';
import 'dart:convert';
import 'my_flutter_app_icons.dart';
import 'package:http/http.dart' as http;


class PageMeteo extends StatefulWidget {
  @override
  _PageMeteoState createState() => _PageMeteoState();
}

class _PageMeteoState extends State<PageMeteo> {
  List<String> villes = []; //"Grenoble", "Paris", "Brest"
  String villeChoisie ="";

  String keyVilles = "villes";
  String keyVilleActuelle = "ville";

  Location location = Location();
  late LocationData locationData;
  Stream<LocationData>? stream;
  Coordinates coordVilleChoisie = Coordinates();

  MeteoDatas? meteoActuelle;
  bool _isInit = true;

  @override
  void initState() {
    // TODO: implement initState
    //WidgetsFlutterBinding.ensureInitialized();
    super.initState();
    
    readVilles(); 
    readVilleActuelle();
    
    //location = Location();
    //getFirstLocation();// pas besoin puisque le stream
    //ecouteurChangementPosition();
    //getFirstLocation();
  }
  @override
  void didChangeDependencies() {
    if(_isInit){
      getFirstLocation();
    }
    _isInit = false;
    super.didChangeDependencies();
  }
  
  @override
  Widget build(BuildContext context) {
    villeDonneCoord();
    coordDonneVille();

    //appelApi();
    return Scaffold(
      drawer:  
        Drawer(
          child: Container(
            color: Colors.amber, 
            child: listeDrawer(),
          ),

      ),
      appBar: AppBar(title: Text("Météo"), centerTitle: true,),
      body: (meteoActuelle == null)
        ? new Center(
        child: new Text("Ville actuelle: $villeChoisie"),
      )
          : /*Text("data")*/Container(  //fond d'ecran
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(choixImageBackground()),
              fit: BoxFit.cover
          ),
        ),
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(meteoActuelle!.name, style: TextStyle(fontSize: 30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("${meteoActuelle!.temp.toInt()}°C",  style: TextStyle(fontSize: 60)),
                Image.asset(meteoActuelle!.icon)
              ],
            ),
            Text(meteoActuelle!.main,  style: TextStyle(fontSize: 30)),
            Text(meteoActuelle!.description,  style: TextStyle(fontSize: 25)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(MyFlutterApp.weight_hanging, color: Colors.white, size: 30.0,),
                    Text("${meteoActuelle!.pressure}",  style: TextStyle(fontSize: 20))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(MyFlutterApp.water_drop, color: Colors.white, size: 30.0,),
                    Text("${meteoActuelle!.humidity}",  style: TextStyle(fontSize: 20))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(MyFlutterApp.up, color: Colors.white, size: 30.0,),
                    Text("${meteoActuelle!.temp_max}",  style: TextStyle(fontSize: 20))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(MyFlutterApp.down, color: Colors.white, size: 30.0,),
                    Text("${meteoActuelle!.temp_min}",  style: TextStyle(fontSize: 20))
                  ],
                ),
              ],
            )
          ],
        ),
      )
    );
  }
  villeOuverture(){
    updadteVilleActuelle(villeChoisie);
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
          createVille(nvVille);
          villeChoisie = nvVille;
          villeDonneCoord();
          Navigator.of(context).pop();
        });},
      ),
      
    ],);
  }
  //---------------- Liste du Drawer  -------------------------------
   Widget listeDrawer(){
     return ListView.builder(
      itemCount: villes.length+2,
      itemBuilder: (context, index){

        if(index == 0){
          return DrawerHeader(child: Column(children: [
            Text("Mes Villes"),
            ElevatedButton(
              onPressed: ouvrirNvVille, 
              child: Text("Ajouter une ville"),
            )
          ],),);

        }else if (index == 1){
          return ListTile(
            title: Text("Ville actuelle: $villeChoisie", style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic, fontSize: 20,)),
            onTap: (){setState(() {
              villeChoisie = villes[index-2];
              updadteVilleActuelle(villeChoisie);
              appelApi();
              Navigator.of(context).pop();
            });},
          );

        }else{
          return ListTile(
            title: Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(villes[index-2]),
                IconButton(
                  onPressed: (){if(villeChoisie != villes[index-2]) {deleteVille(villes[index-2]);} }, 
                  icon: Icon(Icons.delete, color: Colors.red,),
                ),
            ],), 
            onTap: () => setState(() {
              print("tap list");
              print(villeChoisie);
              villeChoisie = villes[index-2];
              print(villeChoisie);
              print("coord avant: ${coordVilleChoisie.latitude} , ${coordVilleChoisie.longitude}");
              villeDonneCoord();
              print("coord apres: ${coordVilleChoisie.latitude} , ${coordVilleChoisie.longitude}");
              updadteVilleActuelle(villeChoisie);
              print("meteo avant: ${meteoActuelle.toString()}");
              appelApi();
              print("meteo apres: ${meteoActuelle.toString()}");
              updadteVilleActuelle(villeChoisie);

              Navigator.of(context).pop();
            }), 
          );
        }
      }
    );
   }
//--------------------  CRUD Shared Preferences All ----------------------------
  readVilles() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //print("avant $villes");
    setState(() => villes = sharedPreferences.getStringList(keyVilles) ?? []);
    //print("apres $villes");
  }

  createVille(String nvVille) async{
    if(!villes.contains(nvVille)){
      villes.add(nvVille);
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setStringList(keyVilles, villes);
      readVilles();
    }
  }

  deleteVille(String villeASupp) async{
    villes.remove(villeASupp);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setStringList(keyVilles, villes);
    readVilles();
  }
//--------------------  CRUD Shared Preferences Actuelle ----------------------------
  readVilleActuelle() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //print("villeChoisie read  $villeChoisie");
    setState(() =>villeChoisie = sharedPreferences.getString(keyVilleActuelle) ?? "");
    //print("villeChoisie apres $villeChoisie");
  }

  updadteVilleActuelle(String villeActuelle) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //print("villeChoisie avant up $villeChoisie");
    await sharedPreferences.setString(keyVilleActuelle, villeActuelle);
   // print("villeChoisie apresup $villeChoisie");
    villeDonneCoord();
    readVilles();
    appelApi();
  }

//-------------------------  Localisation ---------------------------------
  getFirstLocation() async {
    try{
      locationData = await location.getLocation();
      print("Localisation: lat ${locationData.latitude} ,  long ${locationData.longitude}");
    }catch(e){
      print("erreur $e");
    }
  }
  ecouteurChangementPosition() async{
    locationData = await location.getLocation();
    stream = location.onLocationChanged;
    stream!.listen((nvPosition){
      print("pas bouge: ");
      if(locationData.latitude != nvPosition.latitude || locationData.longitude != nvPosition.longitude){
        //print("Localisation: lat ${locationData.latitude} ,  long ${locationData.longitude}");
        /*setState(() {
          locationData = nvPosition;
          coordDonneVille();
        });*/
      }
    });
  }
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
    //try {
      print("vill $villeChoisie");
      Coordinates coord = await geocode.forwardGeocoding(address: villeChoisie);
      print("coord via nom ville: ${coord.latitude} , ${coord.longitude}");
      setState(() => coordVilleChoisie = coord);
      print("coord villeChoisie: ${coordVilleChoisie.latitude} , ${coordVilleChoisie.longitude}");
   // } catch (e) {
  //    print("erreur $e");
   // }
  }
//-------------------------  API ---------------------------------
  appelApi() async{
    double lat = coordVilleChoisie.latitude ?? 1;
    double long = coordVilleChoisie.longitude ?? 1;
    String lang = Localizations.localeOf(context).languageCode;
    final key = "b501d81b4fdf54c37219af6417520535";

    String urlApi = "http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&units=metric&lang=$lang&APPID=$key";
    Uri uriApi = Uri.parse(urlApi); //car http get ne prend pas string mais uri
    final reponse = await http.get(uriApi); //necéssite import 'package:http/http.dart' as http;
    if (reponse.statusCode == 200) {
      print("api ok");  // 200 == pas d'erreur
      Map jsonRecu = json.decode(reponse.body);  //necéssite import 'dart:convert';
      print(jsonRecu);
      MeteoDatas infosMeteo = MeteoDatas();
      infosMeteo.recupDatasInteressantes(jsonRecu);
      print(infosMeteo);
      setState(() {
        meteoActuelle = infosMeteo;
      });
      print("${meteoActuelle.toString()}");
    }else{print("erreur");}
  }
  //--------------------------------------------------------------------------------
  String choixImageBackground() {
    if (meteoActuelle!.icon.contains("d")) {
      return "images/assets_meteo/n.jpg";
    } else {
      return
      (meteoActuelle!.icon.contains("01") || meteoActuelle!.icon.contains("02") || meteoActuelle!.icon.contains("03"))
      ? "images/assets_meteo/d1.jpg" :  "images/assets_meteo/d2.jpg";
    }
    /*else if (meteoActuelle!.icon.contains("01") || meteoActuelle!.icon.contains("02") || meteoActuelle!.icon.contains("03")) {
      return "images/assets_meteo/d1.jpg";
    } else {
      return "images/assets_meteo/d2.jpg";
    }*/
  }
}
