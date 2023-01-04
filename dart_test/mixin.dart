/**                             MIXIN
 * 뜻       : 생성자가 없는 클래스의 요소를 (뺏어와서) 사용하는 것
 * 장점     : 여러 클래스에서 동일한 요소를 사용할 때, 재사용이 가능함.
 * 
 * 주의     : 상속이 아니기 때문에 수정이 불가능함. Line 48 확인
 * 
 * 사용 이유 : 여러 클래스에서 공유되거나 반복되어 사용되는 변수가 필요할 때 사용
 * 사용 방법 : with Keyword를 이용하여 사용함을 알림
 * 사용 예시 : class Class_MixedIn{_Type var}
 *            class Class_Using with Class_MixedIn{...}
 * 
 */

class Strong {
  final double strengthLevel = 15.99;
}

class Tall {
  final double height = 1.99;
}

class QuickRunner {
  void runQuick() {
    print("ruuuuuuuuuuuuuuuuuuuuun!");
  }
}

class Player with Strong, QuickRunner {
  final String name;
  Player({required this.name});
  void showStrength() {
    print(strengthLevel);
  }
}

class Kid with QuickRunner {} //

class Leader with Strong, Tall {}

class Horse with Strong, QuickRunner {
  final String name;
  Horse({required this.name});
  void showStrength() {
    print(strengthLevel);
  }
}

void main() {
  var player = Player(name: "JunWoo");
  player.runQuick();

  var horse = Horse(name: "가산");
  horse.showStrength(); // horse 클래스는 strengthLevel을 사용함

  // 주석을 해제해서 확인해보세요.
  // horse.strengthLevel = 12;
}
