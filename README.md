# 🤖chatbotappchuba

A Flutter-based AI chatbot assistant powered by Google Gemini API.

## 🚀 Features

- 💬 Conversational AI powered by Gemini
- 📱 Cross-platform Flutter UI (Android/iOS)
- 🌐 Real-time intelligent responses
- 🧠 Optional session memory/context tracking
- 🔒 Secure API integration using environment configuration

## 🧰 Tech Stack

- Flutter (Dart)
- Google Gemini API
- State Management (Provider / Riverpod / Bloc — customizable)
- Optional: Firebase, SQLite, SharedPreferences

## Getting Started

This project is a starting point for a Gemini-powered Flutter chatbot.

### 📦 Installation

```bash
git clone https://github.com/yourusername/chatbotappchuba.git
cd chatbotappchuba
flutter pub get
```

### 🔐 Configure Gemini API

Create a new file `lib/secrets.dart`:

```dart
const String GEMINI_API_KEY = "your_gemini_api_key";
```

> ✅ Tip: Use `flutter_dotenv` for better security in production.

### ▶️ Run the App

```bash
flutter run
```

## 📱 Screenshots

> Add screenshots in the `screenshots/` directory and display here:

- Chat screen
- Gemini response view

## 📚 Resources

- [Gemini API Documentation](https://ai.google.dev/)

## 🧠 How It Works

1. User sends input via chat UI.
2. App sends request to Gemini API.
3. Gemini processes and returns a response.
4. Response is displayed in the chat window.

## 🔮 Future Improvements

- [ ] Voice input/output
- [ ] Persistent memory storage
- [ ] Authentication & user profiles
- [ ] Light/dark themes
- [ ] Custom AI personalities or tools

## 📄 License

This project is licensed under the MIT License.

## 🙏 Acknowledgements

- [Google Gemini API](https://ai.google.dev/)
- Flutter Community

