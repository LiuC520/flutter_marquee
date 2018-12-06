import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_marquee/flutter_marquee.dart';
import 'package:flutter_marquee/animation_direction.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("从下到上,时间间隔6秒，传入的是字符串数组"),
                  Container(
                    margin: EdgeInsets.all(4),
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: FlutterMarquee(
                        texts: ["刘成", "刘成1111", "刘成2222", "刘成3333"].toList(),
                        onChange: (i) {
                          print(i);
                        },
                        duration: 4),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text("从上到下,时间间隔8秒,传入的是自定义的text widget"),
                  Container(
                    margin: EdgeInsets.all(4),
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: FlutterMarquee(
                        children: <Widget>[
                          Text(
                            "刘成",
                            style: TextStyle(color: Colors.red),
                          ),
                          Text("刘成1111", style: TextStyle(color: Colors.green)),
                          Text("刘成2222", style: TextStyle(color: Colors.blue)),
                          Text("刘成3333",
                              style: TextStyle(color: Colors.yellow)),
                        ],
                        onChange: (i) {
                          print(i);
                        },
                        animationDirection: AnimationDirection.t2b,
                        duration: 8),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text("从左到右,时间间隔2秒,自定义的view"),
                  Container(
                    margin: EdgeInsets.all(4),
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: FlutterMarquee(
                        children: <Widget>[
                          Center(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.menu),
                                Text(
                                  "刘成",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.add),
                                Text(
                                  "刘成1111",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.satellite),
                                Text(
                                  "刘成2222",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.format_align_justify),
                                Text("刘成3333",
                                    style: TextStyle(color: Colors.yellow)),
                              ],
                            ),
                          ),
                        ],
                        onChange: (i) {
                          print(i);
                        },
                        animationDirection: AnimationDirection.l2r,
                        duration: 2),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text("从右到左,时间间隔6秒"),
                  Container(
                    margin: EdgeInsets.all(4),
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: FlutterMarquee(
                        texts: ["刘成", "刘成1111", "刘成2222", "刘成3333"].toList(),
                        onChange: (i) {
                          print(i);
                        },
                        animationDirection: AnimationDirection.r2l,
                        duration: 6),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
