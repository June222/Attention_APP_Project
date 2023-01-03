/**                           QQ(??)OPERATOR
 * 뜻           : 결과가 두 가지 밖에 없는 경우에 if 대신 짧게 쓸 수 있는 operator
 * 사용되는 상황 : null이 참조되는 경우와 참조되지 않는 경우의 결과를 달리 하고 싶을 때
 *
 * 사용 예시 1  : condition ? LEFT : RIGHT 
 * => if condition true) SELECT LEFT, else) SELECT RIGHT
 * 
 * 사용 예시 2  : LEFT ?? RIGHT 
 * => if LEFT isn't null) SELECT LEFT else) SELECT RIGHT 
 */

String capitalizeName(String name) => name.toUpperCase();

// 주석을 해제하고 확인해보세요.
// String capitalizeName2(String? name) => name.toUpperCase(); // null safety

String capitalizeName3(String? name) {
  if (name != null) {
    return name.toUpperCase();
  }
  return "ANON";
}

// same as
String capitalizeName4(String? name) =>
    name != null ? name.toUpperCase() : "ANON";
// same as
String capitalizeName5(String? name) => name?.toUpperCase() ?? "NONE";

void main() {
  var result = capitalizeName("junwoo");
  print(result);
}
