import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:todo_app/user_model_list.dart';
import 'user_item.dart';
import 'user_model2.dart';
import 'networking.dart';
import 'package:convert/convert.dart';
import 'dart:convert';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'JSON Path Finder'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Networking network = new Networking();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Column(
        children: [
          SizedBox(
            height: 700,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            var user = await network.firstApiFirstJson();
                          },
                          child: Text('First API First Json')),
                      ElevatedButton(
                        onPressed: () async {
                          var StringData = await network.firstApiSecondJson();
                        },
                        child: Text('First API Second Json'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () async {
                    var StringData = await network.secondApiJson();
                  },
                  child: Text('Second API Common Path'),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                    onPressed: () async {
                      var user = await network.thirdApiJson();
                    },
                    child: Text('All paths')),
                Expanded(
                  child: Card(
                    child: FutureBuilder(
                      future: network.firstApiFirstJson(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return Container(
                            child: Center(
                              child: Text("Loading"),
                            ),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, i) {
                              return ListTile(
                                title: Text(snapshot.data[i].name),
                                leading: Text(snapshot.data[i].id),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: FutureBuilder(
                      future: network.firstApiSecondJson(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return Container(
                            child: Center(
                              child: Text("Loading"),
                            ),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, i) {
                              return ListTile(
                                title: Text(snapshot.data[i].name),
                                leading: Text(snapshot.data[i].id),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: FutureBuilder(
                      future: network.secondApiJson(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return Container(
                            child: Center(
                              child: Text("Loading"),
                            ),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, i) {
                              return ListTile(
                                title: Text(snapshot.data[i].name),
                                leading: Text(snapshot.data[i].id),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: FutureBuilder(
                      future: network.thirdApiJson(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return Container(
                            child: Center(
                              child: Text("Loading"),
                            ),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, i) {
                              return ListTile(
                                title: Text(snapshot.data[i].name),
                                leading: Text(snapshot.data[i].id),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

























      
      //
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     final String name = nameController.text;
      //     int controllerIdText = int.parse(idController.text);
      //     final UserModell user = await network.createUser(controllerIdText, name);
      //     setState(() {
      //       _user1 = user;
      //     });
      //   },
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
      // // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// Container(
//   margin: EdgeInsets.only(bottom: 10),
//   child: ListTile(
//     leading: Container(
//       child: Center(
//         child: Text(_user2.id.toString(),
//             style: TextStyle(
//               fontSize: 18,
//             )),
//       ),
//       padding: EdgeInsets.all(0),
//       margin: EdgeInsets.symmetric(vertical: 12),
//       height: 35,
//       width: 35,
//       decoration: BoxDecoration(
//         color: Colors.blueAccent,
//         borderRadius: BorderRadius.circular(5),
//       ),
//     ),
//     onTap: () async {
//       final String name = nameController.text;
//       int controllerIdText = int.parse(idController.text);
//       final UserModell user =
//       await network.createUser(controllerIdText, name);
//       setState(() {
//         _user2 = user;
//         userName = user.name;
//       });
//     },
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(20),
//     ),
//     contentPadding:
//     EdgeInsets.symmetric(horizontal: 20, vertical: 1),
//     tileColor: Colors.black38,
//     title: Text(
//       "${_user2.name}",
//       style: TextStyle(
//         fontSize: 16,
//         color: Colors.black,
//         // decoration: todo.isDone ? TextDecoration.lineThrough : null,
//       ),
//     ),
//     trailing: Container(
//       padding: EdgeInsets.all(0),
//       margin: EdgeInsets.symmetric(vertical: 12),
//       height: 35,
//       width: 35,
//       decoration: BoxDecoration(
//         color: Colors.red,
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: IconButton(
//         color: Colors.white,
//         iconSize: 18,
//         icon: Icon(Icons.delete),
//         onPressed: () async {
//           print('Clicked on delete icon');
//           network.deleteUser(_user2.id);
//           setState(() {
//             _user2.name = "";
//             nameController.text = "";
//             idController.text = "";
//           });
//           //onDeleteItem(todo.id);
//         },
//       ),
//     ),
//   ),
// ),
//
// Container(
//   margin: EdgeInsets.only(bottom: 10),
//   child: ListTile(
//     leading: Container(
//       child: Center(
//         child: Text(_user3.id.toString(),
//             style: TextStyle(
//               fontSize: 18,
//             )),
//       ),
//       padding: EdgeInsets.all(0),
//       margin: EdgeInsets.symmetric(vertical: 12),
//       height: 35,
//       width: 35,
//       decoration: BoxDecoration(
//         color: Colors.blueAccent,
//         borderRadius: BorderRadius.circular(5),
//       ),
//     ),
//     onTap: () async {
//       final String name = nameController.text;
//       int controllerIdText = int.parse(idController.text);
//       final UserModell user =
//       await network.createUser(controllerIdText, name);
//       setState(() {
//         _user3 = user;
//         userName = user.name;
//       });
//     },
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(20),
//     ),
//     contentPadding:
//     EdgeInsets.symmetric(horizontal: 20, vertical: 1),
//     tileColor: Colors.black38,
//     title: Text(
//       "${_user3.name}",
//       style: TextStyle(
//         fontSize: 16,
//         color: Colors.black,
//         // decoration: todo.isDone ? TextDecoration.lineThrough : null,
//       ),
//     ),
//     trailing: Container(
//       padding: EdgeInsets.all(0),
//       margin: EdgeInsets.symmetric(vertical: 12),
//       height: 35,
//       width: 35,
//       decoration: BoxDecoration(
//         color: Colors.red,
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: IconButton(
//         color: Colors.white,
//         iconSize: 18,
//         icon: Icon(Icons.delete),
//         onPressed: () async {
//           print('Clicked on delete icon');
//           network.deleteUser(_user3.id);
//           setState(() {
//             _user3.id = null;
//             _user3.name = "";
//             idController.text = "";
//             nameController.text = "";
//           });
//           //onDeleteItem(todo.id);
//         },
//       ),
//     ),
//   ),
// ),

// Container(
//   margin: EdgeInsets.only(bottom: 10),
//   child: ListTile(
//     leading: Container(
//       child: Center(
//         child: Text(_user1.id.toString(),
//             style: TextStyle(
//               fontSize: 18,
//             )),
//       ),
//       padding: EdgeInsets.all(0),
//       margin: EdgeInsets.symmetric(vertical: 12),
//       height: 35,
//       width: 35,
//       decoration: BoxDecoration(
//         color: Colors.blueAccent,
//         borderRadius: BorderRadius.circular(5),
//       ),
//     ),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(20),
//     ),
//     contentPadding:
//     EdgeInsets.symmetric(horizontal: 20, vertical: 1),
//     tileColor: Colors.black38,
//     title: Text(
//       "${_user1.name}",
//       style: TextStyle(
//         fontSize: 16,
//         color: Colors.black,
//         // decoration: todo.isDone ? TextDecoration.lineThrough : null,
//       ),
//     ),
//     // trailing: Container(
//     //   padding: EdgeInsets.all(0),
//     //   margin: EdgeInsets.symmetric(vertical: 12),
//     //   height: 35,
//     //   width: 35,
//     //   decoration: BoxDecoration(
//     //     color: Colors.red,
//     //     borderRadius: BorderRadius.circular(5),
//     //   ),
//     //   child: IconButton(
//     //     color: Colors.white,
//     //     iconSize: 18,
//     //     icon: Icon(Icons.delete),
//     //     onPressed: () async {
//     //       print('Clicked on delete icon');
//     //       network.deleteUser(_user1.id);
//     //       setState(() {
//     //         _user1.id = null;
//     //         _user1.name = "";
//     //         nameController.text = "";
//     //         idController.text = "";
//     //       });
//     //       //onDeleteItem(todo.id);
//     //     },
//     //   ),
//     // ),
//   ),
// ),

// final TextEditingController nameController = TextEditingController();
// final TextEditingController idController = TextEditingController();
// String? userName = "";

// ElevatedButton(onPressed: () {
//   getUserDataNew();
// }, child: Text("click me")),

// Container(
//   padding: EdgeInsets.fromLTRB(32, 8, 32, 4),
//   child: Column(
//     children: <Widget>[
//       // Text("Click on the tile to add user"),
//       TextField(
//         controller: idController,
//       ),
//       TextField(
//         controller: nameController,
//       ),
//       SizedBox(
//         height: 7,
//       ),
//       //Text("The user ${userName} is created succesfully."),
//       SizedBox(
//         height: 100,
//       ),
//     ],
//   ),
// ),
// Expanded(
//   child: Card(
//     child: FutureBuilder(
//       future: network.getUserDataNew(),
//       builder: (context, snapshot) {
//         if (snapshot.data == null) {
//           return Container(
//             child: Center(
//               child: Text("Loading"),
//             ),
//           );
//         } else {
//           return ListView.builder(
//             itemCount: snapshot.data.length,
//             itemBuilder: (context, i) {
//               return ListTile(
//                 title: Text(snapshot.data[i].name),
//                 leading: Text(snapshot.data[i].id.toString()),
//               );
//             },
//           );
//         }
//       },
//     ),
//   ),
// ),

// ElevatedButton(
//     onPressed: () async {
//       // getData();
//       // getDataList();
//       // final String name = nameController.text;
//       // int controllerIdText = int.parse(idController.text);
//       // await network.getDataList();
//       await network.getUserDataNew();
//       // setState(() {
//       //   _userList = userList;
//       // });
//     },
//     child: Text("Press me to get data")),
