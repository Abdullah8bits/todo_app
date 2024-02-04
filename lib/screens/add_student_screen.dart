import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/db/database_helper.dart';
import 'package:todo_app/models/student.dart';
import 'package:todo_app/screens/student_list_screen.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String name, decriptionoftodo;
  late String befdates;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todos'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please provide value';
                  }

                  name = text;
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Todo Description',
                  border: OutlineInputBorder(),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please provide Description Of The Todod';
                  }

                  decriptionoftodo = text;
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                maxLength: 11,
                decoration: const InputDecoration(
                  hintText: 'Complete Before ',
                  border: OutlineInputBorder(),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please provide value';
                  }

                  befdates = text;
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      // Save student
                      Todos student = Todos(
                        name: name,
                        description: decriptionoftodo,
                        befdate: befdates,
                      );

                      int result =
                          await DatabaseHelper.instance.insertTodo(student);

                      if (result > 0) {
                        print(result);
                        Fluttertoast.showToast(
                            msg: 'Record Saved', backgroundColor: Colors.green);

                        formKey.currentState!.reset();
                      } else {
                        print(result);
                        Fluttertoast.showToast(
                            msg: 'Failed', backgroundColor: Colors.red);
                      }
                    }
                  },
                  child: const Text('Save')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const StudentListScreen();
                    }));
                  },
                  child: const Text('View All')),
            ],
          ),
        ),
      ),
    );
  }
}
