import 'package:alayash/models/clothes.dart';
import 'package:flutter/material.dart';
import '../models/clothesupdata.dart';
import 'package:provider/provider.dart';

class ClothesCard extends StatelessWidget {
   ClothesCard({
   
    this.index,
    this.product,
    this.press,
  });
  final int index;
  final Clothes product;
  final Function press;
final kBackgroundColor = Color(0xFFF1EFF1);
final kPrimaryColor = Color(0xFF035AA6);
final  kSecondaryColor = Color(0xFFFFA41B);
final kTextColor = Color(0xFF000839);
final kTextLightColor = Color(0xFF747474);
final kBlueColor = Color(0xFF40BAD5);

final  kDefaultPadding = 20.0;

// our default Shadow
final kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12, // Black color with 12% opacity
);


  @override
  Widget build(BuildContext context) {
final clothesData = Provider.of<ClothesUpdata>(context);
      final clothes= clothesData.clothes;    Size size = MediaQuery.of(context).size;
       Future<void> _showMyDialog(index) async {
            Provider.of<ClothesUpdata>(context,listen:false).addOrder(clothes,index);

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
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
       color: Colors.amber,
      height: 160,
      child: InkWell(
        onTap: press,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            // Those are our background
            Container(
              height: 136,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: index.isEven ? Colors.white : Colors.white,
                boxShadow: [kDefaultShadow],
              ),
              child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
            // our product image
            Positioned(
              top: 0,
              right: 0,
              // child: Hero(
              //   tag: '${clothes[index].image}',
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  height: 160,
                  // image is square but we add extra 20 + 20 padding thats why width is 200
                  width: 200,
                  child: Image.network(clothes[index].image,
                   // fit: BoxFit.cover,
                  ),
                ),
            //  ),
            ),
            // Product title and price
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 136,
                // our image take 200 width, thats why we set out total width - 200
                width: size.width - 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0),
                      child: Text(
                        clothes[index].classification,
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                    // it use the available space
                    Spacer(),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding * 1.5, // 30 padding
                            vertical: kDefaultPadding / 4, // 5 top and bottom
                          ),
                          decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(22),
                         //     topRight: Radius.circular(22),
                            ),
                          ),
                          child: Text(
                            "\DL${clothes[index].price}",
                            style: Theme.of(context).textTheme.button,
                          ),
                        ),
                        Container(
                      // padding: EdgeInsets.symmetric(
                      //   horizontal: 2, // 30 padding
                      //   vertical: 1, // 5 top and bottom
                      // ),
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.only(
                       //   bottomLeft: Radius.circular(22),
                          topRight: Radius.circular(22),
                        ),
                      ),
                      child:new SizedBox(
  width:70,
  height: 35,  
                                              child: FlatButton(onPressed:()=>_showMyDialog(index),
      child: Text('اطلب',style:TextStyle(color:Colors.black,)),),
                      )
                    ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
