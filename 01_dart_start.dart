void variable_use() {
  var name = "Voyager I";
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };
}

void progress_control() {
  var year = 1977;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];

  for (final object in flybyObjects) {
    print(object);
  }

  if (year >= 2001) {
    print("21st century");
  } else if (year >= 1901) {
    print("20th century");
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
  }
}

int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

void func() {
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  // 只有一条return的匿名函数的语法糖
  flybyObjects.where((name) => name.contains("turn")).forEach(print);
}

class Spacecraft {
  String name;

  // 带问号的是允许空的类型
  DateTime? launchDate;

  int? get launchYear => launchDate?.year;

  //对于类中变量的两种初始化方式
  Spacecraft(this.name, this.launchDate) {}

  Spacecraft.unlaunched(String name) : this(name, null);

  void describe() {
    print("Spacecraft: $name");
    var launchDate = this.launchDate;
    if (launchDate != null) {
      //运算符~/表示取整除法
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print("Launched: $launchYear ($years years ago)");
    } else {
      print("Unlaunched");
    }
  }
}

class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(String name, DateTime launchDate, this.altitude)
      : super(name, launchDate);
}

void use_extend_class() {
  Orbiter orbiter = Orbiter("Orbiter I", DateTime(2022, 3, 31), 1980.5);

  print(orbiter.launchYear);
}

mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print("Number of astronauts: $astronauts");
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(String name, DateTime date):super(name, date);
}

void use_Spacecraft() {
  var voyager = Spacecraft("Voyager I", DateTime(1977, 9, 5));
  voyager.describe();

  var voyager3 = Spacecraft.unlaunched("Voyager III");
  voyager3.describe();
}

void use_PilotedCraft() {
  PilotedCraft pilotedCraft =
      PilotedCraft("PilotedCraft I", DateTime(2022, 3, 30));
  pilotedCraft.describeCrew();
}

abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print("========");
    describe();
    print("========");
  }
}

class MockSpaceship extends Describable implements Spacecraft {
  String name;
  DateTime? launchDate;
  int? get launchYear => launchDate?.year;

  MockSpaceship(this.name) {}

  @override
  void describe() {
    print("$launchYear");
  }
}

void use_MockSpaceship() {
  MockSpaceship spaceship = MockSpaceship("spaceship I");
  spaceship.describeWithEmphasis();
}

// 双斜杠注释
/* 单斜杠加星号的注释 */
void main(List<String> args) {
  var result = fibonacci(20);
  variable_use();
  progress_control();
  print("\n");
  func();

  use_Spacecraft();
  use_extend_class();
  use_PilotedCraft();
  use_MockSpaceship();

  print("\n" + result.toString());
}
