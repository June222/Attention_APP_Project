///                   [StatefulWidget]
/// 뜻 : interactive한 UI를 생성하는 Widget
///
/// [중요] StatelessWidget과의 구분:
///   변경되지 않는 Data를 이용한 UI를 사용하려면 State"less"Widget을 (""는 빼고)
///   변경되는 Data(State)를 이용하여 User의 입력에 interactive한 UI를 사용하려면 StatefulWidget을 사용
///
/// 생성 방법 : st 입력 후 자동완성 기능을 이용하여 Flutter StatefulWidget 선택
/// 구성 : 1. Widget 자체(코드 변경 필요 없음), 2. State(보여줄 UI, Data를 여기에 작성)
///

///                   [IconButton]
/// 뜻 : 사용자의 입력을 통해 State를 수정할 수 있는 Button Widget
/// [주의] : button은 Data를 변경하는 것이지만, UI의 State를 변경하지는 못한다.
///   => 따로 refresh를 해주어야함.
/// 사용 상황 : 사용자가 클릭하여 UI나 Data에 변경을 주고 싶을 때,
/// 사용 예시 : child: IconButton(onPressed: _functionName, icon: Icon(Icons._iconName, ..), ..)
///

///                           [setState()]
/// 뜻 : UI 새로고침하기
/// 사용 상황 : 변경된 Data의 값을 이용하여 User에게 보여주고 싶을 때
/// 사용 예시 : _functionOnPressed(){setState((){_data = _newData;});}
///

import "package:flutter/material.dart";

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<int> numbers = [];

  void onClicked() {
    setState(() {
      numbers.add(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: const Color(0xFFF4E9D6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Click Counter",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            for (var n in numbers) Text("$n"),
            IconButton(
              onPressed: onClicked,
              icon: const Icon(
                Icons.add_box_rounded,
                size: 30,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
