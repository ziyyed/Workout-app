package com.workout.app.controller;

import com.workout.app.entity.Workout;
import com.workout.app.repository.WorkoutRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/workouts")
public class WorkoutController {

    private final WorkoutRepository workoutRepository;

    public WorkoutController(WorkoutRepository workoutRepository) {
        this.workoutRepository = workoutRepository;
    }

    @GetMapping
    public List<Workout> getAllWorkouts() {
        return workoutRepository.findAll();
    }

    @PostMapping
    public Workout createWorkout(@RequestBody Workout workout) {
        return workoutRepository.save(workout);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteWorkout(@PathVariable Long id) {
        if (!workoutRepository.existsById(id)) {
            return ResponseEntity.notFound().build();
        }
        workoutRepository.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
