/**               [Widget]
 * 뜻 : 사실상 화면의 모든 UI들은 각각이 모두 Widget임.
 * 예시 : Text, Row, Padding, ...
 */

/**               [Scaffold]
 * 뜻 : 화면 밖으로 위젯이 나가지 않게 해주는 기본 뼈대 Widget
 * 사용 상황: 항상 사용하여야한다.
 * 사용 예시 : home:Scaffold(backgroundColor:..., body:...)
 */

/**               [Padding]
 * 뜻 : Widget의 바깥으로 여유 공간을 두는 Widget.
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
 * 뜻 : 공간을 차지하는 Box인 Widget
 * 사용 상황 : 일회적으로 여분의 공간을 남기고 싶을 때,
 * 사용 예시 : SizedBox(height: _size), Row(...)
 */

/**               [Color(s)]
 * 뜻 : 색상을 나타내는 Class
 * 사용 상황: 배경색이나, 글자색 등을 변경할 때 style과 같이 쓰임
 * 
 * 사용 에시 1
 * (제공하는 색을 쓰고 싶을 때) :  color: Colors.### #는 색상 이름
 * 사용 예시 2
 * (customized된 색을 쓰고 싶을 때) : color: Color(0xFF######) #는 색번호
 * 사용 예시 3
 * (customized된 색을 쓰고 싶을 때) : color: Color.ARGB(255,#,#,#) #는 순서대로 RGB 값
 * 사용 예시 4
 * (customized된 색을 쓰고 싶을 때) : color: Color(RGBO(#,#,#,$)) #는 순서대로 RGB 값, $는 투명도 값(0~1)
 */

// ignore: slash_for_doc_comments
/**                [Container]
 * 뜻 : 하나의 개별적인 요소를 만들 때 쓰는 Widget
 * 사용 상황 : 버튼처럼 하나의 독립적인 기능을 하는 요소를 만들고 싶을 때 씀.
 * 사용 예시 : child: Container(_property: ..., child: _Widget)
 */

///                          [Code Action]
/// 뜻 : 코드를 리팩토링하는 간편한 방법
/// 사용 상황 : Padding과 같이 여러 Widget들을 둘러싸는 Widget 코드를 적으려 할 때,
///
/// 1. const 자동 입력
/// 사용 방법 : 1. Ctrl + Shift + p, 2. Open User Settings (JSON), 3. "editor.codeActionsOnSave":{"source.fixAll":true}, 추가
/// 의미 : 저장(Ctrl + s)시에 const가 들어갈 수 있는 변수에는 const를 자동으로 넣어 compile 시간을 줄여준다.
///
/// 2. Widget Tree 만들기
/// 사용 방법 : 1. Ctrl + Shift + p, 2. Open User Settings (JSON), 3. "dart.previewFlutterUiGuides": true, 추가
/// 의미 : Widget Tree를 시각적으로 표현하여, 코드의 이해를 돕는다.
///

///                       [Reusable Widget]
/// 뜻 : 반복되는 Widget의 설정
/// 사용 상황: 매우 비슷한 Widget의 설정을 반복하여 사용하여 코드의 길이가 매우 길어진 경우
/// 사용 방법 1 : 클래스를 만들어 build의 return 값에 만드려는 Widget을 반환
/// 사용 방법 2 : Code Action의 Extract Widget을 이용하기
///
/// 사용 예시 : lib/Widgets/button.dart 참조
///

///                       [Icon]
/// 뜻 : Icon를 나타낼 수 있는 Widget
/// 사용 상황 : 나타내고자하는 img 파일이 있을 때
/// 사용 예시 : Widget: Icon(Icons._iconName, property: _property)
///

///                         [clipBehavior]
/// 뜻 : Widget을 벗어나는 요소들을 어떻게 처리할 것인가를 정하는 property
/// 사용 상황 : Icon을 Widget에 넘치게 표현하고자 할 때,
/// 사용 예시 : Container(clipBehavior: Clip._clipOption, ...)
/// #hardEdge는 overflow된 Widget을 안 보이게 처리함.
///

///                       [Transform]
/// 뜻 : Widget의 크기나 위치를 변형하는 Widget
/// 사용 상황 : 다른 요소의 변형없이 원하는 Widget만 변형하고 싶을 때,
/// 사용 예시 :Transform._transformOption(optionName:_option, child:_Widget(...), ..)
/// # Transform.scale(scale: ...)은 배율 변경
/// # Transform.translate(offset: Offset(_x,_y), ...)는 위치 변경
///

///                         [SingleChildScrollView]
/// 뜻 : 화면에서 넘치는 부분을 스크롤하여 볼 수 있게 해주는 Widget
/// 사용 상황 : 긴 화면을 만들어서 스크롤해서 모두 볼 수 있게 하고싶을 때
/// 사용 예시 : body:SingleChildScrollView(child: _Widget(...), ..)
///

import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';

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
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
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
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Total Balance",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "\$5 194 482",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Button(
                      text: "Transfer",
                      bgColor: Color(0xFFEFAA32),
                      textColor: Colors.black,
                    ),
                    // Button Widget is same as Container Widget below
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C1D1E),
                        borderRadius: BorderRadius.circular(45),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 45,
                        ),
                        child: Text(
                          "Request",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Wallets",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CurrencyCard(
                  name: "Euro",
                  code: "EUR",
                  amount: "6 428",
                  icon: Icons.euro_rounded,
                  translatePos: 0,
                  isInverted: false,
                ),
                const CurrencyCard(
                  name: "Bitcoin",
                  code: "BTC",
                  amount: "123 555",
                  icon: Icons.currency_bitcoin_rounded,
                  translatePos: 1,
                  isInverted: true,
                ),
                const CurrencyCard(
                  name: "Dollar",
                  code: "USD",
                  amount: "777 777 777",
                  icon: Icons.attach_money_rounded,
                  translatePos: 2,
                  isInverted: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
