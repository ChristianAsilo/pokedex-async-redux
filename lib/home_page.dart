import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          //TODO: will be placed in constant later
          title: const Text('Home Page'),
        ),
        body: const Center(
          //TODO: will be placed in constant later
          child: Text('This is Home Page'),
        ),
      ),
    );
  }
}
