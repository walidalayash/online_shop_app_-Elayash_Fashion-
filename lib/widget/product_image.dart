import 'package:flutter/material.dart';


class ProductPoster extends StatelessWidget {
  const ProductPoster({
    this.image,
  }) ;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      // the height of this container is 80% of our width
      height: 500 * 0.8,

      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
        //   Container(
        //     height: 500 * 0.7,
        //     width: 500 * 0.7,
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       shape: BoxShape.circle,
        //     ),
        //   ),
          Image.network(image,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
