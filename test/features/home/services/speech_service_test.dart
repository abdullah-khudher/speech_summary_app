import 'package:flutter_test/flutter_test.dart';
import 'package:speech_summary/Features/Home/data/services/speech_service.dart';

void main() {
  late SpeechService service;

  setUp(() {
    service = SpeechService();
  });

  test('initial state of lastRecognizedText is empty', () {
    expect(service.lastRecognizedText, '');
  });
}