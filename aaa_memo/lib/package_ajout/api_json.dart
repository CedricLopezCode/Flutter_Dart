
import 'package:flutter/material.dart';
import 'package:aaa_memo/exo/exo_d_meteo/meteo_datas.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;


class ApiJson extends StatefulWidget {
  

  @override
  _ApiJsonState createState() => _ApiJsonState();
}

class _ApiJsonState extends State<ApiJson> {
  
  double latitude = 0;
  int groupeRadioLat = 1;
  double longitude = 0;
  int groupeRadioLong = 2;

  MeteoDatas? meteoActuelle;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    appelApi();
  }

  
  @override
  Widget build(BuildContext context) {
    return Column(children: [ 
      Text("Latitude"),
      Slider(
        value: latitude, 
        min: -90,
        max: 90, 
        onChanged: ((changSlider) => setState(() {
          latitude = changSlider;
          appelApi();
        })),
      ),
      Text("Longitude"),
      Slider(
        value: longitude, 
        min: -180, 
        max: 180, 
        onChanged: ((changSlider) => setState(() {
          longitude = changSlider;
          appelApi();
        })),
      ),
      Text("Coordonnées"),
      Text("Latitude = $latitude"),
      Text("Longitude = $longitude"),
      Text("\nJSON dans le print\n"),
      Text("meteo infos \n"),
      Text("${meteoActuelle.toString()}"),
    ],);
  }
  
//-------------------------  API ---------------------------------
  appelApi() async{
    double lati = latitude;
    double longi = longitude;
    String lang = Localizations.localeOf(context).languageCode;
    final key = "b501d81b4fdf54c37219af6417520535";

    String urlApi = "http://api.openweathermap.org/data/2.5/weather?lat=$lati&lon=$longi&units=metric&lang=$lang&APPID=$key";
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
    }else{print("erreur");}
  }
}
