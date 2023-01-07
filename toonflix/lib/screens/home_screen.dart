///                 [Flexible]
/// 뜻 : 주변 Widget과 정해진 비율을 나누어 가지는 Widget
/// 사용 상황 : 비율적으로 나누어진 Widget을 만들고 싶을 때,
/// 사용 방법 : child: Flexible(flex: _rate, child: ...)
///

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "25:00",
                style: TextStyle(
                  fontSize: 90,
                  color: Theme.of(context).cardColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.play_circle_outline_rounded),
                color: Theme.of(context).cardColor,
                iconSize: 80,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration:
                        BoxDecoration(color: Theme.of(context).cardColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pomodoros",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
