/*                            STRING INTERPOLATION
* 뜻        : 출력하는 문자열에 변수를 추가하는 방법
* 방법      : "..." 사이에 $_varName 을 넣기
* 계산한 값  : 중괄호를 이용하여 계산 
* 사용 예시  : ${_varName + num}
 */

void main() {
  var myName = "JunWoo";
  var University = "PNU";
  var old = 20;
  var greetingMSG =
      "HELLO, I'm $myName. I'm in $University and I'm ${old + 1} now;";
  print(greetingMSG);
}
