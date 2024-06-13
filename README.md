# Specify Music App

Specify is a music app developed using Flutter Framework and Dart Programming Language, designed to provide users with a seamless music listening experience.

## Description

Specify features two bottom navigation tabs: “Home” and “Library.”

- **Home Screen**:
    - Search for music
    - View a list of songs
    - Direct navigation to the music player screen with controls and a love button to add songs to the library.
- **Library**:
    - Access favorite songs
    - Continue playing music in the background even when the app is closed.

## Features

- Search for music
- View song lists
- Play music with controls
- Add songs to favorites
- Background music playback

## Getting Started

### Dependencies

- **Programming Language**: Dart
- **Libraries/Frameworks**: Flutter
- **Development Tools:** Visual Studio Code
- **Operating System**: Minimum requirement to run this application is [**Android 6.0** (Marshmallow)](https://developer.android.com/tools/releases/platforms) (SDK 23).

## Requirements

- Any Operating System (macOS X, Linux, Windows)
- Any IDE with Flutter SDK installed (Android Studio, VS Code, etc.)

## Installing

### Visual Studio Code

1. **Clone the repository**:
    
    ```bash
    git clone <repository_url>
    
    ```
    
2. **Navigate to the project directory**:
    
    ```bash
    cd <project_directory>
    
    ```
    
3. **Install the dependencies**:
    
    ```bash
    flutter pub get
    
    ```
    
4. **Run the Emulator**:
    - Ensure you have an emulator set up in Android Studio or use a physical device.
    - Start the emulator from the terminal or Android Studio.
5. **Run the application**:
    
    ```bash
    flutter run
    
    ```
    

### Android Studio

1. **Clone the repository**:
    
    ```bash
    git clone <repository_url>
    
    ```
    
2. **Navigate to the project directory**:
    
    ```bash
    cd <project_directory>
    
    ```
    
3. **Open the project in Android Studio**:
    - Select "Open an Existing Project" and navigate to the project directory.
    - Alternatively, from the terminal within Android Studio:
        
        ```bash
        open -a "Android Studio" .
        
        ```
        
4. **Install the dependencies**:
    - Open the terminal in Android Studio and run:
        
        ```bash
        flutter pub get
        
        ```
        
5. **Run the Emulator**:
    - Ensure you have an emulator set up.
    - Start the emulator from the AVD Manager or use a physical device.
6. **Run the application**:
    - Click the 'Run' button in Android Studio (the green play button).
    - Alternatively, from the terminal:
        
        ```bash
        flutter run
        
        ```
        

## Additional Tips

- Ensure you have Flutter and Dart plugins installed in your IDE.
- Make sure your Flutter SDK path is correctly set in your IDE settings.
- If you encounter issues with dependencies, try running `flutter clean` followed by `flutter pub get`.

### Executing Program

Once the application is installed and running, users can explore the "Home" and "Library" tabs to search for music, play songs, and manage their favorite tracks. The app's background playback feature allows continuous music enjoyment even when the app is closed.
