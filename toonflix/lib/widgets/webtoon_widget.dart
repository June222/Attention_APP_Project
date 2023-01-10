///                           [GestureDetector]
/// 뜻 :
///   사용자의 입력을 구분하고, 입력을 받아들이는 Widget
///
/// 의미 :
///   Widget을 {터치, 길게 터치, 두 번 터치, ..}할 때,
///   수행할 작업을 넣은 Widget을 만들 수 있음.
///
/// 사용 예시 : 눌렀다 땠을 때, _NewScreen으로 화면 전환
///   return GestureDetector(
///     _onTap: () {
///       Navigator.push(
///         context, MaterialPageRoute(
///           builder: (context) => _NewScreen(...)
///         ) // Navigator.push
///       ) // MaterailPageRoute
///     } // onTap
///   ) // GetureDetector
///

import 'package:flutter/material.dart';
import 'package:toonflix/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) =>
                DetailScreen(title: title, thumb: thumb, id: id),
          ),
        );
      },
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5,
                  offset: Offset(5, 10),
                )
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            width: 200,
            child: Image.network(thumb),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
