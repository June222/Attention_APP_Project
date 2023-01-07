///                       [as]
/// 뜻 : package의 이름 정하기
/// 사용 상황 :
///   import해온 package의 이름없이 method를 쓰는 것이
///   가독성이나 이해도면에서 떨어질 때
///
/// 사용 예시 1(선언) : import 'package/...' as http;
/// 사용 예시 2(사용) : _response = get(); => _response = http.get();
///   url package의 get()이라는 method가 있는데 method만 쓸 때
///   method의 역할을 직관적으로 이해하기 힘듬
///     => package의 이름을 http라고하여 http.get()으로 사용
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
