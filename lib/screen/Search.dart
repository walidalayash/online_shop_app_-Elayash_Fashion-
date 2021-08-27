import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/clothesupdata.dart';
import '../widget/screen_clothes.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final numOneController=TextEditingController();
  final numTwoController=TextEditingController();
  var _isInit = true;
  var _isLoading = false;
  Future<void> _submit() async {
if (_isInit) {
      setState(() {
        _isLoading = true;

      });
      Provider.of<ClothesUpdata>(context,listen: false).fetchAndSetClothesSearch(numOneController,numTwoController).then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = true;
  }
  
  
  @override
  Widget build(BuildContext context) {
    final search=Provider.of<ClothesUpdata>(context,).search;
    return 
    Center(
      child: SingleChildScrollView(
          physics: ScrollPhysics(),
            child: Column( children:<Widget>[
  Text('بحث حسب السعر',style:TextStyle(fontSize: 30,color:Colors.black)),
          new SizedBox(
  width:205,
  height: 80,
          child:
              TextField(decoration: InputDecoration(labelText:'                                         من'),
              
      
  controller: numOneController,
              ),
            
            ),
             new SizedBox(
  width:205,
  height: 80,  
          child:TextField(decoration: InputDecoration(labelText:'                                        إلي',),
          controller: numTwoController,
          ),
            ),
      
            FlatButton(
                    child: Text('بحث'),
                    textColor: Colors.amber,
                    onPressed:()=>
                     
                    _submit(),
                  
                  ),
                   _isLoading? Center(child:
                  CircularProgressIndicator(),
                   )

                   :
                   ScreenClothes(search)


              
        ],),
      ),
    );
  }
}