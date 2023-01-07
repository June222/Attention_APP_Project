///                     [Widget Lifecycle]
/// 뜻 : StatefuleWidget의 생성부터 삭제까지의 주기
/// 순서 : 모두 주기의 이름과 같은 method를 호출한다.
///   1. intstate,
///   2. build,
///   3. dispose
///
/// 의미 : State생성, UI 및 Data 생성, Widget 삭제시에 원하는 작업이 있는 경우
///   @override 하여 하고자하는 작업을 수행한다.
///
/// 사용 상황 : 유저에게 받은 Data를 저장한 이후 다음 페이지로 옮기려 할 때,
///

import 'package:flutter/material.dart';

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({super.key});

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    super.initState();
    print("initState!");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose!");
  }

  @override
  Widget build(BuildContext context) {
    print("build!");
    return Text(
      "My Large Title",
      style: TextStyle(
        color: Theme.of(context).textTheme.titleLarge?.color,
        fontSize: 30,
      ),
    );
  }
}
