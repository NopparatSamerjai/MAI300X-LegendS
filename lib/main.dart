import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAI300X-LegendS',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MAI300X-LegendS'),
          backgroundColor: Colors.black,
          foregroundColor: Colors.orange,
        ),
        backgroundColor: Colors.black,
        body: const Center(
          child: Text(
            '🔶FATHER x SON🔶\nBuild APK สำเร็จ!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
