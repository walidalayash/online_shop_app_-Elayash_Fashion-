
import './screen/Search.dart';
import 'package:flutter/material.dart';
import './screen/home.dart';
import './screen/product.dart';
import './screen/offer.dart';
import './screen/information.dart';
import 'package:provider/provider.dart';
import './models/clothesupdata.dart';
import './screen/order.dart';
void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => ClothesUpdata(),
      child:MaterialApp(
      title: 'Alayash',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'Amiri',
       // textTheme: ThemeData.light().textTheme.copyWith(
       //  title:TextStyle(
       //  fontFamily: 'Amiri' ,
        // fontSize: 20,
        // fontWeight: FontWeight.bold,
       // ),   ),
      ),
     home: MyHomePage(),
debugShowCheckedModeBanner: false,
    ),);
  }
}

class MyHomePage extends StatefulWidget {
  
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
    {
      'page': Home(),
      'title': 'Home',
    },
    {
      'page': Product(),
      'title': 'Product',
    },
        {
      'page': Search(),
      'title': 'Search',
    },
    {
      'page': Offer(),
      'title': 'Offer',
    },
    {
      'page': Information(),
      'title': 'Information',
    },

  ];
  super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
       appBar: AppBar(
          
        title: Center(child:
        new SizedBox(
    
            height: 65,
            width: 200, 
            child:Image.asset('assets/images/alayashBlack.png'),),),//Text('العياش',style: TextStyle(fontFamily:'Amiri'),),

             actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_basket),
            onPressed: () => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Order()),
          ),
          ),],
      ),
      body:_pages[_selectedPageIndex]['page'],  
      bottomNavigationBar: BottomNavigationBar(
      onTap: _selectPage,
      selectedItemColor: Colors.black,

      currentIndex: _selectedPageIndex,  
      items: const <BottomNavigationBarItem>
      [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home' ),
          backgroundColor: Colors.amber
        ),
          BottomNavigationBarItem(
          icon: Icon(Icons.list),
          title: Text('Product list'),
          backgroundColor: Colors.amber
      ),
         BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text('Search'),
          backgroundColor: Colors.amber
        ),
      BottomNavigationBarItem(
          icon: Icon(Icons.local_offer),
          title: Text('Offers'),
          backgroundColor: Colors.amber
        ),
      BottomNavigationBarItem(
          icon: Icon(Icons.data_usage),
          title: Text('Information'),
          backgroundColor: Colors.amber
        ),
       ],
      
      ),
      );
}
}
