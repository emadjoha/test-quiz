import 'package:authentication/Injection_getX_controller.dart';
import 'package:authentication/helpers/singleton_instances.dart';
import 'package:authentication/screens/login/presentation/UI/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


void main() {
  iniGetXController();
  initSingletonInstances();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      home: LoginScreen(),
      builder: EasyLoading.init(),
    );
  }
}

