import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  final _picker = ImagePicker();
  File _image;
  bool hasImage=false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  void dispose() {
    super.dispose();
  }

  void _test() async{
    var data = await getData('http://10.0.2.2:5000/');
        var decodedData = jsonDecode(data);
    print(decodedData['query']);
  }

  void getImageFromCamera(ImageSource source) async {
    PickedFile pickedFile = await _picker.getImage(source: source);

    File image = File(pickedFile.path);

    if (image == null) return;

    setState(() {
      _image = image;
      hasImage=true;
    });

  }
  Widget emblemPage(){
    return Container(
        width:MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/Emblem_background.jpg'),
                fit: BoxFit.cover
            )
        ),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:[

              Image(image:AssetImage('images/Emblem_1.png')),
              Text("Did you recycled plastic? Get new Emblem!",style: TextStyle(color: Colors.green,fontSize: 15)),
              SizedBox(height:30),
              GestureDetector(
                onTap: (){
                },
                child: Container(
                  width: 130,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.green
                  ),
                  child: Text("YES!",style: TextStyle(color: Colors.white, fontSize: 20))
                ),
              ),SizedBox(height:15),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 240,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/Emblem_2.png'),
                      fit: BoxFit.fill
                    ),
                  ),
              )
            ]));
  }
  Widget cameraPage(){
    return Container(

      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/Emblem_background.jpg'),
          fit: BoxFit.cover
        )
      ),
      child: hasImage?
        Column(children: [
          SizedBox(height:30),
          Container(
            width:300,
            height: 500,

            decoration: BoxDecoration(
              border: Border.all(color: Colors.white,width: 2),
              borderRadius: BorderRadius.all(
                Radius.circular(10)
              ),
                image: DecorationImage(
                    image: FileImage(_image),
                    fit: BoxFit.cover
                )
            ),
          ),SizedBox(height:20),
          GestureDetector(
            onTap: (){
              setState(() {
                hasImage=false;
                _image=null;

              });
            },
              child: Container(
                  width:100,
                  height:50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,width: 1),
                      borderRadius: BorderRadius.all(
                          Radius.circular(10)
                      ),
                    color: Colors.green,
                  ),
            child: Icon(Icons.delete,size: 50, color: Colors.white,)
          ))
        ])


          :
      Column(

          children:[
            SizedBox(height:150),
            Text("Take a Photo of Plastic Waste!", style: TextStyle(color: Colors.green, fontSize:25)),
        Icon(Icons.arrow_downward_rounded,size: 50, color: Colors.grey),
        GestureDetector(
          onTap: (){
            getImageFromCamera(ImageSource.camera);
          },
          child:Container(
              child: Icon(Icons.camera_alt,size:200,color: Colors.green,)
        )
        )
      ])
    );
  }


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
                    emblemPage(),
                    cameraPage(),
                    Image(image:AssetImage('images/rabbit.jpg'))
                  ]
              ),
              /*floatingActionButton: FloatingActionButton(
                onPressed: _test ,
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),*/
            )
        )
    );
  }
}
