/**                                   Inheritance
 * 뜻        : 파이썬 상속과 크게 다르지 않음
 * 상속 방법 : extends 키워드를 사용하여 상속 
 * 
 * 생성자 생성시 주의 : 1. positional parameter, 2. named parameter 두 가지 방법이 있기 때문에 주의
*                      => 헷갈리면 named_parameter.dart 가서 확인  
 * 
 * 주의   : 문법에서 조심해야하는데,
 *          1. 하위 클래스의 Constructor에서 this로 argument를 받을 수 없다는 것
 *          2. ':'을 이용하여 부모 클래스의 요소를 초기화 해주어야 한다는 것
 *          3. super을 통해 부모 클래스의 요소들을 사용할 수 있다는 것.
 * 
 * 사용 예시 : class Parent{_Type1 varP;
 *                Parent(this.varP) // ## positional parameter
 *            } 
 * 
 *            class Child extends Parent{
 *                _Type2 varC
 *                Child({required this.varC, required _Type1 varP}) // ### named parameter
 *                             // ^ 부모 클래스 요소는 this를 쓰지 않는 것에 주의
 *                : super(varP) // ## positional parameter
 *            } 
 */

class Human {
  final String name;
  Human(this.name);
  void sayHello() {
    print("Hi my name is $name");
  }
}

enum Team { blue, red }

class Player extends Human {
  final Team team;

  Player({
    required this.team,
    required String name, // 이 부분을 this로 받을 수 없음.
  }) : super(name); // ## positional parameter

  @override
  void sayHello() {
    super.sayHello();
    print('and I Play for ${team}');
  }
}

void main() {
  var player = Player(team: Team.blue, name: "Junwoo"); // ### named parameter
  player.sayHello();
}
