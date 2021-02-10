import 'dart:io';

import 'package:flutter/material.dart';
import 'package:swipedetector/swipedetector.dart';

void main() {
  runApp(MyApp());
}

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
        primarySwatch: MaterialColor(
          0xFF212121,
          <int, Color>{
            50: Color(0xFF212121),
            100: Color(0xFF212121),
            200: Color(0xFF212121),
            300: Color(0xFF212121),
            400: Color(0xFF212121),
            500: Color(0xFF212121),
            600: Color(0xFF212121),
            700: Color(0xFF212121),
            800: Color(0xFF212121),
            900: Color(0xFF212121),
          },
        )
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
  String _imgPath = "assets/images/";
  List<String> _profiles = ['butters.jpg', 'sach.png', 'roland.png'];

  int _profileIndex = 1;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _swipeRight method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    String _curProfile = _imgPath + _profiles[_profileIndex];

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Ce(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SwipeDetector(
          child: Row(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                  _curProfile,
                width: 250,
                height: 250
              ),
            ],
          ),
          onSwipeRight: () {
            setState(() {
              _profileIndex = (_profileIndex + 1)%_profiles.length;
            });
          },
          onSwipeLeft: () {
            setState(() {
              if (_profileIndex == 0)
              {
                _profileIndex = _profiles.length;
              }
              _profileIndex = _profileIndex - 1;
            });
          },
        ),
      ),
        backgroundColor: Colors.white,
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
