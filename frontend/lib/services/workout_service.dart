import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/workout.dart';

class WorkoutService {
  static const String baseUrl = 'http://localhost:8080/api/workouts';

  Future<List<Workout>> getWorkouts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Workout.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load workouts: ${response.statusCode} - ${response.body}');
    }
  }

  Future<Workout> createWorkout(Workout workout) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(workout.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Workout.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create workout: ${response.statusCode} - ${response.body}');
    }
  }

  Future<void> deleteWorkout(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 204 && response.statusCode != 200) {
      throw Exception('Failed to delete workout: ${response.statusCode} - ${response.body}');
    }
  }
}
