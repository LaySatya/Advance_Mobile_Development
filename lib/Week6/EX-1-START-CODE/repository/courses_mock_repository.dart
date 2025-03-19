import 'package:week_3_blabla_project/Week6/EX-1-START-CODE/models/course.dart';
import 'package:week_3_blabla_project/Week6/EX-1-START-CODE/repository/courses_repository.dart';

class CoursesMockRepository extends CoursesRepository {
  final List<Course> _courses = [
    Course(id:"c1", name: 'Math'),
    Course(id:"c2", name: 'Physic'),
    Course(id:"c3", name: 'Chemistry'),
  ];

  @override
  List<Course> getCourses() {
    return _courses;
  }

  @override
  void addScore(Course course, CourseScore score) {
    course.addScore(score);
  }
}
