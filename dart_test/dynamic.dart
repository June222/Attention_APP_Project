void main(){
/*                                dynamic Type
* 선언 방식  :  var, dynamic
* 쓰일 때    :  변수의 Type을 모를 때
* 사용 방법  :  if 조건문으로 변수 Type을 지정한 후에 method 사용
* 권장도     :  편리하긴 하나 이상적으로 권장하지 않음.
*/ 

  var __var1;
  dynamic __var2;

  __var1 = '강준우';
  __var1 = 1;
  __var1 = true;

  if(__var1 is String){
    // 여기에서는 __var1의 Type이 String으로 인식되어 String에 관한 method를 쓸 수 있음.
  }

  if(__var1 is int){
    // 여기에서는 __var1의 Type이 int으로 인식되어 int에 관한 method를 쓸 수 있음.
  }

  if(__var1 is bool){
    // 여기에서는 __var1의 Type이 bool으로 인식되어 bool에 관한 method를 쓸 수 있음.
  } 
}