// Part 1 dart:core
void dartcore_numbers_collection_string() {
  // 测试dart核心库中数字、集合、字符串的功能
  print('#'*40);
  print("测试dart核心库中数字、集合、字符串的功能\n");
  print('#'*40);

  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);

  // 和Java类似，类的toString方法可以手动调用，也会在print时自动调用
  assert(42.toString() == '42');
  assert(123.456.toString() == '123.456');
  
  // 此处的Fix是四舍五入的
  assert(123.456.toStringAsFixed(2) == '123.46');
  
  // 科学计数法的互相转换
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);

  // String的一些基本方法
  String sample = 'Nerver odd or even';
  assert(sample.contains('odd'));
  assert(sample.startsWith('Never'));
  assert(sample.endsWith('even'));
  assert(sample.indexOf('odd') == 6);
  assert(sample.substring(6, 9) == 'odd');

  var parts = sample.split(' ');
  assert(parts.length == 4);
  assert(parts[0] == 'Nerver');

  assert(sample[0] == 'N');

  // split参数留空会将每个字符分开
  for (final char in 'hello'.split('')) {
    print(char);
  }

  // 字符串的codeUnits属性
  var codeUnitList = sample.codeUnits.toList();
  assert(codeUnitList[0] == 78);

  assert('web apps'.toUpperCase() == 'WEB APPS');
  assert('WEB APPS'.toLowerCase() == 'web apps');
  assert('  hello   '.trim() == 'hello');
  // 判断是否为空字符串
  assert(''.isEmpty);
  assert('  '.isNotEmpty);

  var greetingTemplate = 'Hello, NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'George');
}


int main() {
  dartcore_numbers_collection_string();

  return 0;
}