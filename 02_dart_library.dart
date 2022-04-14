// dart:core test
void dartcore_numbers_collection_string() {
  // 测试dart核心库中数字、集合、字符串的功能
  print('\n' + '#' * 40);
  print("测试dart核心库中数字、集合、字符串的功能");
  print('#' * 40);

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

void the_lists() {
  // 测试dart中的一些列表的操作
  var grains = <String>[];
  assert(grains.isEmpty);

  var fruits = ['apples', 'oranges'];
  fruits.add('pineapples');
  fruits.addAll(['grapes', 'bananas']);
  // 插在开头
  fruits.insert(0, 'peach');
  assert(fruits.length == 6);

  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 5);
  fruits.clear();
  assert(fruits.isEmpty);

  var vegetables = List.filled(99, 'broccoli');
  assert(vegetables.every((element) => element == 'broccoli'));

  fruits = ['bananas', 'apples', 'oranges'];
  // 进行排序，排序规则需要以函数为参数传入
  fruits.sort((a, b) => a.compareTo(b));
  assert(fruits[0] == 'apples');
  fruits = <String>[];
  fruits.add('apples');
  var fruit = fruits[0];
  assert(fruit is String);
}

void the_sets() {
  var ingredients = <String>{};
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);

  // 在集合中添加已有元素，不会有任何效果
  ingredients.add('gold');
  assert(ingredients.length == 3);

  ingredients.remove('gold');
  assert(ingredients.length == 2);

  // 使用Set的from构造函数
  var atomicNumbers = Set.from([1, 2, 3]);
  assert(atomicNumbers.length == 3);

  ingredients.clear();
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.contains('titanium'));
  assert(ingredients.containsAll(['titanium', 'xenon']));

  ingredients.clear();
  ingredients.addAll(['gold', 'titanium', 'xenon']);

  // 集合的一些基本运算
  var nobelGases = Set.from(['xenon', 'argon']);
  var intersection = ingredients.intersection(nobelGases);
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));
}

void the_maps() {
  // 直接创建Map
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  var searchTerms = Map();
  // 指定键值的类型
  var nobleGases = Map<int, String>();
  nobleGases = {54: 'xenon'};
  assert(nobleGases[54] == 'xenon');
  assert(nobleGases.containsKey(54));
  // 按键值删除Map中的键值对
  nobleGases.remove(54);
  assert(!nobleGases.containsKey(54));
  // 获得Map的所有键的Iterator
  var keys = hawaiianBeaches.keys;
  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));
  // 获得Map的所有值的Iterator
  var values = hawaiianBeaches.values;
  assert(values.length == 3);
  assert(values.any((element) => element.contains('Kailua')));

  hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };
  assert(hawaiianBeaches.containsKey('Oahu'));
  assert(!hawaiianBeaches.containsKey('Florida'));

  var teamAssignments = <String, String>{};
  String pickToughestKid() {
    return "pickToughestKid";
  }
  // 若key不存在于该Map中，就加入
  teamAssignments.putIfAbsent('Catcher', () => pickToughestKid());
  assert(teamAssignments['Catcher'] != null);
}

void the_public_methods() {
  // 一些通用的公共方法测试
  var coffees = <String>[];
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  assert(coffees.isEmpty);
  assert(teas.isNotEmpty);
  teas.forEach((element) => print('I drink $teas'));

  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  hawaiianBeaches.forEach((key, value) {
    print("I want to visit $key and swim at $value");
  });

  teas = ['green', 'black', 'chamomile', 'earl grey'];
  // 和JavaScript中的map用法一样
  var loudTeas = teas.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);
  var loadTeas_str = loudTeas.toList();
  print(loadTeas_str);
  // 用匿名函数创建判断是否是“洋甘菊茶”的函数
  bool isDecaffeinated(String teaName) => teaName == 'chamomile';
  // 与数据库类似的查询方法
  var decaffeinatedTeas = teas.where((tea) => isDecaffeinated(tea));
  assert(teas.any(isDecaffeinated));
  assert(!teas.every(isDecaffeinated));
}

int main() {
  dartcore_numbers_collection_string();
  the_lists();
  the_sets();
  the_maps();
  the_public_methods();
  return 0;
}
