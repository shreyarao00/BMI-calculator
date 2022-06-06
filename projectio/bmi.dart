import 'package:flutter/material.dart';
import 'dart:math';

int counter=70;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

double height=149;
int weight=70;
double bmi=0;
Color _containerColor1= Colors.grey;
Color _containerColor2= Colors.grey;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("BMI Calculator"),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 150,
                    width: 180,
                    color: Colors.grey[700],
                    margin: new EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Text("Height",
                          style: TextStyle(fontSize: 25),),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("${height}",
                            style: TextStyle(fontSize: 40),),
                        ),
                        Slider(
                          value: height,
                          max: 200,
                          min: 100,
                          divisions: 100,
                          onChanged: (newValue) {
                            setState(() {
                              height = newValue;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 200,
                    color: Colors.grey[700],
                    margin: new EdgeInsets.symmetric(vertical: 50),
                    child: Column(
                      children: [
                        Text("Weight",
                          style: TextStyle(fontSize: 30),),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(counter.toString(),
                            style: TextStyle(fontSize: 30),),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget> [
                            IconButton(icon: Icon(Icons.add),
                              iconSize: 20,
                              onPressed: (){
                                setState(() {
                                  counter++;
                                });
                              },
                              color: Colors.blue,
                            ),
                            IconButton(icon: Icon(Icons.remove),
                              onPressed: (){
                                setState(() {
                                  if(counter>0){
                                    counter--;
                                  }
                                });
                              },
                              iconSize: 30,
                              color: Colors.blue,
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  InkWell(
                    child: Container(
                      height: 150,
                      width: 200,
                      color: _containerColor1,
                      margin: EdgeInsets.only(right: 10),
                      child: Center(
                        child: Text("MALE",style: TextStyle(color: Colors.black,fontSize: 40),),
                      ),
                    ),
                    onTap: (){
                      setState((){
                        if(_containerColor2==Colors.grey) {
                          _containerColor1 = Colors.deepOrange;
                        };
                      });
                    },
                  ),
                  InkWell(
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          width: 200,
                          color: _containerColor2,
                          child: Center(
                            child: Text("FEMALE",style: TextStyle(color: Colors.black,fontSize: 40),
                            ),

                          ),
                        ),
                      ],
                    ),
                    onTap: (){
                      setState((){
                        if(_containerColor1==Colors.grey) {
                          _containerColor2 = Colors.deepOrange;
                        }
                      });
                    },
                  )
                ],
              ),
              SizedBox(height: 200,),
              ElevatedButton(style: ElevatedButton.styleFrom(
                  primary: Colors.brown
              ),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  );

                },
                child: const Text("        Calculate your BMI        ",style: TextStyle(fontSize: 30,color: Colors.black),),

              ),

            ],
          )

      ),
    );
  }
}
class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: Center(
        child:Container(
          height: 100,
          width: 200,
          child: Row(
            children: [
              IconButton(onPressed: (){
                bmi=(counter/pow(height,2))*10000;
              },
                  icon: Icon(Icons.calculate,size: 50,color: Colors.white,)
              ),
              SizedBox(width: 20),
              Text(bmi.toStringAsFixed(2),style: TextStyle(fontSize: 40,color: Colors.white),)
            ],
          ),
        ),

      ),
    );
  }
}