// import 'dart:convert';

// // ignore_for_file: public_member_api_docs, sort_constructors_first
// class User {
//   String email;
//   String password;
//   String phone;
//   String userName;
//   String token;
//   User({
//     required this.email,
//     required this.password,
//     required this.phone,
//     required this.userName,
//     required this.token,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'email': email,
//       'password': password,
//       'phone': phone,
//       'userName': userName,
//        'token': token,
//     };
//   }

//   factory User.fromMap(Map<String, dynamic> map) {
//     return User(
//       email: map['email'] as String,
//       password: map['password'] as String,
//       phone: map['phone'] as String,
//       userName: map['userName'] as String,
//       token: map['token'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
// }
