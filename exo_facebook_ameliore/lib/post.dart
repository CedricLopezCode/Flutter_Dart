class Post{

  String name;
  String time;
  String imagePath;
  String desc;
  int likes;
  int comments;

  Post({
    required this.name, 
    required this.time, 
    required this.imagePath, 
    required this.desc, 
    this.likes = 0, 
    this.comments = 0
  });

  String setLikes() => "$likes j'aime"; //=> remplace le return //pratique quand simple
  String setTime() => "Il y a $time";
  String setComments()=> comments >= 1 ?"$comments commentaires" : "pas de com";
  

}//Fin Post