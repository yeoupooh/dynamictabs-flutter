import 'package:flutter/material.dart';

import 'CustomTabView.dart';

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
        ],
      ),
    );
  }
}

/// Implementation
