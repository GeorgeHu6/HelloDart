// dart:core test
void dartcore_numbers_collection_string() {
  // 测试dart核心库中数字、集合、字符串的功能
  print('\n'+'#'*40);
  print("测试dart核心库中数字、集合、字符串的功能");
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
  String sample = 'Never odd or even';
  assert(sample.contains('odd'));
  assert(sample.startsWith('Never'));
  assert(sample.endsWith('even'));
  assert(sample.indexOf('odd') == 6);
  assert(sample.substring(6, 9) == 'odd');

  var parts = sample.split(' ');
  assert(parts.length == 4);
  assert(parts[0] == 'Never');

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

  assert(greeting != greetingTemplate);

  var sb = StringBuffer();
  sb
    ..write('Use a StringBuffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');

  var fullString = sb.toString();
  assert(fullString == 'Use a StringBuffer for efficient string creation.');

  // 正则测试
  // 匹配一个或多个数字
  var numbersRe = RegExp(r'\d+');
  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';

  assert(!allCharacters.contains(numbersRe));
  assert(someDigits.contains(numbersRe));
}

int main() {
  dartcore_numbers_collection_string();

  return 0;
}