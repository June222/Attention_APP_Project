///                 [Flexible]
/// 뜻 : 주변 Widget과 정해진 비율을 나누어 가지는 Widget
/// 사용 상황 : 비율적으로 나누어진 Widget을 만들고 싶을 때,
/// 사용 방법 : child: Flexible(flex: _rate, child: ...)
///

///                   [Timer.periodic()]
/// 뜻 : 매 주기마다 함수를 호출(callBack)하는 class
/// 사용 상황: 일정한 주기(시간)마다 함수를 호출하고자 할 때
///
/// [중요]
///   Timer.periodic의 인수로 들어가는 함수는 Timer를 인수로 가져야한다.
///
/// 사용 방법 1(함수 선언) :
///   _functionName(Timer timer){...}
/// 사용 방법 2(Timer 선언) :
///   Timer.periodic(duration: Duration(_seconds: ...), _functionName)
///
/// 사용 예시(버튼을 눌러서 Timer를 작동):
///   선언부 : [late] Timer timer;, void buttonPressed();, void onTick(Timer timer);
///
///   [IconButton] :
///     IconButton(onPressed: buttonPressed, icon: ...);
///
///   [buttonPressed] :
///     void buttonPressed() {timer = Timer.periodic(duration: ..., onTick)};
///
///   [onTick] :
///     void onTick(Timer timer) {setState(() {...})};
///

///                     [BorderRadius.only()]
/// 뜻 : BoxDecoration에서 필요한 부분만 둥글게 만드는 method
///
/// 사용 예시 : 왼쪽 위만 둥글게 하고싶은 경우
///   decoration: BoxDecoration(borderRadius: BorderRadius.only(_topLeft: Radius.circular(_value), ..))
///

///                         [Duration]
/// 뜻 : h:m:s:ms의  format을 가지고 있는 class
/// 사용 상황 : 시분초의 형식으로 String을 만들고 싶을 때
/// 사용 예시 :
///   Duration(seconds: _seconds, ...).toString() => H:MM:SS:MS 형식
///   후에는 .split() 이나 .substring()을 통해서 필요한 부분만 잘라서 쓸 수 있음.
///

import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 70;
  late Timer timer; // 버튼을 누르면 Timer 생성

  int totalSeconds = twentyFiveMinutes;
  int pomodorosNumber = 0;
  bool isRunning = false;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalSeconds = twentyFiveMinutes;
        isRunning = false;
        pomodorosNumber += 1;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds--;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onRestartPressed() {
    timer.cancel();
    setState(() {
      totalSeconds = twentyFiveMinutes;
      isRunning = false;
    });
  }

  String format_M_S(int seconds) =>
      Duration(seconds: seconds).toString().split(".").first.substring(
            2,
          );

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
                format_M_S(totalSeconds),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: isRunning
                        ? const Icon(Icons.pause)
                        : const Icon(Icons.play_circle_outline_rounded),
                    color: Theme.of(context).cardColor,
                    iconSize: 80,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: onRestartPressed,
                    icon: const Icon(
                      Icons.restart_alt_rounded,
                    ),
                    iconSize: 80,
                    color: Theme.of(context).cardColor,
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
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
                          "$pomodorosNumber",
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
