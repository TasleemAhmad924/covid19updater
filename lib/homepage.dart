

import 'dart:convert';

import 'package:CovidApp/datasorce.dart';
import 'package:CovidApp/infoPanel.dart';
import 'package:CovidApp/mostaffectedcountries.dart';
import 'package:CovidApp/pages/countryPage.dart';
import 'package:CovidApp/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key key, Color backgroundColor, double elevation}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v3/covid-19/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  } 

  List countryData;
  fetchCountryData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  } 

@override
  void initState() {
    fetchWorldWideData();
    fetchCountryData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         centerTitle: true,
         title: Text('Covid-19-Updater', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
         backgroundColor: Colors.transparent,
         elevation: 0.0,
       ),
       
       body: SingleChildScrollView(child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,

         children: <Widget>[
           Container(
             height: 80,
             alignment: Alignment.center,
             padding: EdgeInsets.all(10),
             decoration: BoxDecoration( 
                    color: Colors.grey[300], 
                    borderRadius: BorderRadius.all(Radius.circular(20)), 
                    boxShadow: [ BoxShadow(
                      color: Colors.grey[500],
                      offset: Offset(4.0, 4.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0,
                      ),
                      BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4.0, -4.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0,
                      ),
                       ]
                       ),
             child: Text(DataSource.quote, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17)
             ),
           ),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('Weltweit', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                 GestureDetector(
                   onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPage()));
                   },
                     child: Container(
                     decoration: BoxDecoration( 
                      color: Colors.grey[300], 
                      borderRadius: BorderRadius.all(Radius.circular(20)), 
                      boxShadow: [ BoxShadow(
                        color: Colors.grey[500],
                        offset: Offset(4.0, 4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0,
                        ),
                        BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0,
                        ),
                         ]
                         ),
                     padding: EdgeInsets.all(10),
                     child: Text('Länderweit', style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold),)),
                 ),
               ],
             ),
           ),
           worldData ==null? CircularProgressIndicator(): WorldWidePanel(wolrdData: worldData,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10.0),
             child: Text('Meist infizierte Länder', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
           ),
           SizedBox(height: 10,),
          countryData==null?Container():MostAffectedPanel(countryData: countryData,),
          InfoPanel(),
          SizedBox(height: 50, )
         ],
        ),
       ),
       
    );
    
  }
}