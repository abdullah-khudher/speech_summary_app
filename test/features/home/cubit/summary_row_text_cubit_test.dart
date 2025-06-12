import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:speech_summary/Features/Home/data/repos/home_repo.dart';
import 'package:speech_summary/Features/Home/data/services/speech_service.dart';
import 'package:speech_summary/Features/Home/presentation/viewmodels/summary_row_text/summary_row_text_cubit.dart';

class MockHomeRepo extends Mock implements HomeRepo {}
class MockSpeechService extends Mock implements SpeechService {}

void main() {
  late SummaryRowTextCubit cubit;
  late MockHomeRepo mockRepo;
  late MockSpeechService mockSpeech;

  setUp(() {
    mockRepo = MockHomeRepo();
    mockSpeech = MockSpeechService();
    cubit = SummaryRowTextCubit(mockRepo, mockSpeech);
  });

  test('initial state is SummaryRowTextInitial', () {
    expect(cubit.state, isA<SummaryRowTextInitial>());
  });

  test('emits SummaryRowTextSuccess from fakeSummaryTest', () {
    cubit.fakeSummaryTest();
    expect(cubit.state, isA<SummaryRowTextSuccess>());
  });
}