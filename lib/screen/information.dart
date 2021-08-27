import 'package:flutter/material.dart';
import 'package:link/link.dart';


class Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  
         
      SingleChildScrollView(
      child:
     
  Column(
       crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[ 
        new SizedBox(
  height: 20,  ),
          Container(
height: 200,
  width: 380,
  decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(20)
     ),
     boxShadow: [
       BoxShadow(
         color: Colors.amber.withOpacity(0.7),
    //     spreadRadius: 5,
         blurRadius: 7,
     //    offset: Offset(0, 3), // changes position of shadow
       ),
     ],
  ),
                     
            child:
          
      Column(
      
        children: <Widget>[
        
       Text('العياش (للازياء النسائية).',style:TextStyle( fontSize: 20,color:Colors.black)),
       Text('فروعنا:'),
       Text('فنيسيا - مقابل مطعم الشباب',style:TextStyle( fontSize: 20,color:Colors.black)),
       Text('أمتداد شارع 20 - بعد مختبر السليم',style:TextStyle(fontSize: 20,color:Colors.black)),
       Text('شارع عشرين - بعد مصوراتي بيروت',style:TextStyle(fontSize: 20,color:Colors.black)),


        ]
        
      ),
      ),
                 new SizedBox(
  height: 20,  ),
 Container(
  margin: EdgeInsets.only(left: 5, top: 10, right: 5, bottom: 10),
  height: 200,
  width: 380,
  decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(20)
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.amber.withOpacity(0.7),
        //  spreadRadius: 5,
          blurRadius: 7,
         // offset: Offset(0, 3), // changes position of shadow
        ),
      ],
  ),
         child:
      Column(
      
        children: <Widget>[
        Text('تنفيذ شركة ذائع للبرمحيات',style:TextStyle(fontSize: 20,color:Colors.black)),
        Text('بواسطة',style:TextStyle(fontSize: 20,color:Colors.black)),
        Text('وليد العياش',style:TextStyle(fontSize: 20,color:Colors.black)),
        Text('للتواصل معانا علي الفيس',style:TextStyle(fontSize: 20,color:Colors.black)),
        
      ]
        
      ),
      ),
      Row(
        children: <Widget>[
    Link(
  child: new SizedBox(
    
     width:90,
    
    height: 100,
    child:
    Image.asset('assets/images/facebook.png'),
  ),
  url: 'http://www.google.com',
 // onError: _onErrorCallback
),
           Link(
  child: new SizedBox(
    
     width:90,
    
    height: 80,
    child:
  Image.asset('assets/images/instagram.png'),),
  url: 'http://www.google.com',
 // onError: _onErrorCallback
),
  Link(
  child: new SizedBox(
    
     width:90,
    
    height: 90,
    child:
  Image.asset('assets/images/twitter.png'),),
  url: 'http://www.google.com',
 // onError: _onErrorCallback
),
  Link(
  child: new SizedBox(
    
     width:90,
    
    height: 90,
    child:
  Image.asset('assets/images/whatsapp.png'),),
  url: 'http://www.google.com',
 // onError: _onErrorCallback
), 


      ],)
      ]
      ),
    );
  }
}
