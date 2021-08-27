import 'package:flutter/material.dart';
import './screen_list.dart';
import '../models/clothesupdata.dart';
import 'package:provider/provider.dart';





class Offer extends StatefulWidget {
  
  @override
  _OfferState createState() => _OfferState();
}

class _OfferState extends State<Offer> {
 
 var _isInit = true;
  var _isLoading = false;
   
  
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ClothesUpdata>(context).fetchAndSetClothes().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
   
    
    final clothesData = Provider.of<ClothesUpdata>(context);
    final nnew= clothesData.nnew;
    final discount= clothesData.discount;
    return _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
            : 
    Column(children: <Widget>[
      Card(
      elevation:20,
      child:
      Row(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(child:Text('جديد',style:TextStyle(height: 3, fontSize: 30,color:Colors.red)),onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ScreenList(nnew,'جديد')),
  );} ),
       IconButton(icon:Icon(Icons.new_releases,color: Colors.red,), 
       onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ScreenList(nnew,'جديد')),
  );}),
      
      ],
      ),
      ),
                    Row(
                      children: <Widget>[
        new SizedBox(
 width:85,
height: 90,
    child: 
  Image.network(nnew[nnew.length-1].image),),
    new SizedBox(
 width:85,
height: 90,
    child: 
   
   Image.network(nnew[nnew.length-2].image),),
    new SizedBox(
 width:85,
height: 90,
    child: 
   
 Image.network(nnew[nnew.length-3].image),),

    new SizedBox(
 width:85,
height: 90,
    child: 
   
    Image.network(nnew[nnew.length-4].image),),

    

       ],),                
      
    
    
     
   Card(
      elevation:20,
      child:
      Row(    mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
      FlatButton(child:Text('تخفيضات',style:TextStyle(height: 3, fontSize: 30,color:Colors.red)),onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ScreenList(nnew,'تخفيضات')),
  );} ),
      IconButton(icon:Icon(Icons.local_offer,color: Colors.red,
), onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ScreenList(nnew,'تخفيضات')),
  );}),
      ],
    ),
   ),
   Row(
     children: <Widget>[
      new SizedBox(
 width:85,
height: 90,
    child: 
    Image.network(discount[discount.length-1].image),),
    new SizedBox(
 width:85,
height: 90,
    child: 
    Image.network(discount[discount.length-2].image),),
    new SizedBox(
 width:85,
height: 90,
    child: 
    Image.network(discount[discount.length-3].image),),
    new SizedBox(
 width:100,
height: 90,
    child: 
    Image.network(discount[discount.length-4].image),),

   ],
   ),

      
    ],
 
    );
  }
}
