import 'package:flutter/material.dart';

import '../models/clothes.dart';


class Descripotion extends StatelessWidget {
    List<Clothes> clothes;
    final index;
Descripotion(this.clothes,this.index);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: 
        Column(children: <Widget>[
       Text('السعر',style:TextStyle(fontSize: 20,color:Colors.black87)),
       Text(clothes[index].price,style:TextStyle(fontSize: 60,color:Colors.black87)),
       Text('المقاسات',style:TextStyle(fontSize: 20,color:Colors.black87)),
       Text(clothes[index].size,style:TextStyle(fontSize: 60,color:Colors.black)),
       Text('الألوان',style:TextStyle(fontSize: 20,color:Colors.black87)),
       Text(clothes[index].color,style:TextStyle(fontSize: 30,color:Colors.black87)),
       Text('الصنف',style:TextStyle(fontSize: 20,color:Colors.black87)),
       Text(clothes[index].type,style:TextStyle(fontSize: 20,color:Colors.black87)),     
          ],  ),
       
          
    );
  }
}