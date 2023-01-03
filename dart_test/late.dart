/*                       LATE
* 뜻        : 정의하고 싶은 변수가 있지만, 아직은 값을 모를 때를 명시적으로 나타내기 위해 씀
* 사용 방법  : 변수 Type 앞에 late를 붙여서 사용함
* 장점      : null safety 처럼 값이 정의되지 않은 경우에, 컴파일러가 막아줌.
* 사용 예시  : late final name; name = '123';
*/

void main() {
  final String name; // 이후에 정의된다는 것을 선언부로 알 수 없음.

  late final String name2; // 이후에 정의된다는 것을 명시적으로 함으로써 오해 방지
  // print(name2); // 값이 아직 들어오지 않았음을 컴파일 단계에서 알려줌.
  name2 = '1234';
}
