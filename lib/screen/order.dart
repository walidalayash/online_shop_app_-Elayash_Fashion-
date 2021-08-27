import 'package:flutter/material.dart';
import '../models/clothesupdata.dart';
import 'package:provider/provider.dart';
import './show_details.dart';
import './selection_list.dart';

class Order extends StatefulWidget {
 
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  final phoneController=TextEditingController();
String selectedItem=' أختار المكان';
void _awaitFromSelectScreen(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectionList(),
        ));

    setState(() {
      selectedItem = result ?? selectedItem;
    });
  }

  List<TextEditingController> colorController = new List();

  List<TextEditingController> sizeController = new List();
   var _isInit = true;
  var _isLoading = false;
//   var donehere=0;
  
//    void _submit()  {
     
//       for(int index=Provider.of<ClothesUpdata>(context,listen: false).order.length-1;index>=0;index--){
// Provider.of<ClothesUpdata>(context,listen: false).addOrderClothes
//       (Provider.of<ClothesUpdata>(context,listen: false).order[index].image,colorController[index].text,
//       sizeController[index].text,
//       Provider.of<ClothesUpdata>(context,listen: false).order[index].price,Provider.of<ClothesUpdata>(context,listen: false).order[index].type,
//       Provider.of<ClothesUpdata>(context,listen: false).order[index].classification,
//       selectedItem,phoneController.text);
//       }
//        setState(() {
//       donehere=Provider.of<ClothesUpdata>(context,listen: false).done.length;
//       });
//     }
    
  
  void _submit() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      for(int index=Provider.of<ClothesUpdata>(context,listen: false).order.length-1;index>=0;index--){
Provider.of<ClothesUpdata>(context,listen: false).addOrderClothes
      (Provider.of<ClothesUpdata>(context,listen: false).order[index].image,colorController[index].text,
      sizeController[index].text,
      Provider.of<ClothesUpdata>(context,listen: false).order[index].price,Provider.of<ClothesUpdata>(context,listen: false).order[index].type,
      Provider.of<ClothesUpdata>(context,listen: false).order[index].classification,
      selectedItem,phoneController.text).then((_) {
        setState(() {
          _isLoading = false;
        });
      });}
    }
    _isInit = false;
  }


  @override
  Widget build(BuildContext context) {
      final order = Provider.of<ClothesUpdata>(context).order;

    return Scaffold(
      
       appBar: AppBar(
        
        title: Center(child:
        new SizedBox(
    
            height: 65,
            width: 200, 
            child:Image.asset('assets/images/alayashBlack.png'),),),
      ),
      body:
      SingleChildScrollView(
                physics: ScrollPhysics(),

          child: Column( children:<Widget>[
      
              order.isEmpty
              ? Column(
                  children: <Widget>[
                    Text(
                      'اطلب الأن',),
                  ],)
     :
              ListView.builder(
      physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
  itemCount: order.length,
  itemBuilder: (context, index)  {
                  colorController.add(new TextEditingController());
                  sizeController.add(new TextEditingController());

return  
      Dismissible(
      key:UniqueKey(), 
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('هل أنت متأكد؟'),
                content: Text(
                  'هل تريد حذف هذا العنصر؟',
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('لا'),
                    onPressed: () {
                      Navigator.of(ctx).pop(false);
                    },
                  ),
                  FlatButton(
                    child: Text('نعم'),
                    onPressed: () {
                      Navigator.of(ctx).pop(true);
                   },
                  ),
                ],
              ),
        );
      },
      onDismissed: (direction) {
Provider.of<ClothesUpdata>(context,listen: false).deleteOrder(index);      },
   child:     Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child:
             Row(
           children: <Widget>[
   new SizedBox(
  width:100,
  height: 50,
  child:
  
  FlatButton(child:Image.network(order[index].image),onPressed: ()=>Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ShowDetails(order,index)),
          ),),),
  Text(order[index].price,style:TextStyle(fontSize: 20,color:Colors.black87)),
  new SizedBox(
  width:50,
  height: 80,  
     child:
  TextField(decoration: InputDecoration(labelText:'اللون'),
     
  controller:
   colorController[index]

,
        ),),
        new SizedBox(
  width:50,
  height: 80,  
        child:
          TextField(decoration: InputDecoration(labelText:'المقاس'),
        
      
  controller: sizeController[index],
        ),),
],),

     ), )
      );
}                         
         ),
         Text('الإجمالي',style:TextStyle(fontSize: 20,color:Colors.black87)),
         Text('${Provider.of<ClothesUpdata>(context).colOrder()}',style:TextStyle(fontSize: 20,color:Colors.black87)),
         
           
      new SizedBox(
  width:205,
  height: 80,
        child:TextField(decoration: InputDecoration(labelText:'رقم الهاتف'),
      
  controller: phoneController,
        ),
          ),
 
  FlatButton(
      onPressed: () {
                _awaitFromSelectScreen(context);
      },
      child:       Container(
             decoration: BoxDecoration(

               border: Border.all(
      color: Colors.amber,
      width: 2,),
             ),
             child:Flex(
        direction: Axis.horizontal,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(selectedItem),
              ),
            ),
        ],
      ),),),
 _isLoading?
  Center(child: CircularProgressIndicator(),)

              :
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                    height: 20,
                  ),
             RaisedButton(
                    child:  Text('طلب'),
                      // color: Colors.amber,
                      // textColor: Colors.black,
                      onPressed:()=>_submit(),
                  shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                          color: Theme.of(context).primaryColor,
                          textColor: Theme.of(context).primaryTextTheme.button.color,
                      ),
                   
            ],
          ),
          // donehere==0?
          // Text('لم يتم الأرسال بعد')
          // :
          // Text('تم الإرسال')

      ],),
    ),
      );
  }
}