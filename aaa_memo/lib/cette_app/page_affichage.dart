import 'package:aaa_memo/donnees/news_rss.dart';
import 'package:aaa_memo/exo/comprehension_clicker/clicker.dart';
import 'package:aaa_memo/exo/exo_a_facebook/facebook.dart';
import 'package:aaa_memo/exo/exo_b_profil/profil_page.dart';
import 'package:aaa_memo/exo/exo_c_quizz/quizz.dart';
import 'package:aaa_memo/exo/exo_d_meteo/page_meteo.dart';
import 'package:aaa_memo/menu/app_navbar.dart';
import 'package:aaa_memo/cette_app/bottom_navbar.dart';
import 'package:aaa_memo/menu/drawer.dart';
import 'package:aaa_memo/menu/multi_bottom_navbar.dart';
import 'package:aaa_memo/modalRouting/le_routing.dart';
import 'package:aaa_memo/modalRouting/les_alert.dart';
import 'package:aaa_memo/modalRouting/les_simple_dialog.dart';
import 'package:aaa_memo/modalRouting/les_snackbar.dart';
import 'package:aaa_memo/package_ajout/api_json.dart';
import 'package:aaa_memo/package_ajout/icone_app.dart';
import 'package:aaa_memo/package_ajout/image_picker.dart';
import 'package:aaa_memo/package_ajout/le_adaptive_theme.dart';
import 'package:aaa_memo/package_ajout/location_geocode.dart';
import 'package:aaa_memo/package_ajout/page_add_package.dart';
import 'package:aaa_memo/package_ajout/shared_preferences.dart';
import 'package:aaa_memo/package_ajout/url_launcher.dart';
import 'package:aaa_memo/stateful/calendrier_horloge.dart';
import 'package:aaa_memo/stateful/les_boutons.dart';
import 'package:aaa_memo/stateful/les_checkbox.dart';
import 'package:aaa_memo/stateful/les_radio.dart';
import 'package:aaa_memo/stateful/les_slider.dart';
import 'package:aaa_memo/stateful/les_switch.dart';
import 'package:aaa_memo/stateful/les_textfield.dart';
import 'package:aaa_memo/stateful/les_listeners.dart';
import 'package:aaa_memo/stateless/l_icone.dart';
import 'package:aaa_memo/stateless/la_stack.dart';
import 'package:aaa_memo/stateless/le_future_builder.dart';
import 'package:aaa_memo/stateless/le_texte.dart';
import 'package:aaa_memo/stateless/les_conteneurs.dart';
import 'package:aaa_memo/stateless/les_espaceurs.dart';
import 'package:aaa_memo/stateless/les_grilles.dart';
import 'package:aaa_memo/stateless/les_images.dart';
import 'package:aaa_memo/stateless/les_listes.dart';
import 'package:flutter/material.dart';
import 'package:aaa_memo/generique/page_generique.dart';

class PageAffichage extends StatefulWidget{
 
  final pageAAfficher;

  PageAffichage({required this.pageAAfficher});

  @override
  State<StatefulWidget> createState() => PageAffichageState();

}
class PageAffichageState extends State<PageAffichage>{

  Map<String, dynamic> mapContenu = {

    "Menu": PageGenerique(),"AppBar": AppNavBar(), "BottomNavBar": MultiBotomNavbar(), "Drawer": DrawerMenu(),

    "Générique": PageGenerique(), "Main": PageGenerique(), "Dynamique": PageGenerique(), "Dart": PageGenerique(),

    "Widget Basiques": PageGenerique(), "Container": LesConteneurs(), "Espaceur": LesEspaceurs(), "Stack": LaStack(), 
        "Texte": LeTexte(), "Liste": LesListes(),"Grille": LesGrilles(), "Icone": LIcone(), "Image": LesImages(),

    "Widget Interactifs": PageGenerique(), "Bouton": LesBoutons(), "TextField": LesTextField(), 
        "Checkbox": LesCheckbox(), "Switch": LesSwitch(), "Slider": LesSlider(), "Radio": LesRadio(), 
        "DateTimePicker": CalendrierHorloge(), "Future Builder": LeFutureBuilder(),
        "Listeners": LesListeners(),

    "Modal Routing": PageGenerique(), "SnackBar": LesSnackBar(), "Alert": LesAlert(), "Dialog": LesSimpleDialog(), 
        "Routing": LeRouting(),

    "Package": PageGenerique(), "ImagePicker": LeImagePicker(), "Localisation": LocationGeoCode(), 
        "Shared Préférences": LesSharedPreferences(), "Adaptive Theme" : PageAdaptative(),
        "Launcher Icon" : IconeApp(), "URL Launcher": LeUrlLauncher(),

    "Data": PageGenerique(), "News RSS": NewsRss(), "Api Json": ApiJson(),
    
    "Clicker": Clicker(title: "Clicker"), "Facebook": Facebook() , "Profil": PageProfil(),
        "Quizz": Quizz(), "Météo": PageMeteo()
  };
  dynamic contenuPage;

   @override
  Widget build(BuildContext context) {

   return Scaffold(
      appBar: AppBar(title: Text(widget.pageAAfficher), centerTitle: true,),
      body: SingleChildScrollView(child:Center(child: mapContenu[widget.pageAAfficher])),
      //bottomNavigationBar: BottomNavBar(),
    );
  }
}
  