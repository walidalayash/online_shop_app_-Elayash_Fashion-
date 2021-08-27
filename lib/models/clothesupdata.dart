

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


import './clothes.dart';
class ClothesUpdata with ChangeNotifier {
    List<Clothes> clothes= [];
    List<Clothes> indian=[];
    List<Clothes> kuwait=[];
    List<Clothes> turkey=[];
    List<Clothes> uae=[];
    List<Clothes> nnew=[];
    List<Clothes> discount=[];
    List<Clothes> search=[];
    List<Clothes> order=[];
    List<String> done=[];
void addOrder(clothesShow,index){

  order.add(Clothes(
            image:clothesShow[index].image,
            color: clothesShow[index].color,
            size : clothesShow[index].size,
            price: clothesShow[index].price,
            type:  clothesShow[index].type,
            date: clothesShow[index].date,
            classification:clothesShow[index].classification,
          ),);
      
}
    double colOrder(){
      double sum=0.0;
      for(int i=order.length-1;i>=0;i--){
           sum=double.parse(order[i].price)+sum;
      }
           return sum;
         }
         void deleteOrder(index){
      order.remove(order[index]);
    notifyListeners();

         }
     

  
   void showAlert(BuildContext context) {
    var alert = new AlertDialog(
      content: Container(
        child: Row(
          children: <Widget>[Text('text')],
        ),
      ),
      actions: <Widget>[
        new FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "OK",
              style: TextStyle(color: Colors.blue),
            ))
      ],
    );

    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }


         Future<void> addOrderClothes(String enteredImage,String enteredColor,
   String enteredSize ,String enteredprice ,
   String enteredType,String enteredclassification,String selectedItem,String phoneController) async{
    const url='https://shop-5d193.firebaseio.com/order.json';
    final timetamp= DateTime.now();
     try {
       done=[];
    http.post(url, body:json.encode({
      'image':enteredImage.toString(),
      'color':enteredColor,
      'size': enteredSize,
      'price':enteredprice,
      'type': enteredType,
      'date': timetamp.toIso8601String(),
      'classificatione': enteredclassification,
      'place':selectedItem,
      'phone':phoneController,
     
    }),);
    
     done.add('value');
    print(done);
    } catch (error) 
    {
      throw showAlert ;
    }
   }
       
    
  Future<void> fetchAndSetClothes() async {
    const url = 'https://shop-5d193.firebaseio.com/clothes.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      
      List<Clothes> loadedClothes = [];
      extractedData.forEach((clothesId, pclothes) {
        loadedClothes.add(Clothes(
      image: pclothes['image'],
      color: pclothes['color'],
      size : pclothes['size'],
     price: pclothes['price'],
      type:  pclothes['type'],
      date: pclothes['date'],
      classification:pclothes['classificatione'],
      
        ));
        
      });
      if(clothes.isEmpty){
         for(int i=loadedClothes.length-1;i>=0;i--){
          clothes.add(Clothes(
            image:loadedClothes[i].image,
            color: loadedClothes[i].color,
            size : loadedClothes[i].size,
            price: loadedClothes[i].price,
            type:  loadedClothes[i].type,
            date: loadedClothes[i].date,
            classification:loadedClothes[i].classification,
          ),);
           if (loadedClothes[i].type=='هندي'){
          indian.add(Clothes(
            image:loadedClothes[i].image,
            color: loadedClothes[i].color,
            size : loadedClothes[i].size,
            price: loadedClothes[i].price,
            type:  loadedClothes[i].type,
            date: loadedClothes[i].date,
            classification:loadedClothes[i].classification,
          ),);
          }
           if (loadedClothes[i].type=='كويتي'){
          kuwait.add(Clothes(
            image:loadedClothes[i].image,
            color: loadedClothes[i].color,
            size : loadedClothes[i].size,
            price: loadedClothes[i].price,
            type:  loadedClothes[i].type,
            date: loadedClothes[i].date,
            classification:loadedClothes[i].classification,
          ),);

          }
          if (loadedClothes[i].classification=='جديد'){
          nnew.add(Clothes(
            image:loadedClothes[i].image,
            color: loadedClothes[i].color,
            size : loadedClothes[i].size,
            price: loadedClothes[i].price,
            type:  loadedClothes[i].type,
            date: loadedClothes[i].date,
            classification:loadedClothes[i].classification,
          ),);}
           if (loadedClothes[i].classification=='تخفيضات'){
          discount.add(Clothes(
            image:loadedClothes[i].image,
            color: loadedClothes[i].color,
            size : loadedClothes[i].size,
            price: loadedClothes[i].price,
            type:  loadedClothes[i].type,
            date: loadedClothes[i].date,
            classification:loadedClothes[i].classification,
          ),);
           }
            if (loadedClothes[i].type=='تركي'){
          turkey.add(Clothes(
            image:loadedClothes[i].image,
            color: loadedClothes[i].color,
            size : loadedClothes[i].size,
            price: loadedClothes[i].price,
            type:  loadedClothes[i].type,
            date: loadedClothes[i].date,
            classification:loadedClothes[i].classification,
          ),);
          
          }
          if (loadedClothes[i].type=='إماراتي'){
          uae.add(Clothes(
            image:loadedClothes[i].image,
            color: loadedClothes[i].color,
            size : loadedClothes[i].size,
            price: loadedClothes[i].price,
            type:  loadedClothes[i].type,
            date: loadedClothes[i].date,
            classification:loadedClothes[i].classification,
          ),);
          }
         }
      }
    } catch (error) 
    {
      throw (error) ;
    }
  }
  Future<void> fetchAndSetClothesSearch(numOneController,numTwoController) async {
    search=[];
    const url = 'https://shop-5d193.firebaseio.com/clothes.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      
      List<Clothes> loadedClothes = [];
      extractedData.forEach((clothesId, pclothes) {
        loadedClothes.add(Clothes(
      image: pclothes['image'],
      color: pclothes['color'],
      size : pclothes['size'],
     price: pclothes['price'],
      type:  pclothes['type'],
      date: pclothes['date'],
      classification:pclothes['classificatione'],
      
        ));
        
      });
      if(search.length==0){
      for(int i=loadedClothes.length-1;i>=0;i--){
        if(loadedClothes[i].price!='-'){
      if(double.parse(numOneController.text)<=double.parse(loadedClothes[i].price) && double.parse(numTwoController.text)>=double.parse(loadedClothes[i].price) ){
      search.add(Clothes(
            image:loadedClothes[i].image,
            color: loadedClothes[i].color,
            size : loadedClothes[i].size,
            price: loadedClothes[i].price,
            type:  loadedClothes[i].type,
            date: loadedClothes[i].date,
            classification:loadedClothes[i].classification,
          ),);

      }
      }
      }
      }
      notifyListeners();

       } catch (error) 
    {
      throw (error) ;
    }
  }
}