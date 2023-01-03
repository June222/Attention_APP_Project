/**                    NON-STRUCTED DATA TO OBJECT(CLASS)
 * 의미 : 앞서 배웠던 Constructor를 활용하는 방법으로 (constructor.dart 확인)
 *        .csv나 .json 파일처럼 분류만 되어있는 Data를 Object에 집어넣는 방법
 * 
 * 활용되는 키워드 : typedef, dynamic, class, namedConstructor(:), foreach
 */

typedef PlayerJson = Map<String, dynamic>; // 무엇이 오는 지 모름

class Player {
  final String name; // once assigned never changed.
  int age;
  String team;

  Player.fromJson(PlayerJson playerJson)
      : name = playerJson['name'],
        age = playerJson['age'],
        team = playerJson['team'];

  void sayHi() {
    print("Hi I'm $name and in $team team");
  }
}

void main() {
  List<PlayerJson> apiData = [
    {
      "name": "Kang",
      "age": 12,
      "team": "Red",
    },
    {
      "name": "Jun",
      "age": 12,
      "team": "Black",
    },
    {
      "name": "Woo",
      "age": 12,
      "team": "Blue",
    },
  ];
  apiData.forEach((playerJson) {
    var player = Player.fromJson(playerJson);
    player.sayHi();
  });
}
