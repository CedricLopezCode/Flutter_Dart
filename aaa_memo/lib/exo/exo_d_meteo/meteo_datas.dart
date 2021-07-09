

class MeteoDatas {

  var name;
  var main;
  var description;
  var icon;
  var temp;
  var pressure;
  var humidity;
  var temp_min;
  var temp_max;

  MeteoDatas();

  recupDatasInteressantes(Map fichierJson) {
    this.name = fichierJson["name"];

    List weather = fichierJson["weather"];
    Map mapWeather = weather[0];
    this.main = mapWeather["main"];
    this.description = mapWeather["description"];
    String monIcone = mapWeather["icon"];
    this.icon = "images/assets_meteo/${monIcone.replaceAll("d", "").replaceAll("n", "")}.png"; //pour avoir que le chiffre

    Map main = fichierJson["main"];
    this.temp = main["temp"];
    this.pressure = main["pressure"];
    this.humidity = main["humidity"];
    this.temp_min = main["temp_min"];
    this.temp_max = main["temp_max"];
  }
  @override 
  String toString(){
    return 
      " main: " + this.main.toString()
      + "\n Nom: " + this.name.toString() 
      +"\n description: " + this.description.toString() 
      +"\n icon: " + this.icon.toString()
      +"\n temp: " + this.temp.toString() 
      +"\n pressure: " + this.pressure.toString() 
      +"\n humidity: " + this.humidity.toString()
      +"\n temp_min: " + this.temp_max.toString() 
      +"\n temp_max: " + this.temp_max.toString()
    ;
  }
}