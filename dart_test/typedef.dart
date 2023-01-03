/**                                   TYPEDEF
 * 뜻 : 길거나 혹은 알아보기 힘든 변수명의 alias를 부여하는 것
 * 사용 방법 : typedef _LongTypeName = _ShortTypeName;
 * 사용 예시 : typedef MapSLI = Map<String,List<int>>;
 */
typedef ListOfInt = List<int>;

ListOfInt getReversedList(ListOfInt list) {
  var reversed = list.reversed;
  return reversed.toList();
}

void main() {
  var reversedList = getReversedList([1, 2, 3]);
  print(reversedList);
}
