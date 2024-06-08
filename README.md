# Animal Zoo Flutter App

This Flutter app identifies animals using a pre-trained TensorFlow Lite model. This document details the necessary updates and changes made to the project for implementing camera functionality and ensuring compatibility with Android 12.

## Prerequisites

- Flutter SDK
- Android Studio or Visual Studio Code
- Dart SDK
- TensorFlow Lite model and labels file (`model_unquant.tflite`, `labels.txt`)

## Project Structure

- `lib/main.dart`: Main application code.
- `android/app/src/main/AndroidManifest.xml`: Android configuration.
- `android/app/src/main/java/com/example/animal_zoo/MainActivity.java`: MainActivity for Android embedding.
- `ios/Runner/Info.plist`: iOS configuration.
- `pubspec.yaml`: Flutter dependencies and assets.

## Changes and Updates

### 1. Flutter Dependencies

Ensure the following dependencies are added in `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  tflite: any
  image_picker: ^1.1.2

flutter:
  uses-material-design: true

  assets:
    - assets/model_unquant.tflite
    - assets/labels.txt
