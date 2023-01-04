

import 'package:flutter/material.dart';

void main() {
  runApp(App()); // Starting point = Root of Application
}
// Root는 구글 Theme 혹은 ios Theme 둘 중 하나를 선택해야만한다.
// Material(google), CupertinoApp(ios)

// Missing concrete implementation of 'StatelessWidget.build'.
// StatelessWidget을 상속받으려면 build Method를 구현해주어야한다.

// build Method는 사용자에게 보일 UI를 구현하는 것이다.
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Text('Hello world!'),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello flutter!"),
        ),
        body: Center(
          child: Text("Hello world!"),
        ),
      ),
    );
  }
}
