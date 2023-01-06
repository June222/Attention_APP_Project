/**               [Widget]
 * 뜻 : 사실상 화면의 모든 UI들은 각각이 모두 Widget임.
 * 예시 : Text, Row, Padding, ...
 */

/**               [Scaffold]
 * 뜻 : 화면 밖으로 위젯이 나가지 않게 해주는 기본 뼈대
 * 사용 상황: 항상 사용하여야한다.
 * 사용 예시 : home:Scaffold(backgroundColor:..., body:...)
 */

/**               [Padding]
 * 뜻 : Widget의 바깥으로 여유 공간을 두는 것.
 * 사용 상황 : 화면에 너무 가까이에 Widget이 있어 미관상 좋지 않을 때,
 * 사용 예시 : Padding(padding:EdgeInset.symmetric(horizontal or vertical): _size)
 */

/**               [Row, Column]
 * 뜻 : 여러 개의 Widget을 담는 Widget
 * 사용 상황: 한 Widget안에 여러 Widget을 수직적으로 혹은 수평적으로 넣고 싶을 때,
 * 사용 예시 : Row(mainAxisAlignment(정렬 위치) : ..., child:[_Widget, ...], ...)
 *        주의 : mainAxisAlignment는 방향이 다르다.
 * Row의 mainAxisAlignment는 가로 방향 정렬이고, crossAxisAlignment는 세로 방향 정렬,
 * Column의 mainAxisAlignment는 세로 방향 정렬이고, crossAxisAlignment는 가로 방향 정렬이다.
 * 
 */

/**               [Text]
 * 뜻 : 텍스트를 보여줄 Widget
 * 사용 상황 : 사용자에게 알림, 설명을 위한 Text를 띄워야 할 때,
 * 사용 예시 : Text("__text...", _property: ...)
 */

/**               [SizedBox]
 * 뜻 : 공간을 차지하는 Box
 * 사용 상황 : 일회적으로 여분의 공간을 남기고 싶을 때,
 * 사용 예시 : SizedBox(height: _size), Row(...)
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
