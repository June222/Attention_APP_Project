/**                        OPTIONAL POSITIONAL PARAMETER
 * 뜻       : required 하지 않은 argument를 만들고 싶다면?
 * 사용 예시 : _Type _function (_Type par1,[_Type? par2 = _defaultValue]){}; 
 * 
 */

String sayHello(String name, int age, [String? country = 'cuba']) =>
    "Hello $name you are $age years old and from $country";

void main() {
  var result = sayHello('Junwoo', 12);
  print(result);
}
