/**               [Widget]
 * 뜻 : 사실상 화면의 모든 UI들은 각각이 모두 Widget임.
 * 예시 : Text, Row, Padding, ...
 */

/**               [Scaffold]
 * 뜻 : 화면 밖으로 위젯이 나가지 않게 해주는 기본 뼈대
 * 사용 예시 : home:Scaffold(backgroundColor:..., body:...)
 */

/**               [Padding]
 * 뜻 : Widget의 바깥으로 여유 공간을 두는 것.
 * 사용 예시 : Padding(padding:EdgeInset.symmetric(horizontal or vertical): _size)
 */

/**               [Row, Column]
 * 뜻 : 위젯의 수평(Row), 수직(Column)으로 연달아 넣고 싶을 때,
 * 사용 예시 : Row(mainAxisAlignment(정렬 위치) : ..., child:[_Widget, ...], ...)
 */

/**               [Text]
 * 뜻 : 원하는 텍스트를 보여줄 Widget
 * 사용 예시 : Text("__text...", _property: ...)
 */

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
      home: Scaffold(
        // 기본 뼈대
        backgroundColor: Color(0xFF181818),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Hey, Selena",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
