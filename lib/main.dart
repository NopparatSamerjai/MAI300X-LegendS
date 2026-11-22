import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAI300X-LegendS',
      home: Scaffold(
        appBar: AppBar(title: Text('MAI300X-LegendS')),
        body: Center(
          child: Text('🔶FATHER x SON🔶\nBuild APK สำเร็จ!', 
            textAlign: TextAlign.center, 
            style: TextStyle(fontSize: 28)
          )
        ),
      ),
    );
  }
}
