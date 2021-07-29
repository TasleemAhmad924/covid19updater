import 'package:CovidApp/datasorce.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 
      Text('FAQ', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'JosefinSans'),),
      centerTitle: true,
      leading: new IconButton(
       icon: new Icon(Icons.arrow_back_ios_rounded, color: Colors.black87),
       onPressed: () => Navigator.of(context).pop(),
       ), 
      backgroundColor: Colors.transparent,
         elevation: 0.0, ),
      body: ListView.builder(
        itemCount: DataSource.questionAnswers.length,
        itemBuilder: (context,index){return ExpansionTile(title: Text(DataSource.questionAnswers[index]['question'],
        style: TextStyle(fontWeight: FontWeight.bold),),
      children: <Widget>[
        Padding(padding: EdgeInsets.all(8.0),
        child: Text(DataSource.questionAnswers[index]['answer']),
        ),
      ],
      );
      },
      ),
    );
  }
}