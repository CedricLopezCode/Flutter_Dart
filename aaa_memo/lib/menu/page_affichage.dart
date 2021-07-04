import 'package:aaa_memo/menu/app_navbar.dart';
import 'package:aaa_memo/menu/bottom_navbar.dart';
import 'package:aaa_memo/menu/multi_bottom_navbar.dart';
import 'package:aaa_memo/modalRouting/le_routing.dart';
import 'package:aaa_memo/modalRouting/les_alert.dart';
import 'package:aaa_memo/modalRouting/les_simple_dialog.dart';
import 'package:aaa_memo/modalRouting/les_snackbar.dart';
import 'package:aaa_memo/package_ajout/page_add_package.dart';
import 'package:aaa_memo/stateful/calendrier_horloge.dart';
import 'package:aaa_memo/stateful/les_boutons.dart';
import 'package:aaa_memo/stateful/les_checkbox.dart';
import 'package:aaa_memo/stateful/les_radio.dart';
import 'package:aaa_memo/stateful/les_slider.dart';
import 'package:aaa_memo/stateful/les_switch.dart';
import 'package:aaa_memo/stateful/les_textfield.dart';
import 'package:aaa_memo/stateless/l_icone.dart';
import 'package:aaa_memo/stateless/la_stack.dart';
import 'package:aaa_memo/stateless/le_texte.dart';
import 'package:aaa_memo/stateless/les_conteneurs.dart';
import 'package:aaa_memo/stateless/les_espaceurs.dart';
import 'package:aaa_memo/stateless/les_images.dart';
import 'package:aaa_memo/stateless/liste_grille.dart';
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
    "menu": PageGenerique(), "generique": PageGenerique(), "stateless": PageGenerique(), "stateful": PageGenerique(), "modalRouting": PageGenerique(), "package": PageGenerique(),
    "AppBar": AppNavBar(), "BottomNavBar": MultiBotomNavbar(),
    "Main": PageGenerique(), "Dynamique": PageGenerique(), "Dart": PageGenerique(),
    "Container": LesConteneurs(), "Espaceur": LesEspaceurs(), "Stack": LaStack(), "Texte": LeTexte(), "ListeGrille": ListeGrille(), "Icone": LIcone(), "Image": LesImages(),
    "Bouton": LesBoutons(), "TextField": LesTextField(), "Checkbox": LesCheckbox(), "Switch": LesSwitch(), "slider": LesSlider(), "radio": LesRadio(), "DateTimePicker": CalendrierHorloge(),
    "SnackBar": LesSnackBar(), "Alert": LesAlert(), "Dialog": LesSimpleDialog(), "Routing": LeRouting(),
    "ImagePicker": PageAddPackage(),
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
  