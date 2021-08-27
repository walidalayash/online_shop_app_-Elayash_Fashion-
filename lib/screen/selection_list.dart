import 'package:flutter/material.dart';
class Area{
  final String name;
  Area({ 
    @required this.name});

}
class SelectionList extends StatefulWidget {
  final List<Area> area=[
    Area(name:'بنغازي'),
    Area(name:'طرابلس'),
    Area(name:'البيضاء'),
    Area(name:'أجدابيا'),
    Area(name:'البريقة'),

  ];



  @override
  _SelectionListState createState() => _SelectionListState();
}

class _SelectionListState extends State<SelectionList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("اختار منطقة"),
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
                physics: ScrollPhysics(),

          child:
          ListView.builder(
        physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
  itemCount: widget.area.length,
  itemBuilder: (context, index)  {
return          Card(

margin: EdgeInsets.all(15),
              child: Padding(
                padding: EdgeInsets.all(8),


          child:
          Column(      
              children: <Widget>[
       
          FlatButton(onPressed:(){
             Navigator.pop(context, widget.area[index].name);
          }, child:
                Text('${widget.area[index].name}',style:TextStyle(fontSize: 20,color:Colors.black87)),),
              
              ])
));
  }
          )


          ),
        
      );
  }

}