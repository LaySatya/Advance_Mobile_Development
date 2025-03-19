

import 'package:week_3_blabla_project/Week6/EX-1-START-CODE/models/course.dart';

abstract class CoursesRepository {
  List<Course> getCourses();

  void addScore(Course course, CourseScore score);
}