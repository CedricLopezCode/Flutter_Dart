import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class LesListeners extends StatefulWidget{
  const LesListeners({Key? key}) : super(key: key);

  @override
  LesListenersState createState () => LesListenersState();

}

class LesListenersState extends State<LesListeners>{
  double x = 0.0;
  double y = 0.0;
  int _downCounter = 0;
  int _upCounter = 0;
  int _enterCounter = 0;
  int _exitCounter = 0;
  Color couleur = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Listener(
          onPointerDown: _incrementDown,
          onPointerMove: _updateLocation,
          onPointerUp: _incrementUp,
          child: Container( color: couleur, width: 300, height: 200,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                const Text("listener"),
                Text('$_downCounter presses\n$_upCounter releases',style: Theme.of(context).textTheme.headline4,),
                Text('The cursor is here: (${x.toStringAsFixed(2)}, ${y.toStringAsFixed(2)})',),
              ],
            ),
          ),
        ),
      
      Divider(),
      MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: _incrementEnter,
        onHover: _updateLocation,
        onExit: _incrementExit,
        child: Container( color: couleur, width: 300, height: 200,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              const Text("Mouse Region"),
              const Text("J'ai l'impression ça marche que pour le web"),
              Text('$_enterCounter Entries\n$_exitCounter Exits',style: Theme.of(context).textTheme.headline4,),
              Text('The cursor is here: (${x.toStringAsFixed(2)}, ${y.toStringAsFixed(2)})',),
            ],
          ),
        ),
      ),
    ],)
    ;
  }
  //_incrementHover(PointerEvent details) => setState(() => couleur = Colors.red);
  //_incrementCancel(PointerEvent details) => setState(() => couleur = Colors.green);
  _incrementEnter(PointerEvent details) {
    setState(() {
      _enterCounter++;
      couleur = Colors.red;
    });
  }

  _incrementExit(PointerEvent details) {
    setState(() {
      _exitCounter++;
      couleur = Colors.blue;
    });
  }

  _updateLocation(PointerEvent details) {
    setState(() {
      x = details.position.dx;
      y = details.position.dy;
    });
  }
  _incrementDown(PointerEvent details) {
    _updateLocation(details);
    setState(() {
      _downCounter++;
      couleur = Colors.red;
    });
  }
  _incrementUp(PointerEvent details) {
    _updateLocation(details);
    setState(() {
      _upCounter++;
      couleur = Colors.blue;
    });
  }

}