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
///     _onTap: () { // 눌렀다 땠을 때,
///       Navigator.push(
///         context, MaterialPageRoute(
///           builder: (context) => _NewScreen(...)
///         ) // Navigator.push
///       ) // MaterailPageRoute
///     } // onTap
///   ) // GetureDetector
///

///                     [Navigator.push()]
/// 뜻 :
///   Route와 Route의 Stack을 다루는 API
///
/// 의미 :
///   screen을 호출하여 선형적으로 띄우는 경우에 screen은 자신을 만든
///   screen이 존재하는데, Navigator는 이것을 관리하여
///   뒤로가기 버튼등을 만들어줄 수 있다.
///
/// 사용 예시 : _NewScreen을 현재 스크린 위에 Android Style로 띄운다.
///   Navigator.push(context, MaterialPageRoute(builder: (context)=>_NewScreen))
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
          Hero(
            tag: id,
            child: Container(
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
