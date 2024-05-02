import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todoapps/pages/login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required String title});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
        Duration(milliseconds: 3000),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const loginPages(
                      title: '',
                    ))));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            width: size.width,
            height: size.height,
            fit: BoxFit.fill,
          ),
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 960.0,
            ),
          )
        ],
      ),
    );
  }
}
