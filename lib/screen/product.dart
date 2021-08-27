import 'package:flutter/material.dart';
import '../models/clothesupdata.dart';
import 'package:provider/provider.dart';
import './screen_list.dart';


class Product extends StatefulWidget {
  
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
   final turkey= Provider.of<ClothesUpdata>(context).turkey;
   final uae= Provider.of<ClothesUpdata>(context).uae;
   final kuwait=Provider.of<ClothesUpdata>(context).kuwait;
   final indian=Provider.of<ClothesUpdata>(context).indian;
    return 
    Container(
  margin: EdgeInsets.only(left: 10, top: 40, right: 10, bottom: 30),
  height: double.infinity,
  width: double.infinity,
  decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(80),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(80)
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.amber.withOpacity(0.9),
        //  spreadRadius: 5,
          blurRadius: 7,
         // offset: Offset(0, 3), // changes position of shadow
        ),
      ],
  ),

child:
 SingleChildScrollView(
        child:
      Column(
        
        children: <Widget>[
       
 
          new SizedBox(
        width: 120,
        height: 80,
          child:
              Image.asset('assets/images/unnamed.png'),),
      

          Row(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation:20,
              child:
             new SizedBox(
                           width:300 ,
                           height:80,
                child:
        FlatButton(child:Text('الموديل الهندية',style:TextStyle(height: 3, fontSize: 20,color:Colors.black87)),
        onPressed:() {
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScreenList(indian,'الموديل الهندية')),
  );
}
       ),
            ),),
            ],),
          Row(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Card(elevation:20,
              child: new SizedBox(
                           width:300 ,
                           height:80,
                child:
        FlatButton(child:Text('الموديل تركية',style:TextStyle(height: 3,fontSize:20,color:Colors.black87)),
        onPressed: () {
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  ScreenList(turkey,'الموديل تركية')),
  );
} ),
          ),),
          ],),
          Row(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Card(elevation:20,
              child: 
              new SizedBox(
                           width:300 ,
                           height:80,
                child:
        FlatButton(child:Text('الموديل الإماراتية',style:TextStyle(height: 3, fontSize: 20,color:Colors.black87)),
        onPressed: (){
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScreenList(uae,'الموديل الإماراتية')),
  );}),
           ),
            ),
          ],),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
Card(elevation:20,
              child:
               new SizedBox(
                           width:300 ,
                           height:80,
                child:
        FlatButton(child:Text('الموديل كويتية',style:TextStyle(height: 3, fontSize: 20,color:Colors.black87)),
        onPressed: (){
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScreenList(kuwait,'الموديل كويتية')),
  );} ),
),),
          ],),
  
        
      ],
      ),
      ),
    );
    
  }
}