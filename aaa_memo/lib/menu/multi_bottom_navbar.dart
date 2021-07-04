import 'package:flutter/material.dart';

class MultiBotomNavbar extends StatefulWidget{
  
  @override
  MultiBotomNavbarState createState () => MultiBotomNavbarState();

}
class MultiBotomNavbarState extends State<MultiBotomNavbar>{
  
  int _selectedIndex = 0;
  TextStyle optionStyle = TextStyle(fontSize: 10, fontWeight: FontWeight.bold,);

  List<BottomNavigationBarItem> listeIcon = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
      backgroundColor: Colors.green,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.school),
      label: 'Ecole',
      backgroundColor: Colors.blue,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Travail',
      backgroundColor: Colors.red,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
      backgroundColor: Colors.blueGrey,
    ),
  ];
 
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Divider(color: Colors.blue, thickness: 2,),
          navDefOption(),
          Divider(color: Colors.blue, thickness: 2,),
          navSimple(),
          Divider(color: Colors.blue, thickness: 2,),
          navMoyenne(),
          Divider(color: Colors.blue, thickness: 2,),
          navComplexe(),
          Divider(color: Colors.blue, thickness: 2,),
        ],
      )
    ;//fin return
  }

  BottomNavigationBar navDefOption() {
    return BottomNavigationBar(
      // Toujours 
        items: listeIcon, //Les Icones et label
        currentIndex: _selectedIndex, 
        onTap: ((int index) => setState(() => _selectedIndex = index)),

      //Options pour différencier selected ou non
        showSelectedLabels: false,  //pour cacher le label
        showUnselectedLabels: true,//Si on veut tout le temps afficher tous les label
        selectedFontSize: 15,
        unselectedFontSize: 10,
        selectedLabelStyle: optionStyle,  //mettre une couleur dans le style sert à rien
        unselectedLabelStyle: optionStyle,
        selectedItemColor: Colors.yellow, //Par défaut white
        unselectedItemColor: Colors.black, //Par défaut white

      //Options Générales
        backgroundColor: Colors.teal, //Ne sert à rien si un background color est dans les items sauf si fixed
        type: BottomNavigationBarType.fixed, //Si on veut pas que les icones bouge quand on clique
        // !!! fixed inhibe le background color des items et garde un fond blanc
        enableFeedback: false,  //Désactive le bruit quad on clique
      
      //Options de détail
        iconSize: 30, 
        elevation: 10,

      
      );
  }

  BottomNavigationBar navSimple() {
    return BottomNavigationBar(
      // Commun 
        items: listeIcon,
        currentIndex: _selectedIndex,
        iconSize: 30,
        selectedItemColor: Colors.yellow,
        onTap: ((int index) => setState(() => _selectedIndex = index)),
      //  Différent
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: optionStyle,
        unselectedLabelStyle: optionStyle,
        //showUnselectedLabels: false,
      );
  }
  BottomNavigationBar navMoyenne() {
    return BottomNavigationBar(
      // Commun 
        items: listeIcon,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow,
        onTap: ((int index) => setState(() => _selectedIndex = index)),
      //  Différent
      );
  }
  BottomNavigationBar navComplexe() {
    return BottomNavigationBar(
      // Commun 
        items: listeIcon,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow,
        onTap: ((int index) => setState(() => _selectedIndex = index)),
      //  Différent
      );
  }
  
}