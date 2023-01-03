/**                                   NAMED PARAMETER
 * 뜻            : 함수를 호출할 때, 코드의 가독성을 높이는 방법
 * 사용되는 상황1 : 정의된 PARAMETER의 위치와 상관없이 함수를 사용하고 싶을 때,
 * 사용되는 상황2 : 함수를 호출하는 코드의 가독성을 높이고 싶을 때, 
 * 
 * 사용 방법      : parameter를 highlight한 뒤, 중괄호 넣어주기
 * 사용 예시(정의): void _function({_Type par1, _Type par2}){};
 * 사용 예시(호출): _function({par1:_varName1, par2:_varName2});
 * 
 * User는 개발자의 의도와 다른 행동으로 혹은 단순히 기억하지 못함으로
 * null parameter를 만들 수 있기에,
 * Null Safety를 위한 2가지 방법이 제공됨.
 * 
 * Null Safety를 위한 방법 1 : default값 지정
 * Null Safety를 위한 방법 2 : required 사용
 */

/**                                   REQUIRED
 * 뜻       : 함수의 인자가 꼭 필요한 인자로써, 
 *            null이 들어오면 안되는 parameter일 때 쓰는 Keyword.
 * 
 * 사용 예시 : void _function({
 * required String ID,
 * required String nickname,
 * required String password,
 * String EmailAddress,
 * }){...};
 * 
 */

String sayHello(String name, int age, String country) {
  return "Hello!. I'm $name and from $country and I'm $age from this year";
}

// 중괄호가 parameter 전체에 추가된 모습

// 주석을 해제해서 확인해 보세요. => 해제할 부분 전체 highlight 이후 ctrl + k + u
// String sayHello_Named_Para_without_NullSafety(
//     {String name, int age, String country}) {
//   return "Hello!. I'm $name and from $country and I'm $age from this year";
// }

String sayHello_Named_Para_with_default(
    // 모든 parameter에 default값이 들어간 모습
    {String name = "anon",
    int age = 99,
    String country = "anon"}) {
  return "Hello!. I'm $name and from $country and I'm $age from this year";
}

String sayHello_Named_Para_with_required( // 모든 parameter에 required가 된 모습
    {
  required String name,
  required int age,
  required String country,
}) {
  return "Hello!. I'm $name and from $country and I'm $age from this year";
}

void main() {
  print(sayHello('JunWoo', 27, "Korea"));

  print(sayHello_Named_Para_with_default(
    age: 12,
    name: "JunWooooo",
    country: "Colombia",
  ));

  print(sayHello_Named_Para_with_required(
    name: "JunWWW",
    age: 12,
    country: "Korean",
  ));
}
