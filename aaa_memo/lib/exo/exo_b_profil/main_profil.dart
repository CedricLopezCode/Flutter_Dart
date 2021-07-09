import 'package:flutter/material.dart';
import 'package:aaa_memo/exo/exo_b_profil/profil.dart';
import 'package:aaa_memo/exo/exo_b_profil/profil_page.dart';


class MainProfil extends StatefulWidget {
  MainProfil({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MainProfilState createState() => _MainProfilState();
}

class _MainProfilState extends State<MainProfil> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: PageProfil()
      ),
    );
  }
}
