import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../../core/constants/dummy_data.dart';
import '../../../data/models/summary_model/summary_model.dart';
import '../../../data/repos/home_repo.dart';
import '../../../data/services/speech_service.dart';

part 'summary_row_text_state.dart';

class SummaryRowTextCubit extends Cubit<SummaryRowTextState> {
   SummaryRowTextCubit(this.homeRepo, this.speechService) : super(const SummaryRowTextInitial());

  final HomeRepo homeRepo;
  final SpeechService speechService;

  String _currentTranscript = '';

  void fakeSummaryTest() async{
    emit( const SummaryRowTextSuccess(SummaryModel(content: DummyData.fakeSummary),  DummyData.fakeText));
  }


  /// Initializes mic recording flow and listens to speech.
  Future<void> startMicFlow() async {
    final granted = await speechService.requestMicPermission();
    if (!granted) {
      if (await Permission.microphone.isPermanentlyDenied) {
        openAppSettings();
        emit(const SummaryRowTextFailure("Please enable microphone access from Settings."));
      } else {
        emit(const SummaryRowTextFailure("Microphone permission is required"));
      }
      return;
    }
    var asd = await speechService.init();
    if (!asd) {
      emit(const SummaryRowTextFailure("Microphone is not available"));
      return;
    }
    emit(const SummaryRowTextListening());

    speechService.listen((text) {
      if (kDebugMode) {
        print("Recognized: $text");
      }
      _currentTranscript = text;
      emit(SummaryRowTextRecording(_currentTranscript));
    });
  }

  /// Stops the mic and sends text to summarization
  Future<void> stopAndSummarize() async {
    await speechService.stop();
    if (_currentTranscript.trim().isEmpty) {
      emit(const SummaryRowTextFailure("Please speak before summarizing."));
      return;
    }
    await fetchSummary( rawText: _currentTranscript);
  }

  Future<void> fetchSummary({required String rawText}) async {
    emit(const SummaryRowTextLoading());
    var result = await homeRepo.fetchSummary(rawText: rawText);
    result.fold((failure) {
      emit(SummaryRowTextFailure(failure.errMessage));
    }, (summaryText) {
      emit(SummaryRowTextSuccess(summaryText,_currentTranscript));
    });
  }
  /// Cancels the recording and discards everything
  Future<void> discardRecording() async {
    _currentTranscript = '';

    await speechService.cancel();

    emit(const SummaryRowTextInitial());

  }


}
