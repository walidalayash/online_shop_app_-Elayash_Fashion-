import 'package:alayash/models/clothes.dart';
import 'package:flutter/material.dart';
import '../models/clothesupdata.dart';
import 'package:provider/provider.dart';
import '../widget/screen_clothes.dart';


class ScreenList extends StatefulWidget {
  List<Clothes> list;
  final name;
  ScreenList(this.list,this.name);
  @override
  _ScreenListState createState() => _ScreenListState();
}

class _ScreenListState extends State<ScreenList> {
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
    return Scaffold(
       appBar: AppBar(
        
        title: Text('${widget.name}',style: TextStyle(fontFamily:'Amiri'),),
      ),
      body:_isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
            :
    Container(
          child: widget.list.isEmpty
              ? Column(
                  children: <Widget>[
                    Text(
                      'No clothes added yet!',),
                  ],)
     :
       SingleChildScrollView(
        physics: ScrollPhysics(),
        child:  Column(
    
      children: <Widget>[ 
           Card( color: Colors.white,
           elevation:25,
          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                       
              child:
              widget.name=='قائمة تركية'?
      Image.asset('assets/images/list_turkey.jpg')
      :
      widget.name=='قائمة الإماراتية'? 
      Image.asset('assets/images/list_uae.jpg')
      :
      widget.name=='قائمة الهندية'? 
             Image.asset('assets/images/list_indian.jpg')
      :
      widget.name=='قائمة كويتية'? 
                     Image.asset('assets/images/list_kuwait.jpg')
      :
      widget.name=='تخفيضات'?
                      Image.asset('assets/images/list_discount.jpg')
      :
      widget.name=='جديد'?
                            Image.asset('assets/images/list_new.jpg')
                            : null
             
       ),
       ScreenClothes(widget.list),
      ],
          ),
        ),
    ),
   );
  }
}