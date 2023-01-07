///                       [as]
/// 뜻 :
///   package의 이름 정하기
///
/// 사용 상황 :
///   import해온 package의 이름없이 method를 쓰는 것이
///   가독성이나 이해도면에서 떨어질 때
///
/// 사용 예시 1(선언) :
///   import 'package/...' as http;
///
/// 사용 예시 2(사용) :
///   _response = get(); => _response = http.get();
///
///   url package의 get()이라는 method가 있는데 method만 쓸 때
///   method의 역할을 직관적으로 이해하기 힘듬
///     => package의 이름을 http라고하여 http.get()으로 사용
///

///                               [Future<T>]
/// 뜻 :
///   [비동기적]으로 class T가 return 되는 클래스
///
/// 의미 :
///   User의 네트워크 문제나 서버의 메모리 부족 등등으로
///   시간이 오래 걸리고, 코드가 실행되는 즉시 처리되지 못할 수도 있는 클래스
///
/// 사용 방법 : [await], [async] Keyword 사용
///   방법 1 : Future<T> 를 반환하는 함수 사용시에는 [await]를 앞에 붙여준다.
///   방법 2 : [await] Keyword를 사용하는 코드를 포함하는 함수 선언명 뒤에 [async]를 달아준다.
///
/// 사용 예시 1 (함수 사용) :
///   final response = await http.get("_Url");
///
/// 사용 예시 2 (함수 선언) :
///   void processResponse(...) async {final response =...}
///

import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  void getTodaysToons() async {
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }
}
