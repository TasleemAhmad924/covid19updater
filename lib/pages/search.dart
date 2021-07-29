import 'package:flutter/material.dart';
import 'package:CovidApp/datasorce.dart';

class Search extends SearchDelegate{

  final List countryList;

  Search(this.countryList);

  @override
  List<Widget> buildActions(BuildContext context) {
     return [
       IconButton(icon: Icon(Icons.clear_rounded), onPressed: (){
         query='';
       },),
     ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      return 
        IconButton(icon: Icon(Icons.arrow_back_ios_rounded), onPressed: (){
          Navigator.pop(context);
        });
    }
  
    @override
    Widget buildResults(BuildContext context) {
      return Container();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
      
     final suggestionList = query.isEmpty?countryList: countryList.where((element) =>  element['country'].toString().toLowerCase().startsWith(query)).toList(); 
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context,index){
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
                Text(suggestionList[index]['country'], style: TextStyle(fontWeight: FontWeight.bold)),
                Image.network(suggestionList[index]['countryInfo']['flag'], height: 50, width: 60,),
              ],
            ),
          ),
          Expanded(child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Bestätigt :' +  suggestionList[index]['cases'].toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent),),
                Text('Aktive Fälle :' +  suggestionList[index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),),
                Text('Genesen :' +  suggestionList[index]['cases'].toString(),style: TextStyle(fontWeight: FontWeight.bold, color: Colors.greenAccent),),
                Text('Verstorben :' +  suggestionList[index]['cases'].toString(),style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),
                
              ],
            ),
          ),
          ),
        ],
        ),
      );
    },
    );
  }
  
}