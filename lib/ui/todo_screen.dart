import 'package:bloc_tutorial/bloc/todo/todo_bloc.dart';
import 'package:bloc_tutorial/bloc/todo/todo_event.dart';
import 'package:bloc_tutorial/bloc/todo/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(scrolledUnderElevation: 0, title: const Text("Todo Screen")),
        body: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
          if (state.todoList.isEmpty) {
            return const Center(
              child: Text("No Todo data is found "),
            );
          } else if (state.todoList.isNotEmpty) {
            return ListView.builder(
                itemCount: state.todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          context.read<TodoBloc>().add(
                              RemoveTodoEvent(task: state.todoList[index]));
                        },
                      ),
                      leading: Text(state.todoList[index].toString(),
                          style: const TextStyle(fontSize: 20)));
                });
          } else {
            return const SizedBox();
          }
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text("Add Todo"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: todoController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "add todo",
                                labelText: "add Todo"),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                context.read<TodoBloc>().add(AddTodoEvent(
                                    task: todoController.text.toString()));
                                Navigator.pop(context);
                                todoController.clear();
                              },
                              child: Text("add todo"))
                        ],
                      ),
                    ));
            // for (var i = 0; i < 20; i++) {
            //   context
            //       .read<TodoBloc>()
            //       .add(AddTodoEvent(task: "Task : ${i + 1}"));
            // }
          },
          child: const Icon(Icons.add),
        ));
  }
}
