/*                                  NULLABLE_VARIABLES
* 문제 상황    : 정의되지 않은 null 참조시에 runtime Error가 일어나며, 이는 사용자 기기에서 일어나기에 치명적임.

* default     : 모든 변수는 non-nullable
* 뜻          : null이 가능한 변수는 선언할 때 명시적으로 해주어야 한다는 것
* 선언 시에    : 변수 이름 뒤에 ?을 붙여 nullable을 알림
* 예시        : String? _var = '_var is nullable';
* 사용 방법    : if 조건문을 통해 null이 아님을 확인하고, method 사용
*/

void main() {
  String _var = '_var is non-nullable';
  //_var = null; //=> 컴파일 단계에서 Error 발생, 문제 예방 가능

  String? _var1 = '_var1 is nullable';
  _var1 = null;

  if (_var1 != null) {
    // 이렇게 명시적으로 확인하여 사용하여야함.
    _var1.isNotEmpty;
  }
  // same as
  _var1?.isNotEmpty;
}
