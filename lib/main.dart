import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:plastic_island/request.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  void _test() async{
    var data = await getData('http://10.0.2.2:5000/');
        var decodedData = jsonDecode(data);
    print(decodedData['query']);
  }

  final tab = new TabBar(tabs: <Tab>[
    new Tab(icon: new Icon(Icons.arrow_forward)),
    new Tab(icon: new Icon(Icons.arrow_downward)),
    new Tab(icon: new Icon(Icons.arrow_back)),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(

        primaryColor: Colors.white,
        accentColor: Colors.green,
      ),

        home: DefaultTabController(
            length: 3,
            child:Scaffold(
              appBar: AppBar(
                  title: Center(child: Text("Plastic Island")),
                  bottom: TabBar(
                      tabs: [

                        Tab(text: "Emblem"),

                        Tab(text: "Camera"),

                        Tab(text: "My Green Card")

                      ]

                  )

              ),

              body: TabBarView(

                  children: [

                    Image(image:AssetImage('images/cat.jpg')),

                    Image(image:AssetImage('images/dog.jpg')),

                    Image(image:AssetImage('images/rabbit.jpg'))

                  ]

              ),

              floatingActionButton: FloatingActionButton(

                onPressed: _test ,

                tooltip: 'Increment',

                child: Icon(Icons.add),
              ),
            )
        )
    );
  }
}
