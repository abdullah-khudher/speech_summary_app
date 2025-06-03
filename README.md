# Speech Summary  
![Flutter CI](https://github.com/abdullah-khudher/speech_summary_app/actions/workflows/flutter_ci.yml/badge.svg)
🎙️ A Flutter voice-to-summary app powered by OpenAI

Speech Summary is a Flutter application that transcribes live speech and uses OpenAI's GPT API to generate concise summaries.  
Ideal for meetings, spontaneous ideas, or simplifying long speech into focused insights.

![GitHub stars](https://img.shields.io/github/stars/abdullah-khudher/speech_summary_app)
![GitHub forks](https://img.shields.io/github/forks/abdullah-khudher/speech_summary_app)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
---

## 📚 Table of Contents
- [Features](#-features)
- [Tech Stack](#-tech-stack)
- [Screenshots](#-screenshots)
- [Getting Started](#-getting-started)
- [Fake Summary Mode](#-fake-summary-mode)
- [TODOs](#-todos--future-improvements)
- [Tests](#-running-tests)
- [Contributions](#-contributions)
- [License](#-license)
- [Author](#-author)

---

## 📱 Features

- 🎤 Live speech-to-text transcription
- 🤖 AI-powered summarization via OpenAI
- 🔐 Mic permission management
- 🧪 Fake Summary mode for testing without API keys
- 🧼 Clean Architecture with modular layers
- 🌐 Built-in `.env` support for secure API key storage

---

## 🛠️ Tech Stack

- **Flutter & Dart**
- **BLoC** for state management
- **Clean Architecture** pattern
- **OpenAI GPT-3.5** via `dart_openai`
- **Speech-to-Text** via `speech_to_text`
- **Microphone permissions** via `permission_handler`
- **HTTP networking** with `Dio`
- **Environment config** via `flutter_dotenv`
- **Dependency Injection** with `get_it`
- **Functional programming** with `dartz`

---

## 📸 Screenshots

| Recording | Summary |
|-----------|---------|

[//]: # (| ![Recording]&#40;screenshots/recording.png&#41; | ![Summary]&#40;screenshots/summary.png&#41; |)

> You can add your own screenshots inside a `/screenshots` folder and update these paths accordingly.

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK
- A physical Android or iOS device (for mic access)

### 1. Clone the Repository
```bash
git clone https://github.com/abdullah-khudher/speech_summary_app.git
cd speech_summary_app
```

### 2. Add API Keys
Create a `.env` file in the root directory:
```env
OPENAIAPIKEY=your_openai_api_key_here
BASEURL=https://api.openai.com/v1/
```

✅ `.env` is already in `.gitignore`.

### 3. Install Dependencies
```bash
flutter pub get
```

### 4. Run the App
```bash
flutter run
```

📱 **Note:** Use a real device to test microphone functionality.

---

## 🧪 Fake Summary Mode

If you want to preview the UI or demo the app without an API key:

1. Click on **Test Fake Summary** button.
2. It will show a fake input text and its corresponding fake summary.
3. Useful for demos or UI tests.

---

## ✅ TODOs & Future Improvements

- [ ] 🌐 Support transcription in multiple languages
- [ ] 📤 Add sharing and export options for summaries
- [ ] 📴 Implement offline speech recognition fallback
- [ ] 🔊 Add text-to-speech for generated summaries
- [ ] ✂️ Automatic segmentation of long speech input
- [ ] 💬 Show real-time transcription confidence levels

---

## 🧪 Running Tests

Basic unit tests can be found in `/test/`. To run them:
```bash
flutter test
```

---

## 🤝 Contributions

Pull requests are welcome. For major changes, please open an issue first.

---

## 📄 License

This project is licensed under the MIT License. See the LICENSE file for details.

---

## 🧠 Author

**Abdullah Khudher**  
[GitHub Profile](https://github.com/abdullah-khudher)