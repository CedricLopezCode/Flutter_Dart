import 'package:flutter/material.dart';

class TitrePrenom extends Text{
  String titrePrenom;
  
  TitrePrenom({required this.titrePrenom}) 
    :super (
      titrePrenom,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
}
