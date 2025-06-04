# 🧠 Speech Summary – Live Voice-to-Text Summarizer Powered by OpenAI
![Flutter CI](https://github.com/abdullah-khudher/speech_summary_app/actions/workflows/flutter_ci.yml/badge.svg)

🎙️Speech Summary is a Flutter application that transcribes live speech and uses OpenAI's GPT API to generate concise summaries.  
Ideal for meetings, spontaneous ideas, or simplifying long speeches into focused insights.

![GitHub stars](https://img.shields.io/github/stars/abdullah-khudher/speech_summary_app)
![GitHub forks](https://img.shields.io/github/forks/abdullah-khudher/speech_summary_app)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
---

## 📚 Table of Contents
- [Features](#-features)
- [Tech Stack](#-tech-stack)
- [Screenshots](#-demo-preview)
- [Fake Summary Mode](#-fake-summary-mode)
- [Getting Started](#-getting-started)
- [Tests](#-running-tests)
- [TODOs](#-todos--future-improvements)
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
- 🧘 Ideal for meetings, lectures, spontaneous ideas, or simplifying long speeches

---

## 🧰 Tech Stack

- **Flutter & Dart**
- **BLoC** for state management
- **Clean Architecture** pattern
- **Speech-to-Text** via `speech_to_text`
- **Microphone permissions** via `permission_handler`
- **HTTP networking** with `Dio`
- **Environment config** via `flutter_dotenv`
- **Dependency Injection** with `get_it`
- **Functional programming** with `dartz`

---

## 🎥 Demo Preview
Below are short demos showcasing the app's core functionality and UI behavior.

### 🎙️ From Recording to Summary
Watch how the app records live speech, then generates a smart summary using OpenAI.

<img src="screenshots/record_and_summarize.gif" width="250" alt="GIF showing real-time speech recording and summarization"/>


### 🧪 Fake Summary Mode
This mode allows you to demo the app without an API key.  
Clicking **Test Fake Summary** will show a mock input and summary — ideal for UI tests or presentations.

> This feature is also demonstrated in the demo preview below.

<img src="screenshots/fake_summary.gif" width="250" alt="GIF showing Fake Summary mode being triggered for demo or testing"/>


---

## 🌐 Live Demo & CI/CD

This project uses full CI/CD automation:

- ✅ **CI**: Static code analysis and tests via [GitHub Actions](https://github.com/abdullah-khudher/speech_summary_app/actions/workflows/flutter_ci.yml)
- 🚀 **CD**: Automatic deployment of the web version to GitHub Pages after every push to `main`

👉 **Try the live web version here**:  
[https://abdullah-khudher.github.io/speech_summary_app/](https://abdullah-khudher.github.io/speech_summary_app/)

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

## 🧪 Running Tests

The project includes comprehensive testing to ensure app stability:

- ✅ **Unit & Widget Tests**  
  Located under `/test/`  
  Run using:
```bash
flutter test
```

- ✅ **Integration Tests**
  Located under `/integration_test/` – these simulate full user flows.
  Run using:
```bash
flutter test integration_test/
```
ℹ️ Integration tests may require a real device or emulator, and proper setup of the integration_test package.

---

## ✅ TODOs & Future Improvements

- [ ] 🌐 Support transcription in multiple languages
- [ ] 📤 Add sharing and export options for summaries
- [ ] 📴 Implement offline speech recognition fallback
- [ ] 🔊 Add text-to-speech for generated summaries
- [ ] ✂️ Automatic segmentation of long speech input
- [ ] 💬 Show real-time transcription confidence levels

---

## 🤝 Contributions

Pull requests are welcome. For major changes, please open an issue first.

---

## 📄 License

This project is licensed under the MIT License. See the LICENSE file for details.

---
```markdown
## 👨‍💻 Development Notes

This project was fully designed, developed, and CI/CD-integrated by Abdullah Khudher as part of a hands-on portfolio to demonstrate expertise in clean architecture, AI integration, and production-grade Flutter tooling.
```

## 🧠 Author

**Abdullah Khudher**  
[GitHub Profile](https://github.com/abdullah-khudher)
