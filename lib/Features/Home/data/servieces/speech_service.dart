import 'package:speech_to_text/speech_to_text.dart';

class SpeechService {
  final SpeechToText _speechToText = SpeechToText();

  Future<bool> init() async {
    return await _speechToText.initialize();
  }

  void listen(Function(String) onText) {
    _speechToText.listen(
      onResult: (result) => onText(result.recognizedWords),
    );
  }

  void stop() {
    _speechToText.stop();
  }

  bool get isListening => _speechToText.isListening;
}