# Solace 🌿

A mental wellness Flutter application designed to help users manage stress, find inner peace, and improve their mental well-being.

## Features

- **AI Chatbot** — Powered by OpenAI GPT-3.5-turbo, provides a supportive conversational companion for mental health queries
- **Inspirational Quotes** — Curated motivational quotes fetched from an external API
- **Yoga & Meditation** — Browse yoga categories and pose guides to support mindfulness sessions
- **Google Sign-In** — Secure authentication via Firebase and Google

## Tech Stack

- **Framework:** Flutter (Dart)
- **Backend / Auth:** Firebase (Authentication, Cloud Firestore, Firebase Storage)
- **AI:** OpenAI API (GPT-3.5-turbo)
- **State Management:** Provider
- **Fonts:** Google Fonts (Poppins)

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) `>=2.19.3 <3.0.0`
- A Firebase project with Authentication and Firestore enabled
- An OpenAI API key

### Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/Manas-33/solace.git
   cd solace
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Add your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) from the Firebase console into the respective platform directories.

4. **Set your OpenAI API key**
   - Create `lib/controllers/secrets.dart` and define your key:
     ```dart
     const String openAIAPIKey = 'YOUR_OPENAI_API_KEY';
     ```

5. **Run the app**
   ```bash
   flutter run
   ```

## Design

Figma prototype: [View Design](https://www.figma.com/file/OX4uoHOkKJY5YZVXOBQ5P3/Solace?type=design&node-id=0%3A1&mode=design&t=vimJY1UbUalwslkB-1)

## Project Structure

```
lib/
├── apiService/         # External API integrations (quotes, yoga)
├── controllers/        # Business logic (OpenAI, Google Sign-In)
├── models/             # Data models (ChatMessage, Quote, YogaPose, etc.)
├── views/
│   └── screens/        # App screens (chat, login, quotes, yoga, etc.)
├── constants.dart      # App-wide constants and theme colours
└── main.dart           # Entry point
```
