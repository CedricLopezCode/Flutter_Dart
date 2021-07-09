import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LeUrlLauncher extends StatefulWidget{
  
  @override
  LeUrlLauncherState createState () => LeUrlLauncherState();

}
class LeUrlLauncherState extends State<LeUrlLauncher>{
  
  //Les const et var
  String _url = "https://pub.dev/packages/url_launcher";

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: launchUrl,
              child: Text("Afficher page internet"),
            ),
          ),
          Text("Pas fonctionnel, Recherche à faire dessus")
        ],
      )
    ;//fin return
  }
  launchUrl() async{
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  }
}