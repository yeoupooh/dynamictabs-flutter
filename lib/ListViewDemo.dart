import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  @override
  DemoState createState() => new DemoState();
}

class DemoState extends State<Demo> {
  Map<String, bool> values = {
    'foo': true,
    'bar': false,
  };

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: new BoxConstraints(
        minHeight: 35.0,
        maxHeight: 160.0,
      ),
      child: Scaffold(
        body: new ListView(
          // shrinkWrap: true, //just set this property
          padding: const EdgeInsets.all(8.0),
          children: values.keys.map((String key) {
            return new CheckboxListTile(
              title: new Text(key),
              value: values[key],
              onChanged: (bool value) {
                setState(() {
                  values[key] = value;
                });
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
