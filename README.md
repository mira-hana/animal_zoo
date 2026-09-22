**🐾 Zoo Animal Identifier**

A Flutter mobile application for identifying zoo animals from images using a TensorFlow Lite image classification model.

The application allows users to either take a photo using their phone's camera or select an image from their gallery. The trained machine learning model then analyses the image and displays the predicted animal.

This project combines machine learning, mobile application development, and image classification into a practical user-facing application. The project was developed as a group project, with the model trained using an animal image dataset and subsequently integrated into a Flutter application.

*Video Demo*

https://youtube.com/shorts/4j9L2KxXOfo 

*✨ Key Features*

📷 Camera Classification – Take a photo of an animal and receive a prediction.

🖼️ Gallery Classification – Select an existing animal image from the device.

🤖 TensorFlow Lite Model – Uses a trained .tflite image classification model for on-device prediction.

🐘 Animal Recognition – Classifies images into the animal categories supported by the trained model.

📱 Mobile Application – Built with Flutter for Android.

🧠 Machine Learning

The project uses a pre-trained TensorFlow Lite image classification model integrated directly into the Flutter application.

*Model Development*

The model development process included:

1. Dataset acquisition from the Kaggle Animal Image Dataset.

2. Creating image classes for the selected animal categories.

3. Training and testing the image classification model.

4. Converting/downloading the trained model into TensorFlow Lite format.

5. Integrating the .tflite model and labels.txt into the Flutter application.

The dataset was divided into 70% training data and 30% testing data during the project development.

*📱 Application Workflow*

User

  ↓

Take Photo / Select Image

  ↓

Flutter Application

  ↓

TensorFlow Lite Model

  ↓

Image Classification

  ↓

Predicted Animal

For example:

Input: Image of a lion

Output: Lion

The application was tested using animal images such as lions and orangutans, with the classification result displayed directly in the mobile interface.

*🛠️ Technologies Used*

| Category              | Technology                          |
|-----------------------|-------------------------------------|
| Mobile Development    | Flutter                             |
| Programming Language  | Dart                                |
| Machine Learning      | TensorFlow Lite                     |
| Model Type            | Image Classification                |
| Image Input           | Camera / Gallery                    |
| Development Tools     | Android Studio / Visual Studio Code |

*⚙️ Setup*

Prerequisites
Flutter SDK
Dart SDK
Android Studio or Visual Studio Code
TensorFlow Lite model
labels.txt
Flutter Dependencies
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
Running the Project
Clone this repository.
Place model_unquant.tflite and labels.txt inside the assets/ folder.
Install the Flutter dependencies.
Configure the Android and iOS permissions for camera/image access.
Run the application on an Android device or emulator.

*📊 Project Outcome*

The completed application provides a simple interface for real-time animal identification from images. Users can provide an image through the camera or gallery, while the TensorFlow Lite model performs the classification and displays the predicted animal.

The project demonstrates the integration of a machine learning model into a functional mobile application, rather than using the model only as an offline classification experiment.

*👥 Group Project*

Developed as a collaborative university project involving:

- Machine learning model development
- Dataset preparation
- Flutter application development
- TensorFlow Lite model integration
- Application testing and evaluation
