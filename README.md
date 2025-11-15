# Territory Capture App

A Flutter application for recording GPS paths, generating polygons, calculating area, and managing territories using Clean Architecture, Firebase, and GetX.

This project demonstrates industry-standard architecture, real-time location tracking, Firestore security, and professional coding practices.

# Features
- Live GPS tracking (1–3 meters accuracy)
- Polyline drawing & polygon generation
- Automatic area calculation
- Save and fetch territories
- Secure Firebase authentication (Google Sign-In)
- Firestore with strict user-based security rules
- Clean Architecture (Domain → Data → Presentation)
- GetX for state management & dependency injection
- Google Maps integration

# Setup Instructions

1. Clone the Repository
git clone https://github.com/anand-a-j/territory-capture.git
cd territory-capture

2. Install Dependencies
This project requires Flutter 3.35.1.
flutter pub get

# Firebase Setup (Short Version)

Create a Firebase project:
https://console.firebase.google.com

Add an Android app with this package name:

com.territorycapture.app

Generate SHA keys:
./gradlew signingReport


Add SHA-1 and SHA-256 under
Project Settings → Android App → SHA fingerprints.

Download google-services.json and place it in:
android/app/google-services.json


Enable Firebase services:
Authentication → Google Sign-In
Firestore Database → Production mode

Add Firestore rules:
rules_version = '3';
service cloud.firestore {
  match /databases/{database}/documents {
    match /territories/{id} {
      allow create: if request.auth != null
        && request.auth.uid == request.resource.data.userId;
      allow read, write: if request.auth != null
        && request.auth.uid == resource.data.userId;
    }
  }
}

# Google Maps Setup (Short Version)

Go to Google Cloud Console
Enable the following APIs:
Maps SDK for Android
(Optional) Geocoding API
Create an API key
Add to AndroidManifest.xml:

<meta-data
  android:name="com.google.android.geo.API_KEY"
  android:value="YOUR_API_KEY"/>


# Architecture Notes (Clean Architecture + GetX)

This project follows Clean Architecture with strict separation of layers and responsibilities.
Each feature is isolated inside its own module (ex: features/auth, features/territory), following a scalable, maintainable structure.

lib/
 └── features/
      └── auth/
           ├── data/
           │    ├── datasources/
           │    │     └── auth_remote.dart
           │    ├── models/
           │    │     └── user_dto.dart
           │    └── repositories/
           │          └── auth_repo_impl.dart
           │
           ├── domain/
           │    ├── entities/
           │    │     └── user_entity.dart
           │    ├── repositories/
           │    │     └── auth_repo.dart
           │    └── usecases/
           │          └── google_sign_in_usecase.dart
           │
           └── presentation/
                ├── bindings/
                │     └── auth_binding.dart
                ├── controllers/
                │     └── auth_controller.dart
                ├── screens/
                │     └── sign_in_page.dart
                └── widgets/
                      └── sign_in_button.dart


# Why GetX?

- Clean dependency injection (Bindings)
- Lightweight state management
- Simple route management
- Great for feature-based clean architecture
- Zero boilerplate
 
# Benefits of This Architecture

- Scalable for large production apps
- Easy to test business logic
- UI fully separated from Firebase
- Clear boundaries between layers
- Each feature is isolated and modular




