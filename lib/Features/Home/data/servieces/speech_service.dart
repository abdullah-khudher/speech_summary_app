import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechService {
  final SpeechToText _speechToText = SpeechToText();
  bool _isListening = false;

  String _lastRecognizedText = '';
  String get lastRecognizedText => _lastRecognizedText;

  /// Initializes speech recognition
  Future<bool> init() async {
    return await _speechToText.initialize(
      onStatus: (status) => print("Speech Status: $status"),
      onError: (error) => print("Speech Error: $error"),
    );
  }

  /// Requests microphone permission
  Future<bool> requestMicPermission() async {
    final status = await Permission.microphone.status;
    if (status.isGranted || status.isProvisional) return true;

    final newStatus = await Permission.microphone.request();
    return newStatus.isGranted;
  }

  /// Starts listening and returns recognized text
  void listen(Function(String) onText) {
    if (_speechToText.isListening) return;
    _isListening = true;
    _speechToText.listen(
      onResult: (result) {
        if (_isListening) {
          _lastRecognizedText = result.recognizedWords;
          onText(result.recognizedWords);
        }
      },
    );
  }

  /// Stops the recognition
  Future<void> stop() async {
    _isListening = false;
    await _speechToText.stop();
  }

  Future<void> cancel() async {
    _isListening = false;
    await _speechToText.cancel();
  }

}