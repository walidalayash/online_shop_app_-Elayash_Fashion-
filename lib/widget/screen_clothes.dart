import 'package:flutter/material.dart';
import './description.dart';
import '../models/clothes.dart';
import '../models/clothesupdata.dart';
import 'package:provider/provider.dart';

class ScreenClothes extends StatelessWidget {
  List<Clothes> clothesShow;
  ScreenClothes(this.clothesShow);

  void _descricptionClothes(BuildContext ctx,index) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: Descripotion(clothesShow,index),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog(index) async {
            Provider.of<ClothesUpdata>(context,listen:false).addOrder(clothesShow,index);

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('السلة'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('تم إضافتها في السلة طلبات'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('موافق'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
  itemCount: clothesShow.length,
  itemBuilder: (context, index) {
      return Column(
      children: <Widget>[
        Card(
        elevation:20,
        child:
  
            Stack(
      
                    children: <Widget>[


 Image.network(clothesShow[index].image),
           new SizedBox(
               
              height: 315,
      
),
            Row(
              
      children: <Widget>[
         Container(
   decoration: BoxDecoration(
color: Colors.amber,
      
                ),
      
            child:
      
      FlatButton(onPressed:()=>_descricptionClothes(context,index), 
      
      child: Text('التفاصيل',style:TextStyle(color:Colors.black,)),
      ) 
         ),
Container(
   decoration: BoxDecoration(
color: Colors.amber,
             borderRadius: BorderRadius.only(
             // topLeft:Radius.circular(10),
                topRight: Radius.circular(80),
            //     bottomLeft: Radius.circular(10),
             //    bottomRight: Radius.circular(10)
               ),
                ),
            child:
      FlatButton(onPressed:()=>
      _showMyDialog(index),
      child: Text('اطلب',style:TextStyle(color:Colors.black,)),

      ) 
         ),
      ],),
  ],),
  ),
  ],
  );
  }                         
         );
  }
}