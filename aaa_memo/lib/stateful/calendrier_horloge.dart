import 'package:flutter/material.dart';

class CalendrierHorloge extends StatefulWidget{
  
  @override
  CalendrierHorlogeState createState () => CalendrierHorlogeState();

}
class CalendrierHorlogeState extends State<CalendrierHorloge>{
  
  //Les const et var
  DateTime dateInitiale = DateTime.now(); //Picker Date
  DateTime dateSelected = DateTime.now(); //Picker Date //possibilite ecrire date: DateTime.utc(2020, 12, 16);
  TimeOfDay heureInitiale = TimeOfDay.now(); //Picker Time
  TimeOfDay heureSelected = TimeOfDay.now(); //Picker Time
  

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          //----------------------------------   Calendrier  -----------------------------------------
      Row(children: [
        ElevatedButton(
          child: Icon(Icons.calendar_today),
          onPressed: (() => montrerCalendrier(context)),
        ),
        Text(dateSelected.toString()),
        Text("Le ${dateSelected.weekday} ${dateSelected.day}/${dateSelected.month}/${dateSelected.year} à ${dateSelected.hour} h ${dateSelected.minute}"),
      ],),
      
      //----------------------------------   Horloge  -----------------------------------------
      Row(children: [
        ElevatedButton(
          child: Icon(Icons.watch),
          onPressed: (() => montrerHorloge(context)),
        ),
        Text(heureSelected.toString()),
        Text("A ${heureSelected.hour}h ${heureSelected.minute} min "),
      ],),
        ],
      )
    ;//fin return
  }
 //----------------------------------   DatePicker  -----------------------------------------
  /*void*/ montrerCalendrier(BuildContext context){
    showDatePicker(context: context, 
      initialDate: dateSelected, 
      firstDate: DateTime(1980), 
      lastDate: DateTime(2050), 
    ).then((value) => setState(() => dateSelected = value ?? dateInitiale));
  }
  /*void montrerHorloge(BuildContext context){
    showTimePicker(context: context, 
      initialTime: dateInitiale.,
    )
  }*/
  //----------------------------------   TimePicker  -----------------------------------------
  /*void*/ montrerHorloge(BuildContext context){
    showTimePicker(context: context, 
      initialTime: heureSelected,
    ).then((value) =>  setState(() => heureSelected = value ?? heureInitiale));
  }
  /*void montrerHorloge(BuildContext context){
    showTimePicker(context: context, 
      initialTime: dateInitiale.,
    )
  }*/
}