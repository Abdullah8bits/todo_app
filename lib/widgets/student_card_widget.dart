import 'package:flutter/material.dart';
import 'package:todo_app/models/student.dart';

class StudentCardWidget extends StatelessWidget {
  final Todos todo;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;

  const StudentCardWidget({
    super.key,
    required this.todo,
    required this.onDelete,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 0, 81, 255),
              spreadRadius: 0,
              blurRadius: 7,
            ),
            BoxShadow(
              color: Color.fromARGB(255, 21, 127, 214),
              spreadRadius: 0,
              blurRadius: 0,
            )
          ],
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 21, 127, 214),
              Color.fromARGB(255, 39, 138, 184),
              Color.fromARGB(255, 35, 134, 190),
              Color.fromARGB(255, 7, 135, 255),
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      todo.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w400),
                    ),
                    Spacer(),
                    Icon(Icons.today_rounded, size: 35, color: Colors.black)
                  ],
                ),
                Text(
                  todo.description,
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                ),
                SizedBox(
                  height: 1,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.phone,
                      size: 20,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      todo.befdate,
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 13, 104, 190),
                            ),
                            onPressed: onDelete,
                            child: const Text(
                              'Delete',
                              style: TextStyle(color: Colors.white),
                            ))),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 10, 116, 214),
                            ),
                            onPressed: onUpdate,
                            child: const Text(
                              'Update',
                              style: TextStyle(color: Colors.white),
                            ))),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}























// class StudentCardWidget extends StatelessWidget {
//   final Student student;
//   final VoidCallback onDelete;
//   final VoidCallback onUpdate;
//   const StudentCardWidget(
//       {super.key,
//       required this.student,
//       required this.onDelete,
//       required this.onUpdate});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: Container(
//         padding: EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           gradient: LinearGradient(
//             colors: [
//               Colors.teal,
//               const Color.fromARGB(255, 0, 255, 229),
//             ],
//           ),
//         ),
//         width: 100,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               student.name,
//               style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
//             ),
//             StudentItemInfoWidget(space: 15, title: '', value: student.uni),
//             SizedBox(
//               height: 3,
//             ),
//             StudentItemInfoWidget(
//                 space: 80, title: 'Course :', value: student.course),
//             SizedBox(
//               height: 3,
//             ),
//             StudentItemInfoWidget(space: 0, title: "", value: student.email),
//             SizedBox(
//               height: 3,
//             ),
//             StudentItemInfoWidget(space: 0, title: "", value: student.mobile),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               children: [
//                 Expanded(
//                     child: ElevatedButton(
//                         onPressed: onDelete, child: const Text('Delete'))),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Expanded(
//                     child: ElevatedButton(
//                         onPressed: onUpdate, child: const Text('Update'))),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
