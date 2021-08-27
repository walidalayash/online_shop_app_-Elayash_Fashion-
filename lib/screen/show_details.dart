import 'package:alayash/models/clothes.dart';
import 'package:flutter/material.dart';
import '../widget/product_image.dart';

class ShowDetails extends StatelessWidget{
static const routeName = '/show_details';
  final List<Clothes> clothes;
  final index;
  ShowDetails(this.clothes,this.index);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
          appBar:AppBar(title:Text('Details')),
          body: SingleChildScrollView(
            child: 
          Column(children: <Widget>[
          
        // Image.network(clothes[index].image,),
         Center(
                    child: Hero(
                      tag: '${clothes[index].image}',
                      child: ProductPoster(
                      //  size: size,
                        image: clothes[index].image,
                      ),
                      ),
         ),
        Text(clothes[index].size,style:TextStyle(fontSize: 60,color:Colors.black)),
       
        Text('الألوان',style:TextStyle(fontSize: 20,color:Colors.black87)),
  
        Text(clothes[index].color,style:TextStyle(fontSize: 30,color:Colors.black87)),
        Text('السعر',style:TextStyle(fontSize: 20,color:Colors.black87)),
        Text(clothes[index].price,style:TextStyle(fontSize: 60,color:Colors.black87)),
        Text('الصنف',style:TextStyle(fontSize: 20,color:Colors.black87)),

            Text(clothes[index].type,style:TextStyle(fontSize: 20,color:Colors.black87)),        
         
        
            ],  ),
         
            
      ),
    );
  }
}