import 'package:flutter/material.dart';

class CheckBoxInListview extends StatefulWidget {
  @override
  _CheckBoxInListviewState createState() => _CheckBoxInListviewState();
}

class _CheckBoxInListviewState extends State<CheckBoxInListview> {
  bool _isChecked = true;

  List<String> _texts = [
    "InduceSmile.com," "Flutter.io",
    "google.com",
    "youtube.com",
    "yahoo.com",
    "gmail.com"
  ];
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: new BoxConstraints(
        minHeight: 35.0,
        maxHeight: 160.0,
      ),
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(8.0),
          children: _texts
              .map((text) => CheckboxListTile(
                    title: Text(text),
                    value: _isChecked,
                    onChanged: (val) {
                      setState(() {
                        _isChecked = val;
                      });
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
