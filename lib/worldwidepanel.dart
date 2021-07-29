import 'dart:io';
import 'package:CovidApp/constants/theme_data.dart';
import 'package:flutter/material.dart';


class WorldWidePanel extends StatelessWidget {

final Map wolrdData;

  const WorldWidePanel({Key key, this.wolrdData}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
//        decoration: BoxDecoration(
//        borderRadius: BorderRadius.all(Radius.circular(15.0))) ,
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          StatusPanel(title:'Bestätigt', panelColor: Colors.red[200], textColor: Colors.redAccent[700],count: wolrdData['cases'].toString(),),
          StatusPanel(title:'Aktive Fälle', panelColor: Colors.blue[200], textColor: Colors.blue[700], count: wolrdData['active'].toString(),),
          StatusPanel(title:'Genesen', panelColor: Colors.green, textColor: Colors.green[200], count: wolrdData['recovered'].toString(),),
          StatusPanel(title:'Verstorben', panelColor: Colors.grey, textColor: Colors.grey[200], count: wolrdData['deaths'].toString(),),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {

  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      height: 80, width: width/2,
      decoration: BoxDecoration(
//        border: Border.all(color: Colors.black, width: 6.0),
        color: panelColor, borderRadius: BorderRadius.all(Radius.circular(15.0)), boxShadow: [ BoxShadow(
                      color: Colors.grey[500],
                      offset: Offset(2.0, 2.0),
                      blurRadius: 10.0,
                      spreadRadius: 0.5,
                      ),
                      BoxShadow(
                      color: Colors.white,
                      offset: Offset(-2.0, -2.0),
                      blurRadius: 10.0,
                      spreadRadius: 0.5,
                      ),
                       ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
            ), Text(count ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textColor ),
            ),
        ],
      ),
    );
  }
}