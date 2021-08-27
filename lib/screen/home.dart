import 'package:flutter/material.dart';
import '../models/clothesupdata.dart';
import 'package:provider/provider.dart';
import 'package:connectivity_widget/connectivity_widget.dart';
import './screen_list.dart';
import './show_details.dart';
import '../widget/clothes_card.dart';

class Home extends StatefulWidget {
  
  
  @override
  _HomeState createState() => _HomeState();
  
}

class _HomeState extends State<Home>  {
 
  
    
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
      final clothes= clothesData.clothes;
      final indian= clothesData.indian;
      final turkey= clothesData.turkey;
      final kuwait= clothesData.kuwait;
      final uae= clothesData.uae;

      ConnectivityUtils.initialize(
        serverToPing:
            "https://gist.githubusercontent.com/Vanethos/dccc4b4605fc5c5aa4b9153dacc7391c/raw/355ccc0e06d0f84fdbdc83f5b8106065539d9781/gistfile1.txt",
        callback: (response) => response.contains("This is a test!"));
      return
//  ConnectivityWidget(
//      //onlineCallback: ,
//        builder: (context, isOnline) => 
       _isLoading?
                    Center(child: CircularProgressIndicator(),)

              :
              SingleChildScrollView(
          physics: ScrollPhysics(),
          child:Column(
      children: <Widget>[
      //    Text(
      //           "${isOnline ? 'Online' : 'Offline'}",
      //           style: TextStyle(
      //               fontSize: 30, color: isOnline ? Colors.green : Colors.red),),
        
         Card( color: Colors.white,
           elevation:25,
          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                       
              child:
              
        Image.asset('assets/images/alayash.jpg'),
         ),
          new SizedBox(
      
       width:100,
      
      height: 40,), 
      Divider(
              color: Colors.black
            ),
           
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: <Widget>[
               Column(
                 children: <Widget>[
                    Stack(
        children: <Widget>[
         Container(
            height: 70,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
          ),
                          new SizedBox(
      
       width:50,
      
      height: 60,child:
          FlatButton(child: Image.asset('assets/images/uaee.png'),onPressed:()=> Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>ScreenList(uae,'إماراتي'),),),),),
        ]),
      Text('إماراتي',style:TextStyle(fontSize: 20,color:Colors.black87)),
       ]),
               Column(
                 children: <Widget>[
                    Stack(
        children: <Widget>[
         Container(
            height: 70,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
          ),
                   new SizedBox(
      
       width:50,
      
      height: 60,child:
          FlatButton(child: Image.asset('assets/images/in.png'),onPressed:()=> Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>ScreenList(indian,'هندي'),),),),),
        ]),
      Text('هندي',style:TextStyle(fontSize: 20,color:Colors.black87)),
                 ],
               ),
                          Column(
                 children: <Widget>[
                    Stack(
        children: <Widget>[
         Container(
            height: 70,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
          ),
                          new SizedBox(
      
       width:50,
      
      height: 60,child:
          FlatButton(child: Image.asset('assets/images/tu.png'), onPressed:()=> Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>ScreenList(turkey,'تركي'),),),),)
        ]),
                Text('تركي',style:TextStyle(fontSize: 20,color:Colors.black87)),

                 ]),
                            Column(
                 children: <Widget>[
                    Stack(
       // alignment: Alignment.bottomCenter,
        children: <Widget>[
         Container(
            height: 70,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
          ),
                          new SizedBox(
      
       width:50,
      
      height: 60,child:
          FlatButton(child: Image.asset('assets/images/k.png'),onPressed:()=> Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>ScreenList(kuwait,'كويتي'),),),
          ))
            ]
            ),
                Text('كويتي',style:TextStyle(fontSize: 20,color:Colors.black87)),

                
             ],
   
           )
        ],),
       Divider(
              color: Colors.black
            ),
          //    SafeArea(
    //  bottom: false,
    //  child: 
      // Column(
      //   children: <Widget>[
         // SearchBox(onChanged: (value) {}),
        //  CategoryList(),
       //   SizedBox(height: 20.0 / 2),
         // Expanded(
      //      child: 
            Stack(
              children: <Widget>[
                // Our background
                Container(
                  margin: EdgeInsets.only(top: 70),
                  decoration: BoxDecoration(
                    color: Color(0xFFF1EFF1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                ListView.builder(
physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,                  itemCount: clothes.length,
                  itemBuilder: (context, index) => ClothesCard(
                    index: index,
                    product: clothes[index],
                    press: (()=>Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ShowDetails(clothes,index
                        ),
                      ),
                    
                                   )
                                 ))               )
              ],
            ),
         // ),
      //   ],
      // ),//)
    ])
  //  )
    );
  }
}

             
//             SingleChildScrollView(
//           physics: ScrollPhysics(),
//           child:Column(
//       children: <Widget>[
//          Text(
//                 "${isOnline ? 'Online' : 'Offline'}",
//                 style: TextStyle(
//                     fontSize: 30, color: isOnline ? Colors.green : Colors.red),),
        
//          Card( color: Colors.white,
//            elevation:25,
//           margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                       
//               child:
//         Image.asset('assets/images/alayash.jpg'),
//          ),
//           new SizedBox(
      
//        width:100,
      
//       height: 40,), 
//       ScreenClothes(clothes),
//       ],                
//          ),
//  ),
//     );
//   }
// }