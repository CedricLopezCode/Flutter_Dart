import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart';


class NewsRss extends StatefulWidget{
  
  @override
  NewsRssState createState () => NewsRssState();

}
class NewsRssState extends State<NewsRss>{
  
  //Les const et var
 final url = "https://www.nintendo.fr/news.xml";

  @override
  void initState() {
    super.initState();
    //à l'init
  }
  @override
  void dispose() {
    //a la destruction
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Divider(color: Colors.blue, thickness: 2,),
          bloc1(),
          Divider(color: Colors.blue, thickness: 2,),
          bloc2(),
          Divider(color: Colors.blue, thickness: 2,),
          bloc3(),
          Divider(color: Colors.blue, thickness: 2,),
          bloc4(),
          Divider(color: Colors.blue, thickness: 2,),
        ],
      )
    ;//fin return
  }
  Container bloc1() {
    return Container(color: Colors.blue, width: 300, height: 100, child: Text("Bloc 1"),);
  }
  Container bloc2() {
    return Container(color: Colors.green, width: 300, height: 200, child: Text("Bloc 2"),);
  }
  Container bloc3() {
    return Container(color: Colors.red, width: 300, height: 100, child: Text("Bloc 3"),);
  }
  Container bloc4() {
    return Container(color: Colors.yellow, width: 300, height: 100, child: Text("Bloc 4"),);
  }
}