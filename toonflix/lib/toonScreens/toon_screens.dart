///                           [Futuer<T>]
/// 사용 방법 1 :
///   1. StatelessWidget을 StatefulWidget으로 바꾼다.
///   2. Future<T>를 호출하는 Method를 담는 함수를 async로 정의한다.
///   3. 정의한 함수 안에 setState()도 넣는다.
///   4. initState() 안에 정의한 함수를 넣는다. (이때는 async가 필요없다.)
///

///                           [FutureBuilder()]
/// 뜻 :
///   Future를 return 하는 함수의 상태를 확인할 수 있는 Widget
///
/// property :
///   required builder, future, initialData
///
/// builder :
///   argument로 (BuildContext) context, snapshot을 받는다. (자동)
///   - context : BuildContext

/// future :
///   기다려야하는 대상 (callback 함수의 return 값)
///
/// 사용 예시 :
///   body : FutureBuilder (
///     builder: (context, snapshot) {_condition? _WidigetTrue : _WidgetFalse}
///     future : _async_Function_ApiService()
/// )
///

///                         [ListView]
/// 뜻 :
///   여러 Widget들을 한꺼번에 띄워주는 Widget
///
/// 의미 :
///   스크롤을 많이하는 화면에는 Row나 Column 대신 ListView를 쓴다.
///
/// 장점 :
///   모든 children에 들어가는 Widget을 한꺼번에 보여주기 때문에
///   적은 양에서는 버벅임이 없다.
/// 단점 :
///   인스타그램과 같이 무한스크롤이 되는 화면에서는 메모리를 많이 써서
///   기기가 죽게 만들 수 있다.
///
/// 사용 예시 :
///   Row나 Column과 동일일

import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class ToonScreen extends StatelessWidget {
  ToonScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService().getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.greenAccent.shade400,
          title: const Text(
            "오늘의 웹툰!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView(
                    children: [
                      for (var webtoon in snapshot.data!) Text(webtoon.title),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
          future: webtoons,
        ),
      ),
    );
  }
}
