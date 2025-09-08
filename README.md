# mental_wellness_app

A comprehensive mental wellness application designed to help users track their mental health, practice mindfulness, and access emergency support resources.

Features
🎯 Core Functionality
Journaling: Daily thought recording with timestamp tracking

Mood Tracking: Emotional state monitoring with intensity levels

Self-Care Activities: Wellness activity logging with categories

Peer Support: Community chat functionality

Mental Health Tips: Curated wellness advice and resources

🧘‍♂️ Meditation & Mindfulness
Guided breathing exercises (5-20 minute sessions)

Body scan meditation

Mindfulness practices

Sleep meditation routines

Interactive audio player with progress tracking

🆘 Emergency Features
University counseling hotline access

Crisis text line integration

National suicide prevention lifeline

Campus security direct dial

One-tap emergency calling

Screenshots
<img width="230" height="483" alt="image" src="https://github.com/user-attachments/assets/6f10cc6f-d42d-4f6f-bd96-ec73aa863f28" />

<img width="231" height="502" alt="image" src="https://github.com/user-attachments/assets/ba3727e9-22ca-499c-9708-43d5a3fe0f1f" />

Dashboard with quick access to all wellness tools

<img width="228" height="489" alt="image" src="https://github.com/user-attachments/assets/9da1ffb0-b948-4f93-8971-9e6bea0ba47e" />

Daily journaling interface with rich text editing


<img width="229" height="493" alt="image" src="https://github.com/user-attachments/assets/4a2e9cb5-e3ae-444c-9e00-a7b8a53f93cf" />

Guided meditation player with multiple exercise options
<img width="217" height="491" alt="image" src="https://github.com/user-attachments/assets/7f522573-017e-42e1-a789-c2222ee66569" />

Emergency contact interface with one-tap calling

Technology Stack
Frontend
Flutter 3.32.6 - Cross-platform framework

Dart 3.8.1 - Programming language

Material Design 3 - UI/UX design system

State Management
Riverpod 2.6.1 - State management solution

Hive 2.2.3 - Local database

Shared Preferences - Local storage

Backend Services
Firebase Authentication - User management

Cloud Firestore - Real-time database

Firebase Realtime Database - Data synchronization

Additional Packages
audioplayers - Audio playback for meditation

url_launcher - Emergency call functionality

intl - Internationalization and formatting

google_fonts - Typography styling

Installation
Prerequisites
Flutter SDK 3.32.6 or higher

Dart 3.8.1 or higher

Android Studio/Xcode (for mobile development)

Firebase project setup

Setup Steps
Clone the repository

bash
git clone https://github.com/yourusername/mental_wellness_app.git
cd mental_wellness_app
Install dependencies

bash
flutter pub get
Configure Firebase

Create a new Firebase project

Enable Authentication, Firestore, and Realtime Database

Download google-services.json (Android) and GoogleService-Info.plist (iOS)

Place them in the appropriate directories

Run the application

bash
flutter run
Project Structure
text
lib/
├── main.dart                 # Application entry point
├── models/                  # Data models
│   ├── journal_entry.dart
│   ├── mood_entry.dart
│   ├── self_care_entry.dart
│   └── peer_message.dart
├── providers/               # State management
│   ├── auth_provider.dart
│   ├── journal_provider.dart
│   ├── mood_provider.dart
│   ├── theme_provider.dart
│   └── meditation_provider.dart
├── screens/                 # UI screens
│   ├── home_screen.dart
│   ├── journal_screen.dart
│   ├── meditation_screen.dart
│   ├── emergency_screen.dart
│   └── self_care_screen.dart
└── widgets/                 # Reusable components
    └── entry_card.dart
Key Features Implementation
Authentication System
dart
// Firebase Auth integration with Riverpod
final authProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});
Local Data Persistence
dart
// Hive database setup for offline functionality
await Hive.initFlutter();
Hive.registerAdapter(JournalEntryAdapter());
await Hive.openBox<JournalEntry>('journalBox');
Meditation Player
dart
// Audio player with state management
final AudioPlayer _audioPlayer = AudioPlayer();
_audioPlayer.onPlayerStateChanged.listen((state) {
  setState(() => _playerState = state);
});
Firebase Configuration
Security Rules
json
{
  "rules": {
    "moods": {
      ".read": "auth != null",
      ".write": "auth != null"
    },
    "journal": {
      ".read": "auth != null", 
      ".write": "auth != null"
    }
  }
}
Required Firebase Services
Authentication (Email/Password)

Firestore Database

Realtime Database

Storage (for future audio files)

Development Guidelines
Code Style
Follow Dart style guide

Use meaningful variable names

Add comments for complex logic

Maintain consistent formatting

State Management
Use Riverpod for global state

Local state for UI components

Efficient rebuild optimization

Testing
bash
# Run tests
flutter test

# Run with coverage
flutter test --coverage
#Future Enhancements

Push notifications for daily reminders

Social features for community support

Advanced analytics and insights

Multi-language support

Export functionality for journal entries

Contributing
Fork the repository

Create a feature branch (git checkout -b feature/amazing-feature)

Commit changes (git commit -m 'Add amazing feature')

Push to branch (git push origin feature/amazing-feature)

Open a Pull Request

Support
For support and questions:

📧 Email: support@mentalwellnessapp.com

🐛 Issues: GitHub Issues page

💬 Discussions: GitHub Discussions

License
This project is licensed under the MIT License - see the LICENSE.md file for details.

Acknowledgments
Flutter team for the amazing framework

Firebase for backend services

Mental health organizations for resource guidance

Open-source community for packages and support

Remember: This app is designed to support mental wellness but is not a replacement for professional medical advice. If you're experiencing a mental health emergency, please contact emergency services immediately.


