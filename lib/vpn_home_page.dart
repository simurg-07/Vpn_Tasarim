import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class VpnHomePage extends StatefulWidget {
  @override
  _VpnHomePageState createState() => _VpnHomePageState();
}

class _VpnHomePageState extends State<VpnHomePage> {

  Timer? connectionTimer;
  String timeText ="";
  int timeCounter = 0;
  bool isConnected = false;
  int timeReset = 0;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child:
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),

                child: Row(children: [

                  Expanded(child: Align(
                    alignment: Alignment.centerLeft,
                      child: Icon(Icons.menu)),),



                  Expanded(
                    child: Center(
                      child: Text("EisVPN",
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 18,
                      ),),
                    ),
                  ),
                  Expanded(child: Container()),
                ],),
              )),

            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Status",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),),
                      Text("Connected",
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 18,
                      ),),

                    ],
                  )),

                  Expanded(
                      child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Your IP",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),),

                          Text("192.224.154.214",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 18,
                            ),)
                        ],
                      )),
                ],
              ),
              ),

            Expanded(
              flex: 2,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Connection Time",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                    ),


                    Text("$timeText",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24),),

                  ],
                ),
              )),

            Expanded(
              flex: 8,
              child: Center(
                child: Container(
                  height: 240,
                  width: 240,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        if(!isConnected) {
                          connectionTimer = Timer.periodic(
                              Duration(seconds: 1), (timer) {
                            timeCounter++;
                            int min = timeCounter ~/ 60;
                            int sec = timeCounter % 60;
                            setState(() {
                              timeText = "$min:$sec";
                            });
                          });
                        }else{
                          connectionTimer?.cancel();
                           timeCounter = timeReset;
                          setState(() {
                            timeText="00:00";
                          });
                        }
                        isConnected = !isConnected;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child:Icon(Icons.power_settings_new, color:Colors.white, size: 84,
                            ),
                        ),
                      ),
                    ),
                  ),
                ),
              )),

            Expanded(
              flex: 2,
              child: Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical:8),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.adjust),
                        SizedBox(width: 16,),
                        Text("United states", style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                        Spacer(),
                        IconButton(onPressed: (){

                        }, icon:Icon(Icons.arrow_forward_ios)),
                      ],),

                  )
                ),


              )),

            Expanded(
              flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Upload"),
                    Row(children: [
                      Icon(Icons.arrow_upward),
                      Text("124 Mb/s",
                          style: TextStyle(
                          fontWeight: FontWeight.bold)),
                    ],)
                  ],
                ),
                SizedBox(width:24),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Download"),
                    Row(children: [
                      Icon(Icons.arrow_upward),
                      Text("124 Mb/s",
                          style: TextStyle(
                          fontWeight: FontWeight.bold)),
                    ],)
                  ],
                )
              ],)),

            Expanded(
              flex: 2,
              child: Placeholder(),),

          ],
        ),
      ),
    );
  }
}
