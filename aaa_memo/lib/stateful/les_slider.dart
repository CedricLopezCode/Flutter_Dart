import 'package:flutter/material.dart';

class LesSlider extends StatefulWidget{
  
  @override
  LesSliderState createState () => LesSliderState();

}
class LesSliderState extends State<LesSlider>{
  
  //Les const et var
 List<double> valeurSliders = [0, 10, 50]; //Slider

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
         Slider(
          value: valeurSliders[0], 
          onChanged: ((changSlider) => setState(() => valeurSliders[0] = changSlider)),
        ),
        Slider(
          value: valeurSliders[1], 
          min: -100, //Doit etre précisé si value ![0-1]
          max: 50, //Doit etre précisé si value ![0-1]
          onChanged: ((changSlider) => setState(() => valeurSliders[1] = changSlider)),
        ),
        Slider(
          value: valeurSliders[2], 
          min: 0,
          max: 100,
          divisions: 3, //ne peut prendre que ces valeurs là // 3 segments donc 4 valeurs
          label: valeurSliders[2].round().toStringAsFixed(2), //apparait au dessus quand on appuie
          onChanged: ((changSlider) => setState(() => valeurSliders[2] = changSlider)),
          activeColor: Colors.red,
          inactiveColor: Colors.yellow,
        ),
        Text("$valeurSliders"),
        ],
      )
    ;//fin return
  }
}