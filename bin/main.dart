void main() {
  String name = 'Artem';
  String? name2 = null;
  var count = 0;
  var title = 'AAA';
  final id = 1;
  const appName = 'TodoApp';
  print('$name, $name2, $count, $title, $id, $appName');
  List<String> tags = ['институт', 'дом'];
  Map<String, dynamic> data = {'key': 'value', 'num': 13};
  Set<int> ids = {1, 2, 3};
  dynamic anything = 42;
  anything = 'now a string';
  String greet(String name) => 'Hello, $name!';
  printTodo(title: "Купить");
  printTodo(title: "Проверить", done: true);
  String repeat(String s, [int times = 2]) => s * times;
}

void printTodo({required String title, bool done = false}) {
  print('${done ? '+' : '-'} $title');
}

class Todo {
  final int id;
  String title;
  bool isDone;

  Todo({required this.id, required this.title, this.isDone = false});

  Todo.empty() : id = 0, title = '', isDone = false;

  @override
  String toString() => '${isDone ? '+' : '-'} [$id] $title';
}
