import 'dart:convert';       
import 'package:bloc_api/bloc%20api/todoModel.dart';
import 'package:http/http.dart' as http;
class TodosApi{
  Future<List<Todo>>getAllTodos()async{
    try{
      const String url="https://jsonplaceholder.typicode.com/todos";
      var response=await http.get(Uri.parse(url));
      List<Todo> todos=(json.decode(response.body)).
      map<Todo>((jsonTodo)=>Todo.fromJson(jsonTodo))
.toList();
      return todos;
    }catch(e){
      rethrow;
    }
  }
}