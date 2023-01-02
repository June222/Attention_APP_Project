/*                      FINAL
* 뜻  : 수정 불가능한 변수
* can only be set once : immutable
* 사용 방법 : final [Type](생략 가능) 변수 이름 = _value;
* 예시1 : final String nico = 'name';
* 예시2 : final nico = 'name';
*/

void main() {
  String name = '123';
  name = '345'; // mutable

  final String name2 = '123';
  // name2 = '345'; // => 컴파일 단계에서 오류 발생

  final name3 = '123';
  // name3 = '345'; // => 마찬가지
}
