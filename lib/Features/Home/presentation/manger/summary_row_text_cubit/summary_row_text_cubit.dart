import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../../../data/models/SummaryModel/SummaryModel.dart';
import '../../../data/repos/home_repo.dart';
import '../../../data/servieces/speech_service.dart';

part 'summary_row_text_state.dart';

class SummaryRowTextCubit extends Cubit<SummaryRowTextState> {
  SummaryRowTextCubit(this.homeRepo, this.speechService) : super(SummaryRowTextInitial());

  final HomeRepo homeRepo;
  final SpeechService speechService;


  String _recognizedText = '';

  void updateRecognizedText(String text) {
    _recognizedText = text;
    emit(SummaryRowTextRecording(_recognizedText));
  }

  Future<bool> requestMicPermission() async {
    var status = await Permission.microphone.status;

    if (status.isGranted || status.isProvisional) {
      return true;
    }
    final newStatus = await Permission.microphone.request();
    return newStatus.isGranted || newStatus.isProvisional;
  }

  Future<void> startMicFlow() async {
    final granted = await requestMicPermission();
    if (!granted) {
      emit(const SummaryRowTextFailure("Microphone permission is required"));
      return;
    }

    final available = await speechService.init();
    if (!available) {
      emit(const SummaryRowTextFailure("Microphone is not available"));
      return;
    }

    speechService.listen((text) {
      _recognizedText = text;
      emit(SummaryRowTextRecording(_recognizedText));
    });
  }

  Future<void> stopAndSummarize() async {
    speechService.stop();
    emit(SummaryRowTextStopped());

    await fetchSummary( rawText: _recognizedText);
  }

  Future<void> fetchSummary({required String rawText}) async {
    emit(SummaryRowTextLoading());
    var result = await homeRepo.fetchSummary(rawText: rawText);
    result.fold((failure) {
      emit(SummaryRowTextFailure(failure.errMessage));
    }, (summaryText) {
      emit(SummaryRowTextSuccess(summaryText));
    });
  }

}
