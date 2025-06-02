import 'package:speech_summary/Features/Home/data/servieces/speech_service.dart';

class FakeSpeechService implements SpeechService {
  @override
  Future<bool> init() async => true;

  @override
  Future<void> stop() async {}

  @override
  void listen(Function(String) onText) => onText('Hello world');

  bool get isListening => false;

  @override
  Future<bool> requestMicPermission() async => true;

  @override
  Future<void> cancel() async {}

  @override
  String get lastRecognizedText => 'Hello world';
}
