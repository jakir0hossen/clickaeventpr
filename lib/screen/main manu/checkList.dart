
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/bodyBackground.dart';

class CheckList extends StatefulWidget {
  const CheckList({Key? key}) : super(key: key);

  @override
  State<CheckList> createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  List<Item> items = []; // List to store added items

  // Function to add a new item
  void _addItem(String title) {
    setState(() {
      items.add(Item(title: title, isChecked: false));
    });
  }

  // Function to show a snackbar
  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("CheckList"),
        centerTitle: true,
      ),
      body: BodyBackground(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Event CheckList",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              // Display existing items
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: items.map((item) {
                  return Row(
                    children: [
                      Checkbox(
                        value: item.isChecked,
                        onChanged: (value) {
                          setState(() {
                            item.isChecked = value!;
                            if (value) {
                              _showSnackbar("${item.title} is checked.");
                            }
                          });
                        },
                      ),
                      Text(
                        item.title,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show dialog to get title from user
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String newTitle = '';
              return AlertDialog(
                title: Text("Add Item"),
                content: TextField(
                  onChanged: (value) {
                    newTitle = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter title",
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      if (newTitle.isNotEmpty) {
                        _addItem(newTitle);
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}

class Item {
  String title;
  bool isChecked;

  Item({required this.title, required this.isChecked});
}




// import 'package:clickaeventsp/screen/widgets/bodyBackground.dart';
// import 'package:flutter/material.dart';
//
// class CheckList extends StatefulWidget {
//   const CheckList({super.key});
//
//   @override
//   State<CheckList> createState() => _CheckListState();
// }
//
// class _CheckListState extends State<CheckList> {
//   bool firstValue = false;
//   bool secondValue = false;
//   bool thirdValue = false;
//   bool fouthValue = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title: const Text("CheckList"),
//         centerTitle: true,
//       ),
//       body: BodyBackground(
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "Event CheckList",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 children: [
//                   Checkbox(
//                       value: firstValue,
//                       onChanged: (value) {
//                         setState(() {
//                           firstValue = value!;
//                         });
//                       }),
//                   Text("Brithday")
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 children: [
//                   Checkbox(
//                       value: secondValue,
//                       onChanged: (value) {
//                         setState(() {
//                           secondValue = value!;
//                         });
//                       }),
//                   Text("Wedding")
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 children: [
//                   Checkbox(
//                       value: thirdValue,
//                       onChanged: (value) {
//                         setState(() {
//                           thirdValue = value!;
//                         });
//                       }),
//                   Text("Anniversary")
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
