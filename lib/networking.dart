import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:todo_app/user_model_list.dart';
import 'user_item.dart';
import 'user_model2.dart';
import 'dart:convert';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class Networking {
  int length = 0;

  Future<String> loadAsset(String fileName) async {
    String dataString = await rootBundle.loadString('assests/$fileName.txt');
    return dataString;
  }

  Future firstApiFirstJson() async {
    var uri = Uri.parse('http://192.168.0.109:8080/json1');
    var data = await loadAsset("jsonFile");
    //encode Map to JSON
    //   var body = json.encode(data);

    var response = await http.post(uri,
        headers: {"Content-Type": "application/json"}, body: data);
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    print(response.statusCode);
    List<PathData> paths = [];
    print(paths.length);

    print(paths.length);
    PathData path = PathData("Paths of First State Diagram", response.body);
    print(paths.length);
    paths.add(path);

    length = paths.length;
    print(paths.length);
    return paths;
  }

  Future firstApiSecondJson() async {
    var uri = Uri.parse('http://192.168.0.109:8080/json1');
    String data = await loadAsset("jsonFileTwo");

    var response = await http.post(uri,
        headers: {"Content-Type": "application/json"}, body: data);
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    print(response.statusCode);
    List<PathData> paths = [];
    print(paths.length);

    print(paths.length);
    PathData path = PathData("Paths of Second State Diagram", response.body);
    print(paths.length);
    paths.add(path);

    length = paths.length;
    print(paths.length);
    return paths;
  }

  Future secondApiJson() async {
    var uri = Uri.parse('http://192.168.0.109:8080/common');
    var data = await loadAsset("jsonMerged");

    var response = await http.post(uri,
        headers: {"Content-Type": "application/json"}, body: data);
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    print(response.statusCode);
    List<PathData> paths = [];
    print(paths.length);

    print(paths.length);
    PathData path = PathData("=>", response.body);
    print(paths.length);
    paths.add(path);

    length = paths.length;
    print(paths.length);
    return paths;
  }

  Future thirdApiJson() async {
    var uri = Uri.parse('http://192.168.0.109:8080/all');
    var data = await loadAsset("jsonMerged");

    var response = await http.post(uri,
        headers: {"Content-Type": "application/json"}, body: data);
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    print(response.statusCode);
    List<PathData> paths = [];
    print(paths.length);

    print(paths.length);
    PathData path = PathData("All paths are", response.body);
    print(paths.length);
    paths.add(path);

    length = paths.length;
    print(paths.length);
    return paths;
  }
}

class PathData {
  final String id;
  final String name;

  PathData(this.id, this.name);
}


































// Future<User> userData(String title) async {
//   final http.Response response = await http.post(
//     'https://jsonplaceholder.typicode.com/albums',
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'title': title,
//     }),
//   );

// Future<UserModell> deleteUser(int? id) async {
//   // final String apiUrl='http://192.168.0.100:8090/todoAddd';
//   var uri = Uri.parse('http://192.168.0.107:8080/user/$id');
//   //final response = await http.delete(uri, body: {"name": name});
//   final response = await http.delete(uri);
//   // final response =await http.post(apiUrl,body:{"name":name});
//
//   print(response);
//   print(response.body);
//   final String responseString = response.body;
//   print(response.statusCode);
//   // print(responseString);
//   // print(userModelFromJson(responseString));
//   return userModelFromJson(responseString);
//   //return responseString;
// }
//
// Future getData() async {
//   var uri = Uri.http('192.168.0.107:8080', 'user');
//   final response = await http.get(uri);
//   print(response.body);
//   print(response.statusCode);
//
//   final String responseString = response.body;
//   UserModell userModelListt = userModelFromJson(responseString);
//   // print(userModelListt);
//   // return responseString;
//   print(userModelFromJson(responseString));
//   return userModelFromJson(responseString);
// }
//
// Future getDataList() async {
//   var uri = Uri.http('192.168.0.107:8080', 'user');
//   final response = await http.get(uri);
//   print(response.body);
//   final String responseString = response.body;
//   print(userModelListFromJson(responseString));
//   print(json.decode(response.body));
//   print(response.statusCode);
//   var jsonData = json.decode(response.body);
//   return (json.decode(response.body));
//   //return userModelListFromJson(responseString);
//
//   //return responseString;
// }
//
// Future getResponseCode() async {
//   var uri = Uri.http('192.168.0.107:8080', 'user');
//   final response = await http.get(uri);
//   print(response.body);
//   final String responseString = response.body;
//   print(userModelListFromJson(responseString));
//   print(json.decode(response.body));
//   print(response.statusCode);
//   var jsonData = json.decode(response.body);
//   return response.statusCode;
//   //return(json.decode(response.body));
//   //return userModelListFromJson(responseString);
//
//   //return responseString;
// }
//
// Future getUserDataNew() async {
//   var uri = Uri.http('192.168.0.107:8080', 'user');
//   var response = await http.get(uri);
//   var jsonData = jsonDecode(response.body);
//   List<UserData> userss = [];
//
//   for (var u in jsonData) {
//     UserData userr = UserData(u["id"], u["name"]);
//     userss.add(userr);
//   }
//   length = userss.length;
//   print(userss.length);
//   return userss;
// }
//
// Future getUserDataNeww() async {
//   var uri = Uri.http('192.168.0.107:8080', 'user');
//   var response = await http.get(uri);
//   var jsonData = jsonDecode(response.body);
//   // List<UserData> userss = [];
//   return jsonData;
// }
//
// Future createUserNew(int id, String name) async {
//   // final String apiUrl='http://192.168.0.100:8090/todoAddd';
//   String stringId = id.toString();
//   var uri = Uri.parse('http://192.168.0.104:8080/user');
//   var response = await http.post(uri, body: {
//     "id": stringId,
//     "name": name,
//   });
//   var jsonData = jsonDecode(response.body);
//   UserData userr = UserData(jsonData["id"], jsonData["name"]);
//   userss.add(userr);
//
//   return jsonData;
// }

//   List listResponse;
//
//   Future createUserxyz() async {
//     http.Response = await http
//         .post('http://192.168.0.109:8080/json1');
//     if (response.statusCode == 200)
//       setState(() {
//         listResponse = json.decode(response.body);
//       });
//   }
// }
// @override
// void initState() {
//   createUserxyz()
//   super.initState();
// }

//   Future createUserxyz() async {
//     var uri = Uri.parse('http://192.168.0.109:8080/json2');
//     var data = await loadAsset("jsonFile");
//
//     //encode Map to JSON
//     //   var body = json.encode(data);
//
//     var response = await http.post(uri,
//         headers: {"Content-Type": "application/json"}, body: data
//
//       //   //   var data = response.body;
//       // print(data);
//
//     );
//     // String responseBody = response.body;
//     // print(responseBody);
//
//     print(response);
//     print(response.body);
//     final String responseString = response.body;
//     print(response.statusCode);
//     print(responseString);
// // return response.body;
//     //print(userModelFromJson(responseString));
//     //return userModelFromJson(responseString);
//   }

//encode Map to JSON
//   var body = json.encode(data);
