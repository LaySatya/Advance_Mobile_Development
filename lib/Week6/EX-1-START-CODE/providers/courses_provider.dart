import 'package:flutter/material.dart';
import '../models/course.dart';
import '../repository/courses_repository.dart';

class CoursesProvider extends ChangeNotifier {
  final CoursesRepository _repository;
  List<Course> _courses = [];

  CoursesProvider({required CoursesRepository repository}) : _repository = repository {
    fetchCourses();
  }

  List<Course> get courses => _courses;

  /// Fetches courses from the repository asynchronously.
  Future<void> fetchCourses() async {
    try {
      _courses = await _repository.getCourses();
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching courses: $e');
    }
  }

  Course getCourseFor(String courseId) {
    try {
      return _courses.firstWhere((course) => course.id == courseId);
    } catch (_) {
      throw Exception('Course "$courseId" not found');
    }
  }

  /// Adds a score to the specified course.
  void addScore(String courseId, CourseScore score) {
    try {
      Course course = getCourseFor(courseId);
      course.scores.add(score);
      notifyListeners();
    } catch (e) {
      debugPrint('Error adding score: $e');
    }
  }
}
