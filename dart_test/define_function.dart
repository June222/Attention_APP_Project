/**                                     DEFINE FUNCTION
 * 다른 부분은 동일한데 
 * Fat Arrow Syntax만 알아가자.
 * 복잡한 계산없이 한 줄의 return 코드로 정의되는 함수는 Fat Arrow Syntax로 길이를 줄일 수 있다.
 */

void sayHello(String name) {
  print("Hello $name! It's nice to meet you.");
}

String sayHello2(String name) {
  return "Hello $name! It's nice to meet you!";
}

// same as
String sayHello3(String name) => "Hello $name! It's nice to meet you!!";

// 간단한 계산 시에는 이렇게 함수를 선언할 수 있다.
num plus(int a, int b) => a + b;

void main() {
  sayHello("JunWoo");
  print(sayHello2("JunWoo"));
  print(sayHello3("JunWoo"));
  print(plus(3, 5));
}
