import 'dart:io';
import 'package:todo_app/todo_repository.dart';
import 'package:todo_app/todo.dart';

void main() {
  TodoRepository repository = TodoRepository();
  printMenu();
  while (true) {
    stdout.write('> ');
    String? input = stdin.readLineSync();
    if (input == null) {
      continue;
    }
    input = input.trim();
    if (input.isEmpty) {
      continue;
    }
    bool shouldExit = handleCommand(input, repository);
    if (shouldExit) {
      break;
    }
  }
}

void printMenu() {
  print("Консольное приложение TODO");
  print('Команды:');
  print('list - показать все задачи');
  print('add <текст> - добавить задачу');
  print('done <id> - отметить задачу как выполненную');
  print('undone <id> - отметить задачу как невыполненную');
  print('delete <id> - удалить задачу');
  print('exit - выйти из приложения');
}

void addCommand(TodoRepository repository, String input) {
  try {
    String title = input.substring(4).trim();
    repository.add(title);
    print('Задача добавлена');
  } catch (e) {
    print('Ошибка: ${e.toString()}');
  }
}

void listCommand(TodoRepository repository) {
  List<Todo> todos = repository.getAll();
  if (todos.isEmpty) {
    print('Список задач пуст');
  } else {
    for (var todo in todos) {
      print(todo);
    }
  }
}

void doneCommand(TodoRepository repository, String input) {
  try {
    int id = int.parse(input.substring(5).trim());
    repository.complete(id);
    print('Задача отмечена как выполненная');
  } catch (e) {
    print('Ошибка: ${e.toString()}');
  }
}

void uncompleteCommand(TodoRepository repository, String input) {
  try {
    int id = int.parse(input.substring(7).trim());
    repository.uncomplete(id);
    print('Задача отмечена как невыполненная');
  } catch (e) {
    print('Ошибка: ${e.toString()}');
  }
}

void deleteCommand(TodoRepository repository, String input) {
  try {
    int id = int.parse(input.substring(7).trim());
    repository.delete(id);
    print('Задача удалена');
  } catch (e) {
    print('Ошибка: ${e.toString()}');
  }
}

bool handleCommand(String input, TodoRepository repository) {
  List<String> parts = input.split(' ');
  String command = parts[0].toLowerCase();
  try {
    switch (command) {
      case 'list':
        listCommand(repository);
        break;
      case 'add':
        addCommand(repository, input);
        break;
      case 'done':
        doneCommand(repository, input);
        break;
      case 'undone':
        uncompleteCommand(repository, input);
        break;
      case 'delete':
        deleteCommand(repository, input);
        break;
      case 'exit':
        print('Выход из приложения');
        return true;
      default:
        print('Неизвестная команда: $command');
    }
  } catch (e) {
    print('Ошибка: $e');
  }
  return false;
}
