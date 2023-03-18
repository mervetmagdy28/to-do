class ToDo{
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList(){
    return[
      ToDo(id: '07', todoText: 'Welcome to the ToDo App', isDone: false),
      ToDo(id: '02', todoText: 'Welcome to the ToDo App', isDone: false),
      ToDo(id: '03', todoText: 'Welcome to the ToDo App', isDone: false),
      ToDo(id: '04', todoText: 'Welcome to the ToDo App', isDone: false),
      ToDo(id: '05', todoText: 'Welcome to the ToDo App', isDone: false),
    ];
  }


}