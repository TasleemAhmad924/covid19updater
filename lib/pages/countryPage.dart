import 'package:CovidApp/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
  
}

class _CountryPageState extends State<CountryPage> {

 List countryData;
  fetchCountryData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries');
    setState(() {
      countryData = json.decode(response.body);
    });
  } 

@override
  void initState() {
    fetchCountryData();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      actions: <Widget>[
        IconButton(icon: Icon(Icons.search), color: Colors.black87, onPressed: (){
            showSearch(context: context, delegate: Search(countryData));
        }),
      ],
      title: Text('Länderweit', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'JosefinSans'),),
      centerTitle: true,
      leading: new IconButton(
       icon: new Icon(Icons.arrow_back_ios_rounded, color: Colors.black87),
       onPressed: () => Navigator.of(context).pop(),
       ), 
      backgroundColor: Colors.transparent,
         elevation: 0.0, ), 
      body:countryData==null?Center(child: CircularProgressIndicator(),): ListView.builder( itemBuilder: (context,index){
      return Container(
        height: 130,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)) ,color: Colors.grey[200], boxShadow: [
          BoxShadow(color: Colors.grey[100], blurRadius: 10, offset: Offset(0,10)),
        ]),
        child: Row(children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(countryData[index]['country'], style: TextStyle(fontWeight: FontWeight.bold)),
                Image.network(countryData[index]['countryInfo']['flag'], height: 50, width: 60,),
              ],
            ),
          ),
          Expanded(child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Bestätigt :' +  countryData[index]['cases'].toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent),),
                Text('Aktive Fälle :' +  countryData[index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),),
                Text('Genesen :' +  countryData[index]['cases'].toString(),style: TextStyle(fontWeight: FontWeight.bold, color: Colors.greenAccent),),
                Text('Verstorben :' +  countryData[index]['cases'].toString(),style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),
                
              ],
            ),
          ),
          ),
        ],
        ),
      );
    },
      itemCount: countryData==null?0:countryData.length,
    ), 
    );
    
  }
}