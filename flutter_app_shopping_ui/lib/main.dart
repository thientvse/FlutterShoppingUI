import 'package:flutter/material.dart';

import 'CustomIcons.dart';
import 'ProductCart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  int _currentIndex = 0;

  List<Widget> bottomNavIconList = [
    Image.asset(
      "assets/store.png",
      width: 32.0,
      height: 32.0,
    ),
    Icon(
      CustomIcons.search,
      size: 30.0,
    ),
    Icon(
      CustomIcons.favorite,
      size: 30.0,
    ),
    Icon(CustomIcons.cart, size: 30.0),
    Image.asset("assets/profile.png", width: 32.0, height: 32.0)
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[HomeScreenTopPart()],
        ),
      ),
      bottomNavigationBar: Container(
        height: 52.0,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black12.withOpacity(0.065),
              offset: Offset(0.0, -3.0),
              blurRadius: 10.0),
        ]),
        child: Row(
          children: bottomNavIconList.map((item) {
            var index = bottomNavIconList.indexOf(item);

            return Expanded(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = index;
                });
              },
              child: bottomNavItem(item, index == _currentIndex),
            ));
          }).toList(),
        ),
      ),
    );
  }
}

bottomNavItem(Widget item, bool isSelected) => Container(
      decoration: BoxDecoration(
          boxShadow: isSelected
              ? [
                  BoxShadow(
                      color: Colors.black12.withOpacity(0.02),
                      offset: Offset(0.0, 5.0),
                      blurRadius: 10.0)
                ]
              : []),
      child: item,
    );

class HomeScreenTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
      child: new Column(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 30.0, bottom: 25.0),
              child: Image.asset(
                'assets/logo.png',
                width: 57.0,
                height: 38.0,
              ),
            ),
          ),
          ProductCart(0xFFfaecfb, "assets/shoes_01.png", "Hybrid Rocket WNS",
              "\$999", "\$749"),
          SizedBox(
            height: 32.0,
          ),
          ProductCart(0xFFf8e1da, "assets/shoes_02.png", "Hybrid Runner ARS",
              "\$699", "\$549")
        ],
      ),
    );
  }
}
