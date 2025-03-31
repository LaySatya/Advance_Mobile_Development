import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

void main() async {

  //  firebase api url
  const String baseUrl = 'https://week-8-practice-bb264-default-rtdb.asia-southeast1.firebasedatabase.app';

  // collection name data in firebase
  const String students = "students";
  
  // custom the api url to get all students
  const String allStudent = '$baseUrl/$students.json';

  Uri uri = Uri.parse(allStudent);
  final http.Response response = await http.get(uri);

  if (response.statusCode != HttpStatus.ok && response.statusCode != HttpStatus.created) {
    throw Exception('Failed to load');
  }

  final data = json.decode(response.body) as Map<String, dynamic>?;


  List<Student> result = [];
  if (data != null) {
    result = data.entries.map((entry) => StudentDto.fromJson(entry.key, entry.value)).toList();
  }

  // for(int i = 0 ; i < result.length ; i++){
  //   print("ID: ${result[i].id} Name: ${result[i].name} Age: ${result[i].age}");
  // }
}

class StudentDto {
  static Student fromJson(String id, Map<String, dynamic> json) {
    return Student(id: id, age: json['age'], name: json['name']);
  }
}

class Student {
  final String id;
  final int age;
  final String name;

  Student({required this.id, required this.age, required this.name});

  @override
  String toString(){
    return "ID: $id, Name: $name, Age: $age";
  }
}