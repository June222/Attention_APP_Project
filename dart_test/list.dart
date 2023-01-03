/*                      LIST
* 뜻        : Data를 담는 Container
* 선언 방법 : List<Type> _listName, var _listName;
* 장점      : 조건에 한해 value를 가지는 경우를 직관적으로 쓸 수 있음.
* 예시      : _list = [1,2,3,4,if(condition) 5];
 */

void main() {
  var numbers = [1, 2, 3, 4];
  List<int> numbers2 = [1, 2, 3, 4];

  bool giveMeFive = true;
  var numbers_condition = [
    1,
    2,
    3,
    4,
    if (giveMeFive) 5,
  ];
  print(numbers_condition);
}
