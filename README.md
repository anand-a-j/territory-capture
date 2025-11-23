# Territory Capture App

A Flutter application for recording GPS paths, generating polygons, calculating area, and managing territories using Clean Architecture, Firebase, and GetX.

This project demonstrates industry-standard architecture, real-time location tracking, Firestore security, and professional coding practices.

## 📱 App Preview

<div align="center">
  <img src="assets/screenshots/screen1.jpg" width="250" />
  <img src="assets/screenshots/screen2.jpg" width="250" />
  <img src="assets/screenshots/screen3.jpg" width="250" />
</div>

## Features

- Live GPS tracking (1–3 meters accuracy)
- Polyline drawing & polygon generation
- Automatic area calculation
- Save and fetch territories
- Secure Firebase authentication (Google Sign-In)
- Firestore with strict user-based security rules
- Clean Architecture (Domain → Data → Presentation)
- GetX for state management & dependency injection
- Google Maps integration

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/anand-a-j/territory-capture.git
cd territory-capture
```

### 2. Install Dependencies

This project requires Flutter 3.35.1.

```bash
flutter pub get
```

## Firebase Setup (Short Version)

1. **Create a Firebase project:**
   - Visit https://console.firebase.google.com

2. **Add an Android app** with this package name:
   ```
   com.territorycapture.app
   ```

3. **Generate SHA keys:**
   ```bash
   ./gradlew signingReport
   ```

4. **Add SHA-1 and SHA-256** under:
   - Project Settings → Android App → SHA fingerprints

5. **Download `google-services.json`** and place it in:
   ```
   android/app/google-services.json
   ```

6. **Enable Firebase services:**
   - Authentication → Google Sign-In
   - Firestore Database → Production mode

7. **Add Firestore rules:**

```javascript
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
```

## Google Maps Setup (Short Version)

1. Go to [Google Cloud Console](https://console.cloud.google.com)

2. **Enable the following APIs:**
   - Maps SDK for Android
   - (Optional) Geocoding API

3. **Create an API key**

4. **Add to `AndroidManifest.xml`:**

```xml
<meta-data
  android:name="com.google.android.geo.API_KEY"
  android:value="YOUR_API_KEY"/>
```

## Architecture Notes (Clean Architecture + GetX)

This project follows Clean Architecture with strict separation of layers and responsibilities.

Each feature is isolated inside its own module (e.g., `features/auth`, `features/territory`), following a scalable, maintainable structure.

```
lib/
├── core/
│   ├── constants/
│   ├── theme/
│   ├── utils/
│   ├── components/
│   └── splash/
│   └── usecase/
│   └── extension/
│   └── errors/
│
├── routes/
│   ├── app_pages.dart
│   └── app_routes.dart
|
└── features/
    └── auth/
        ├── data/
        │   ├── datasources/
        │   │   └── auth_remote.dart
        │   ├── models/
        │   │   └── user_dto.dart
        │   └── repositories/
        │       └── auth_repo_impl.dart
        │
        ├── domain/
        │   ├── entities/
        │   │   └── user_entity.dart
        │   ├── repositories/
        │   │   └── auth_repo.dart
        │   └── usecases/
        │       └── google_sign_in_usecase.dart
        │
        └── presentation/
            ├── bindings/
            │   └── auth_binding.dart
            ├── controllers/
            │   └── auth_controller.dart
            ├── screens/
            │   └── sign_in_page.dart
            └── widgets/
                └── sign_in_button.dart
```

## Why GetX?

- Clean dependency injection (Bindings)
- Lightweight state management
- Simple route management
- Great for feature-based clean architecture
- Zero boilerplate

## Benefits of This Architecture

- Scalable for large production apps
- Easy to test business logic
- UI fully separated from Firebase
- Clear boundaries between layers
- Each feature is isolated and modular

## License

MIT License - feel free to use this project for learning and production.

## Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.



