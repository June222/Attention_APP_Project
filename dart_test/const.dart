/*                      CONST
* 뜻            : Compile-Time immutable Variable
* 주의          : final과 다른 의미를 가짐
* Compile-Time  : 앱스토어에 올리기 전에 사용되는 immutable 변수
 */

void main() {
  const max_allowed_value = 123; // Compile-Time Variable
  // final API = getAPIFromUser(); // 사용자에게 요청 받아 쓰는 것은 non-Compile-Time
}
