import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../models/todo.dart';
import '../constants/colors.dart';

class ToDoItem extends StatelessWidget{
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

 const ToDoItem({Key? key, required this.todo, required this.onToDoChanged, required this.onDeleteItem}): super(key: key);

 @override
 Widget build(BuildContext context){
   return Container(
     margin: EdgeInsets.only(bottom: 20),
     child: ListTile(
       onTap: (){
         onToDoChanged(todo);
       },
       shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(20)
       ),
       contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
       tileColor: Colors.white,
       leading: Icon(
         todo.isDone? Icons.check_box : Icons.check_box_outline_blank,
         color: tdBlue,
       ),
       title: Text(
         todo.todoText!,
         style: TextStyle(
           fontSize: 16,
           color: tdBlack,
           decoration: todo.isDone? TextDecoration.lineThrough: null,
        ),
       ),
       trailing: Container(
         padding: EdgeInsets.all(0),
         margin: EdgeInsets.symmetric(vertical: 12),
         height: 35,
         width: 35,
         decoration: BoxDecoration(
           color: tdRed,
           borderRadius: BorderRadius.circular(5),
         ),
         child: IconButton(
           color: Colors.white,
           iconSize: 18,
           icon: Icon(Icons.delete),
           onPressed: (){
             Alert(
               context: context,
               type: AlertType.warning,
               title: "Delete",
               desc: "Do you want to delete?",
               buttons: [
                 DialogButton(
                   child: Text(
                     "No",
                     style: TextStyle(color: Colors.white, fontSize: 18),
                   ),
                   onPressed: () => Navigator.pop(context),
                   color: tdBlue,
                 ),
                 DialogButton(
                   child: Text(
                     "Yes",
                     style: TextStyle(color: Colors.white, fontSize: 18),
                   ),
                   onPressed: () {
                     onDeleteItem(todo.id);
                     Navigator.pop(context);
                     },
                   gradient: LinearGradient(colors: [
                     Color.fromRGBO(116, 116, 191, 1.0),
                     Color.fromRGBO(52, 138, 199, 1.0),
                   ]),
                 )
               ],
             ).show();

           },
         ),
       ),
     ),
   );
 }
}