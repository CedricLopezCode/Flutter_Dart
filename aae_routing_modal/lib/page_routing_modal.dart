import 'package:flutter/material.dart';

class PageRoutingModal extends StatefulWidget{
  PageRoutingModalState createState () => PageRoutingModalState();

}
class PageRoutingModalState extends State<PageRoutingModal>{
  
  //Les const et var
 

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
          bloc1(),
          boutonPlus(),
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
  ElevatedButton boutonSnackBarMin(){ 
    return ElevatedButton(
        onPressed: (){
          final maSnackbar = SnackBar(content: Text("Ma snackbar min"));
          ScaffoldMessenger.of(context).showSnackBar(maSnackbar);
        },
        child: Text("Snackbar min"), 
      );
  }
  Container bloc2() {
    return Container(color: Colors.green, width: 300, height: 100, child: Text("Bloc 2"),);
  }
  Container bloc3() {
    return Container(color: Colors.red, width: 300, height: 100, child: Text("Bloc 3"),);
  }
  Container bloc4() {
    return Container(color: Colors.yellow, width: 300, height: 100, child: Text("Bloc 4"),);
  }
}