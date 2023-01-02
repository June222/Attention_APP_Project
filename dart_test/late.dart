/*                       LATE
* 뜻        : value 없이 변수를 선언하고, 이후에 value를 이용하여 정의하게 해줌
* 사용 방법  : 보통 final과 같이 쓰임
* 장점      : null safety 처럼 값이 정의되지 않은 경우에, 컴파일러가 막아줌.
* 사용 예시  : late final name; name = '123';
*/

void main() {
  final String name;
  print(name);
  name = '1234';

  late final String name2;
  print(name2);
  name2 = '1234';

  // 뭐가 다른 거죠..?
}
