import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/db/database_helper.dart';
import 'package:todo_app/models/student.dart';
import 'package:todo_app/widgets/student_card_widget.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Text('Student List'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: FutureBuilder<List<Todos>>(
        future: DatabaseHelper.instance.getAllTodos(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.isEmpty) {
              return const Center(
                child: Text('No students found'),
              );
            }

            List<Todos> todos = snapshot.data;

            return ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  Todos todo = todos[index];

                  return Column(
                    children: [
                      StudentCardWidget(
                        todo: todo,
                        onDelete: () {
                          // show alert dialog

                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Confirmation'),
                                  content:
                                      const Text('Are you sure to delete ? '),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('No')),
                                    TextButton(
                                        onPressed: () async {
                                          Navigator.pop(context);

                                          int result = await DatabaseHelper
                                              .instance
                                              .deleteTodos(todo.id!);

                                          if (result > 0) {
                                            Fluttertoast.showToast(
                                                msg: 'Deleted');
                                            setState(() {});
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: 'Failed');
                                          }
                                        },
                                        child: const Text('Yes')),
                                  ],
                                );
                              });
                        },
                        onUpdate: () {},
                      ),
                    ],
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
