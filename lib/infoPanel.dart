import 'package:CovidApp/pages/faqs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget> [
          Container(
            child: Row(
              children: <Widget> [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQPage()));

                  },
                     child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                    child: Row(
                      children: <Widget>[
                        Text('FAQS', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),),
                        Icon(Icons.arrow_forward_ios, color: Colors.black87, size: 18.0,)
                      ]
                    ),
                  ),
                ),
                  GestureDetector(
                    onTap: () {
                      launch('https://covid19responsefund.org/en/');
                    },
                    child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration( 
                      color: Colors.grey[300], 
                      borderRadius: BorderRadius.all(Radius.circular(20)), 
                      boxShadow: [ BoxShadow(
                        color: Colors.grey,
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
                    child: Row(
                      children: <Widget>[
                        Text('Spenden', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),),
                        Icon(Icons.arrow_forward_ios, color: Colors.black87, size: 18.0,)
                      ]
                    ),
                ),
                  ),
                   GestureDetector(
                     onTap: ()
                     {
                       launch('https://www.rki.de/SharedDocs/FAQ/NCOV2019/gesamt.html;jsessionid=07A0ACAE226486A15884C902DD100E88.internet101?nn=13490888');
                     },
                   child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                  child: Row(
                      children: <Widget>[
                        Text('RKI HP', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),),
                        Icon(Icons.arrow_forward_ios, color: Colors.black87, size: 18.0,)
                      ]
                  ),
                ),
                   )
              ],
              )
          )
        ],
      )
    );
  }
}