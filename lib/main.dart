import 'package:flutter/material.dart';
import 'package:plant_app/view/start_screen_ui.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartScreenUI(),
      debugShowCheckedModeBanner: false,
    );
  }
}
