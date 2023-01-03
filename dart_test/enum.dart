/**                               ENUM
 *  뜻  : class 와 같이 쓰이며, 오타가 생길 위험이 큰 String을 대신해서 많이 쓰이는 변수
 * 'flex' -> 'felx', 'red' -> 'rad' 와 같은 compile 단계에서 찾기 힘든 오류를 
 * 막아줄 수 있는 class Type
 * 사용 빈도 : 매우 높음
 * 
 * 사용 방법  : 직접 enum을 정의하여 사용코드 상위에 enum _TypeName {var1,var2} // No ; here
 * 사용 예시  : enum Team {red,blue} ... _var = Team.blue
 */

enum Team { red, blue }

enum XPLevel { begginer, semipro, pro }

class Player {
  String name;
  XPLevel xp;
  Team team;

  Player({
    required this.name,
    required this.xp,
    required this.team,
  });

  void showXPLevel() {
    print(xp);
  }
}

void main() {
  var newPlayer = Player(name: "Kang", xp: XPLevel.begginer, team: Team.blue)
    ..name = "Kang2"
    ..xp = XPLevel.pro
    ..team = Team.red
    ..showXPLevel();
}
