/**                               COLLECTION FOR
 * 뜻         : List에 다른 List를 "for"을 사용하여 추가하는 것
 * 장점       : if와 함께 쓰여서, "로그인 한 후" 버튼 출력 등등으로 아주 유용하게 쓰임
 * 사용 예시  : _list = [ _val1, _val2, _val3, for (var x in old_list) "$x", ];
 * 
 */

void main() {
  var oldLanguages = ['c', 'cpp'];
  var newLanguages = [
    'python',
    'java',
    'dart',
    for (var language in oldLanguages) "I hate $language",
    //if와 함께 쓰여서, "로그인 한 후" 버튼 출력 등등으로 아주 유용하게 쓰임
  ];

  print(newLanguages);
}
