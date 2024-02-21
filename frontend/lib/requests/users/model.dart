import 'package:therapease/utils/utils.dart';

class CreateUser {
  String? password;
  String? email;
  String? username;
  String? firstName;
  String? lastName;
  String? age;
  Gender? gender;
  List<String>? struggle;
  CreateUser({
    this.firstName,
    this.lastName,
    this.email,
    this.age,
    this.gender,
    this.password,
    this.struggle,
    this.username,
  });

  factory CreateUser.fromJson(Map<String, dynamic> data) {
    return CreateUser(
      password: data['password'],
      email: data['email'],
      username: data['username'],
      firstName: data['first_name'],
      lastName: data['last_name'],
      age: data['age'],
      gender: data['gender'] != null
          ? Gender.fromString(
              '${data['gender']}',
            )
          : null,
      struggle: data['struggle'] != null
          ? (data['struggle'] as List).map((e) => '$e').toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (username != null) 'username': username,
      if (age != null) 'age': age,
      if (gender != null) 'gender': '$gender',
      if (struggle != null) 'struggle': struggle,
    };
  }
}
