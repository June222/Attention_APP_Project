/**                   CASCADE NOTATION
 * 의미   : Object의 var의 value를 수정하고 싶을 때 반복되는 부분을 생략할 수 있음.
 * 
 * 사용 방식 : _objName._var1 = newValue; _objName._var2 = newValue;
 *            => var targetObj = _objName // No ; here
 *              .._var1 = newValue   // No , here
 *              .._var2 = newvalue;  // Only ; is here
 * 
 * 사용 빈도 : 엄청 자주 쓰인다고 함
 */
class Player {
  String name;
  int age;
  String team;

  Player({
    required this.name,
    required this.age,
    required this.team,
  });
}

void main() {
  var player = Player(name: "nico", age: 20, team: "red");
  player.name = "nn";
  player.age = 22;
  player.team = 'tt';

  var pplayer = Player(name: "junwoo", age: 21, team: "black") // No ; here
    ..name = "naa" // No , here
    ..age = 12
    ..team = 'rrr';

  var randomPlayer = pplayer
    ..age = 13
    ..name = "rP"
    ..team = "asdf";
}
