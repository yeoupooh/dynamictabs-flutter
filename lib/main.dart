import 'package:flutter/material.dart';

import 'CheckBoxInListview.dart';
import 'CustomTabView.dart';
import 'ListViewDemo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> data = ['Page 0', 'Page 1', 'Page 2'];
  int initPosition = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomTabView(
          initPosition: initPosition,
          itemCount: data.length,
          tabBuilder: (context, index) => Tab(text: data[index]),
          pageBuilder: (context, index) => Center(child: Text(data[index])),
          onPositionChange: (index) {
            print('current position: $index');
            initPosition = index;
          },
          onScroll: (position) => print('$position'),
        ),
      ),
      floatingActionButton: Row(
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              setState(() {
                data.add('Page ${data.length}');
              });
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                data.remove('Page ${data.length - 1}');
              });
            },
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              print('open dialog');
              showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations.of(context)
                      .modalBarrierDismissLabel,
                  barrierColor: Colors.black45,
                  transitionDuration: const Duration(milliseconds: 200),
                  pageBuilder: (BuildContext buildContext, Animation animation,
                      Animation secondaryAnimation) {
                    return Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width - 10,
                        height: MediaQuery.of(context).size.height - 80,
                        padding: EdgeInsets.all(20),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Demo(),
                            // CheckBoxInListview(),
                            RaisedButton(
                              child: Text('Test'),
                              onPressed: () {},
                            ),
                            RaisedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: const Color(0xFF1BC0C5),
                            )
                          ],
                        ),
                      ),
                    );
                  });
              // showDialog(
              //     context: context,
              //     builder: (BuildContext context) {
              //       return AlertDialog(
              //         title: Text("Alert Dialog"),
              //         content: Text("Dialog Content"),
              //       );
              //     });
            },
            child: Icon(Icons.list),
          ),
        ],
      ),
    );
  }
}

/// Implementation
