class Workout {
  final int? id;
  final String name;
  final int sets;
  final int reps;

  Workout({
    this.id,
    required this.name,
    required this.sets,
    required this.reps,
  });

  factory Workout.fromJson(Map<String, dynamic> json) {
    return Workout(
      id: json['id'] as int?,
      name: json['name'] as String,
      sets: json['sets'] as int,
      reps: json['reps'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'sets': sets,
      'reps': reps,
    };
  }
}
