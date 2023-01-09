///                           [Futuer<T>]
/// 사용 방법 1 :
///   1. StatelessWidget을 StatefulWidget으로 바꾼다.
///   2. Future<T>를 호출하는 Method를 담는 함수를 async로 정의한다.
///   3. 정의한 함수 안에 setState()도 넣는다.
///   4. initState() 안에 정의한 함수를 넣는다. (이때는 async가 필요없다.)
///

import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class ToonScreen extends StatefulWidget {
  const ToonScreen({super.key});

  @override
  State<ToonScreen> createState() => _ToonScreenState();
}

class _ToonScreenState extends State<ToonScreen> {
  List<WebtoonModel> webtoons = [];
  bool isLoading = true;

  void waitForWebtoons() async {
    webtoons = await ApiService().getTodaysToons();
    isLoading = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    waitForWebtoons();
  }

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    print(isLoading);
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
      ),
    );
  }
}
