# Workout App

A monorepo containing a Spring Boot backend and Flutter frontend for managing workouts.

## Project Structure

```
├── backend/          # Spring Boot REST API
│   └── src/
│       └── main/
│           ├── java/com/workout/app/
│           │   ├── entity/         # Workout entity
│           │   ├── repository/     # JPA repository
│           │   ├── controller/     # REST controller
│           │   └── config/         # CORS configuration
│           └── resources/
│               └── application.properties
└── frontend/         # Flutter mobile app
    └── lib/
        ├── models/       # Workout model
        ├── services/     # API service
        └── screens/      # UI screens
```

## Backend (Spring Boot)

The backend is a Spring Boot application with:
- **H2 Database**: In-memory database for development
- **JPA**: For data persistence
- **REST API**: CRUD operations for workouts

### API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/workouts` | Get all workouts |
| POST | `/api/workouts` | Create a new workout |
| DELETE | `/api/workouts/{id}` | Delete a workout |

### Workout Entity

```json
{
  "id": 1,
  "name": "Push-ups",
  "sets": 3,
  "reps": 15
}
```

### Running the Backend

```bash
cd backend
mvn spring-boot:run
```

The server will start on `http://localhost:8080`.

You can also access the H2 console at `http://localhost:8080/h2-console` with:
- JDBC URL: `jdbc:h2:mem:workoutdb`
- Username: `sa`
- Password: (empty)

## Frontend (Flutter)

The frontend is a Flutter application that:
- Displays workouts in a ListView
- Allows adding new workouts via a dialog
- Allows deleting workouts
- Fetches data from the backend API

### Running the Frontend

1. Install Flutter SDK (https://flutter.dev/docs/get-started/install)

2. Install dependencies:
```bash
cd frontend
flutter pub get
```

3. Run the app:
```bash
flutter run
```

For web:
```bash
flutter run -d chrome
```

**Note**: Make sure the backend is running before starting the frontend.

## Development

### Prerequisites

- Java 17 or higher
- Maven 3.6+
- Flutter SDK 3.0+

### Quick Start

1. Start the backend:
```bash
cd backend
mvn spring-boot:run
```

2. In a new terminal, start the frontend:
```bash
cd frontend
flutter pub get
flutter run
```

## Features

- ✅ Create workouts with name, sets, and reps
- ✅ View all workouts in a list
- ✅ Delete workouts
- ✅ Pull-to-refresh on the workout list
- ✅ CORS enabled for cross-origin requests