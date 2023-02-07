import 'package:flutter/material.dart';
import 'package:flutter_web_view/screen/home_screen.dart';

void main() {
  //앱 실행할 준비가 완료될 때까지 기다린다.
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
