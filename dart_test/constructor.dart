/**                               CONSTRUCTOR
 * 뜻     : 기존의 생성자의 의미와 동일하나 차이점이 몇가지 있음
 * 차이점 1 : class 내부의 모든 변수들은 late와 함께 정의되어야함. 
 * 차이점 2 : this를 사용하지 않고 Constructor 코드 작성 가능
 *  
 * this 를 사용하며 귀찮았던 과정을 쉽게 나타내는 문법
 * 사용 예시 : _classConstructor(this._var1, this._var2);
 */

/**                       NAMED CONSTRUCTOR PARAMETER
 * 사용 방식 : named parameter와 동일하게 사용함
 * 사용 예시(정의) : _constructor({required this._var1 ,required this._var2});
 * 사용 예시(호출) : _classConstructor(_var1:_value, _var2:_value);
 */

/**                          NAMED CONSTUCTOR
 * 뜻 : 추가적인 Constructor로 변수들을 초기화하며 생성하는 것
 * 사용 방식 1 : _ClassName._newConstructor(...)로 새로운 Constructor 정의
 * 사용 방식 2 : ':' Syntax를 사용
 * 사용 예시 : _constructor(_var1 par1, _var2 par2)
 *                      : this._var = par1, this._var2 = par2;
 */

class Player_Immutable {
  String name = 'Kang';
  int age = 12;
}

class Player_Mutable_With_Constructor {
  // Non-nullable instance field 'name' must be initialized.
  // Try adding an initializer expression,
  // or add a field initializer in this constructor,
  // or mark it

  // 다음과 같이 class 내부 변수를 정의할 경우 nullsafety 발동
  // String name;
  // int age;

  late String name;
  late int age;

  Player_Mutable_With_Constructor(String name, int age) {
    this.name = name;
    this.age = age;
  }
}

// same as
class Player_Mutable_With_Constructor_Without_This {
  late String name;
  late int age;

  // 위치가 중요함.
  Player_Mutable_With_Constructor_Without_This(this.name, this.age);
}

class Player_Named_Constructor_Parameter {
  String name;
  int xp;
  String team;
  int age;

  Player_Named_Constructor_Parameter({
    required this.name,
    required this.xp,
    required this.team,
    required this.age,
  });

  // named Constructor
  Player_Named_Constructor_Parameter.createRedTeam({
    required String name,
    required int age,
  })  : this.name = name,
        this.age = age,
        this.team = 'Red',
        this.xp = 0;

  // positional Constructor
  Player_Named_Constructor_Parameter.createBlueTeam(String name, int age)
      : this.name = name,
        this.age = age,
        this.team = 'Blue',
        this.xp = 0;
}

void main() {
  var player1 = Player_Immutable();
  print(player1.name);

  var player2 = Player_Mutable_With_Constructor("name", 1);
  print(player2.name);

  var player3 = Player_Mutable_With_Constructor_Without_This("name", 1);
  print(player3.name);

  // var player4 = Player_Named_Constructor("name", 1500, 'team', 12);
  // same as
  var player4 = Player_Named_Constructor_Parameter(
    name: "myName",
    xp: 1500,
    team: 'red',
    age: 12,
  );
  print(player4.name);

  var player5 = Player_Named_Constructor_Parameter.createRedTeam(
    age: 19,
    name: "PP",
  ); // named constructor parameter
  print(player5.team);

  var player6 = Player_Named_Constructor_Parameter.createBlueTeam(
    "태경",
    27,
  ); // positional constructor parameter
  print(player6.name);
}
