// import 'dart:convert';
//
// User userFromJson(String str) => User.fromJson(json.decode(str));
//
// String userToJson(User data) => json.encode(data.toJson());
//
// class User {
//   User({
//     this.path1,
//     this.path2,
//     this.path3,
//     this.path4,
//     this.path5,
//   });
//
//   String path1;
//   String path2;
//   String path3;
//   String path4;
//   String path5;
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//     path1: json["path1"],
//     path2: json["path2"],
//     path3: json["path1"],
//     path4: json["path1"],
//     path5: json["path1"],
//   );
//   Map<String, dynamic> toJson() => {
//     "path1": path1,
//     "path2": path2,
//     "path3": path3,
//     "path4": path4,
//     "path5": path5,
//
//   };
// }