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
///
///   [중요]
/// [snapshot] :
///   FutureBuilder(future: _Future<T>) 이면,
///   snapshot에는 T가 저장이 되고,
///   snapshot.hasData를 통해 nullSafety를 확보한 다음,
///   snapshot.data!.###로 주어진 Type에 맞게 쓰면 된다.
///
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
///

///                        [ListView.builder()]
/// 뜻 :
///   필요한 부분만 index를 이용해서 로드하여 List로 나타내주는 Widget
///
/// 의미 :
///   일반 ListView와 달리 필요한 부분만 로드하여 보여주고,
///   보이지 않는 부분은 메모리에서 제거하여, 무한 스크롤이 가능하게 한다.
///
/// 사용 예시 :
///   ListView.builder (
///     itemBuilder: (context, index) {
///       return Text(snapshot.data![index]._title);
///     }
/// )
///

///                         [ListView.seperated()]
/// 뜻 :
///   표시할 Widget 사이에 Widget을 넣을 수 있는 Widget
///
/// 의미 :
///   ListView, ListView.build로는 할 수 없는,
///   List의 property 사이에 Widget을 끼울 수 있다.
///   간단한 예시로 사이사이에 SizedBox를 넣음으로써,
///   Widget들을 구분할 수 있게 할 수 있다.
///
/// 사용 방법 :
///   LisrView.build() + seperatorBuilder: (context, index) {return _Widget;}
///

///                         [CircularProgressIndicator]
/// 뜻 :
///   돌아가는 원모양 로딩화면 Widget
///
/// 사용 예시 :
///   Center(child: CurcularProgressIndicator())
///

import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/webtoon_widget.dart';

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
                ? makeList(snapshot)
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
          future: webtoons,
        ),
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
    );
  }
}
