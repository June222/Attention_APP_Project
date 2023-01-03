/**                       ABSTRACT CLASS
 * 뜻         : 직접 객체를 생성할 수 없는 클래스이며,
 *              다른 클래스에서 사용되기 위해 직접 구현해야하는 Methods를 모아놓은
 *              Methods의 청사진 class
 * 
 * 사용 방법(abstract)  : abstract keyword를 사용하여 class를 정의하는데
 *                       return type과 method Name만 선언함.
 * 
 * 사용 방법(concreate) : extends keyword를 사용하여 concreate class 정의할 때
 *                      abstract class를 사용함을 알림.
 * 
 * 사용 예시(abstract)  : abstract class Human{_Type _Method(); ...} 
 * 사용 예시(concreate) : class Player extends Human{
 *                        ...;
 *                        _Type _Method() {"Implement Method in here."};
 *                       } 
 * 
 * 장점       : 비슷한 역할을 하는 동일한 이름을 가진 Method이지만, 
 *              세부적인 구현은 조금씩 차이가 있는 Method를 구현할 수 있어 유용함
 */

enum Team { red, blue }

enum XPLevel { begginer, semiPro, Pro }

abstract class Human {
  void walk();
}

// Missing concrete implementation of 'Human.walk'.
// Try implementing the missing method, or make the class abstract.

// 주석을 해제해서 확인해보세요.
// class Player extends Human {}

class Player extends Human {
  String name;
  XPLevel xp;
  Team team;

  Player({
    required this.name,
    required this.team,
    required this.xp,
  });

  void walk() {
    print("I'm walking1!!");
  }
}

class Coach extends Human {
  void walk() {
    print("the Coach is walking!");
  }
}
