import 'dart:io';

import 'package:aaa_memo/exo/exo_e_courses/mes_listes.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; // pour avoir des chemins
import 'package:path_provider/path_provider.dart';

class DataBaseClient {

 Database? _database; 

  Future get database async { //pas de () et pas besoin d'écrire get quand on l'appelle
    if (_database != null) {
      return _database as Database;
    } else {
      print("pas encore de DB");
      _database = await creerDB();
      return _database as Database;
    }
  }

  Future creerDB() async {
    Directory directory = await getApplicationDocumentsDirectory(); //récupérer
    String databaseDirectory = join(directory.path, "database.db"); //transformer l'appel du directory en String
    var bdd = await openDatabase(databaseDirectory, version: 1, onCreate: _creerTables);  //l'équivalent du use DB
    return bdd; //les infos de ma DB
  }

  Future _creerTables(Database db, int version) async {
    //Table Listes de Listes
    await db.execute( '''
      CREATE TABLE mes_listes (
        id INT PRIMARY KEY, 
        nom TEXT NOT NULL 
      )'''
    );
  }
  Future insetIntoMesListes(MesListes mesListes) async {  
    Database maDB = database as Database;
    mesListes.id = await maDB.insert("mes_listes", mesListes.envoiInfos()) ;//Je comprend pas cette Fonction !!!!!!
    return mesListes; //???????
  }
  Future readAllListes() async {
    Database maDB = await database;
    List<Map<String, dynamic>> resultat = await maDB.rawQuery("SELECT * FROM mes_listes");
    List<MesListes> allListes =[];
    resultat.forEach((map) {
      MesListes uneListe = MesListes();
      uneListe.recupInfos(map);
      allListes.add(uneListe);
    });
    return allListes;
  }

}
    /*
    //Table Article
    await db.execute('''
      CREATE TABLE article (
        id INT PRIMARY KEY,
        nom TEXT NOT NULL,
        mes_listes INT,
        prix TEXT,
        magasin TEXT,
        image TEXT 
      )'''
    );*/