import 'package:aaa_memo/main.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key ? key}) : super(key : key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Révision',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Cours',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Exo',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Essais',
            backgroundColor: Colors.blueGrey,
          ),
        ],

        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow,
        onTap: ((int index) => setState((){ 
          _selectedIndex = index;
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext ctx) => PageSommaire(indexBottom: index))
          );
        })),
      );
  }

}
