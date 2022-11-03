import 'package:flutter/material.dart';
//  ListView.separated(
//         itemCount: 200,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             leading: const Icon(Icons.access_alarm),
//             title: Text(
//               index.toString(),
//               style: const TextStyle(color: Colors.white),
//             ),
//             subtitle: const Text("sub"),
//             trailing: const Icon(Icons.arrow_forward_rounded),
//             tileColor: index % 2 == 0
//                 ? const Color.fromARGB(255, 211, 211, 211)
//                 : Colors.red,
//           );
//         },
//         separatorBuilder: ((context, index) => const Divider(
//               color: Colors.amber,
//               thickness: 3,
//             )),
//       ),