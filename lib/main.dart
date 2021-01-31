import 'dart:convert';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plastic_island/request.dart';
import 'package:tflite/tflite.dart';

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
  String path='';
  String result='';
  String plasticType='';
  String confidence='';
  int emblemCount=0;
  int point=0;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  Future classifyImage() async {
    await Tflite.loadModel(model: "plastic/converted_model.tflite",labels: "plastic/labels.txt");
    var output = await Tflite.runModelOnImage(path: path);
    setState((){
      result = output.toString();
    });
  }

  void getImageFromCamera(ImageSource source) async {

    PickedFile pickedFile = await _picker.getImage(source: source);
    File image = File(pickedFile.path);
    if (image == null) return;

    setState(() {
      _image = image;
      hasImage=true;
      path = image.path;

    });


  }

  void congratulation(BuildContext context) {

    AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Congratulations!',
      desc: 'You got bonus \$4',
      btnOkOnPress: () {},
    )..show();

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
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children:[

              SizedBox(height:30),
              Image(image:AssetImage('images/Emblem_1.png')),
              Text("Did you recycled plastic? Get new Emblem!",style: TextStyle(color: Colors.green,fontSize: 15)),
              SizedBox(height:30),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(emblemCount==11){
                      congratulation(context);
                      emblemCount = 0;
                      point += 4;

                    }else if(emblemCount<12){
                      emblemCount += 1;
                      point += 1;

                    }
                  });
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
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height:60,
                  child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        emblemCount>=1?Container(
                  width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(60),
                      ),
                      color: Colors.white,

                      image: DecorationImage(
                          image: AssetImage('images/Emblem/Emblem1.png') ,
                          fit: BoxFit.cover
                      ),
                    ),
                  ) : Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            color: Colors.white,
                          ),
                        ),
                        emblemCount>=2?Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            color: Colors.white,

                            image: DecorationImage(
                                image: AssetImage('images/Emblem/Emblem2.png') ,
                                fit: BoxFit.cover
                            ),
                          ),
                        ) :
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            color: Colors.white,
                          ),
                        ),
                        emblemCount>=3?Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            color: Colors.white,

                            image: DecorationImage(
                                image: AssetImage('images/Emblem/Emblem3.png') ,
                                fit: BoxFit.cover
                            ),
                          ),
                        ) :
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            color: Colors.white,
                          ),
                        ),
                        emblemCount>=4?Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            color: Colors.white,

                            image: DecorationImage(
                                image: AssetImage('images/Emblem/Emblem12.png'),
                                fit: BoxFit.cover
                            ),
                          ),
                        ) :
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            color: Colors.white,

                          ),
                        ),


                      ])),
              Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height:60,
                  child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        emblemCount>=5?Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            color: Colors.white,

                            image: DecorationImage(
                                image: AssetImage('images/Emblem/Emblem5.png') ,
                                fit: BoxFit.cover
                            ),
                          ),
                        ) : Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            color: Colors.white,
                          ),
                        ),
                        emblemCount>=6?Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            color: Colors.white,

                            image: DecorationImage(
                                image: AssetImage('images/Emblem/Emblem6.png') ,
                                fit: BoxFit.cover
                            ),
                          ),
                        ) :
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            color: Colors.white,
                          ),
                        ),
                        emblemCount>=7?Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            color: Colors.white,

                            image: DecorationImage(
                                image: AssetImage('images/Emblem/Emblem7.png') ,
                                fit: BoxFit.cover
                            ),
                          ),
                        ) :
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            color: Colors.white,
                          ),
                        ),
                        emblemCount>=8?Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            color: Colors.white,

                            image: DecorationImage(
                                image: AssetImage('images/Emblem/Emblem8.png') ,
                                fit: BoxFit.cover
                            ),
                          ),
                        ) :
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            color: Colors.white,

                          ),
                        ),


                      ])),
              Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height:60,
                  child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        emblemCount>=9?Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            color: Colors.white,

                            image: DecorationImage(
                                image: AssetImage('images/Emblem/Emblem9.png') ,
                                fit: BoxFit.cover
                            ),
                          ),
                        ) : Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            color: Colors.white,
                          ),
                        ),
                        emblemCount>=10?Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            color: Colors.white,

                            image: DecorationImage(
                                image: AssetImage('images/Emblem/Emblem10.png') ,
                                fit: BoxFit.cover
                            ),
                          ),
                        ) :
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            color: Colors.white,
                          ),
                        ),
                        emblemCount>=11?Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            color: Colors.white,

                            image: DecorationImage(
                                image: AssetImage('images/Emblem/Emblem11.png') ,
                                fit: BoxFit.cover
                            ),
                          ),
                        ) :
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            color: Colors.white,
                          ),
                        ),
                        emblemCount>=12?
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            color: Colors.white,

                            image: DecorationImage(
                                image: AssetImage('images/Emblem/Emblem4.png') ,
                                fit: BoxFit.cover
                            ),
                          ),
                        ) :
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ])),

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
          SizedBox(height:10),
          Stack(
            alignment: Alignment.center,
              children: [
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
            ),
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
                      color: Color(0xaa5ca08e),
                    ),
                    child: Icon(Icons.delete,size: 50, color: Colors.white,)
                ))

          ]),
          result==null? Text("no result") :

              Column(
              children: [
                plasticType=="PVC"? Text("Recycled!", style : TextStyle(color: Colors.green, fontSize: 25,fontWeight: FontWeight.bold)):
                plasticType=="Melamine"? Text("Not Recycled!", style : TextStyle(color: Colors.red, fontSize: 25,fontWeight: FontWeight.bold)):
                plasticType=="Synthetic rubber"? Text("Not Recycled!", style : TextStyle(color: Colors.red, fontSize: 25,fontWeight: FontWeight.bold)):
                plasticType=="PET"? Text("Recycled!", style : TextStyle(color: Colors.green, fontSize: 25,fontWeight: FontWeight.bold)):
                plasticType=="HDPE"? Text("Recycled!", style : TextStyle(color: Colors.green, fontSize: 25,fontWeight: FontWeight.bold)):
                plasticType=="Error"? Text("Not Recycled!", style : TextStyle(color: Colors.red, fontSize: 25,fontWeight: FontWeight.bold)):SizedBox.shrink(),
                SizedBox(height: 10),

                plasticType=="PET"? Text("This is a recyclable \"$plasticType\", don't forget to remove the label paper and dispose :)", style: TextStyle(fontSize: 10,color: Colors.white))
                    :Text(plasticType, style: TextStyle(fontSize: 20,color: Colors.white)),
                SizedBox(height:10),

                Text("Confidence : ${result.substring(16,18)}%", style: TextStyle(color: Colors.blue, fontSize: 20))
              ])


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
            classifyImage().then((_){

              if(result.contains("pvc")){
                setState(() {
                  plasticType = "PVC";
                });
              }else if(result.contains("합성고무")){
                setState(() {
                  plasticType = "Synthetic rubber";
                });
              }else if(result.contains("pet")){
                setState(() {
                  plasticType = "PET";
                });
              }else if(result.contains("hdpe")){
                setState(() {
                  plasticType = "HDPE";
                });
              }else {
                setState(() {
                  plasticType = "Error";
                });
              }
            });


          },
          child:Container(
              child: Icon(Icons.camera_alt,size:200,color: Colors.green,)
        )
        )
      ])
    );
  }
  Widget greenCardPage(){

    return Container(


        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/Emblem_background.jpg'),
                fit: BoxFit.cover
            )
        ),
      child: Column(

        children: [

          SizedBox(height:30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

              children: [
            Bubble(
              nip: BubbleNip.rightBottom,
              child: Text('My Point', style: TextStyle(color: Colors.white,fontSize: 20)),
              color: Colors.green,
            ),
            SizedBox(width:15),
            Container(
              width: 150,
              height:50,
              alignment: Alignment.center,
              child: Text("\$ ${point.toString()}",style: TextStyle(fontSize: 20)),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey,width: 2),
                  borderRadius: BorderRadius.all(
                      Radius.circular(10)
                  ),
                color: Colors.white,
              ),
            )


          ]),
          SizedBox(height:40),
          Container(
            width:250,
              height:400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/GreenCard.png'),
                      fit: BoxFit.cover
                  )
              )
          )

        ]
      )

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
                    greenCardPage()
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
