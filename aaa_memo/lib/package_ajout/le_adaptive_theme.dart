import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

//  A Changer dans le main celui-ci ne marche pas  !!!
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light, // noir sur fond blanc
        primarySwatch: Colors.blue,
      ), 
      dark: ThemeData(
        brightness: Brightness.dark,  // blanc sur fond noir
        primarySwatch: Colors.orange, //le texte des bouton changera que si la couleur est trop claire
      ), 
      initial: AdaptiveThemeMode.light, 
      builder: (theme, darkTheme) =>  MaterialApp(
        title: 'Mémo',
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        home: PageAdaptative(),
      )
   );
  }
}
class PageAdaptative extends StatefulWidget {
  @override
  PageAdaptativeState createState() => PageAdaptativeState();
}

class PageAdaptativeState extends State<PageAdaptative> {

    //Variables Contextuelles
    bool themeSombre = false;
    dynamic savedThemeMode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recupThemeActuel();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(children: [
      Divider(),
      Text("Texte page adaptative"),
      Divider(),
      TextButton(onPressed: (){}, child: Text("Text Button")),
      ElevatedButton(onPressed: (){}, child: Text("Elevated Button")),
      SwitchListTile(
        title: Text("Mode Sombre"),
        value: themeSombre, 
        onChanged: ((changSwitch) => setState(() {
          themeSombre = changSwitch;
          (themeSombre) ? AdaptiveTheme.of(context).setDark(): AdaptiveTheme.of(context).setLight();
        })), 
      ),
      ElevatedButton(onPressed: () => AdaptiveTheme.of(context).toggleThemeMode(), child: Text("Toggle Mode")),
    ],);
  }
  Future recupThemeActuel() async {
    savedThemeMode = await AdaptiveTheme.getThemeMode();
    setState(() {
      themeSombre = (savedThemeMode.toString() == "AdaptiveThemeMode.dark") ? true : false; 
    });
  }
}