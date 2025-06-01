part of 'summary_row_text_cubit.dart';

abstract class SummaryRowTextState extends Equatable {
  const SummaryRowTextState();
  @override
  List<Object> get props => [];
}

// App just started / nothing happened yet
class SummaryRowTextInitial extends SummaryRowTextState {}

// When mic is capturing text live
class SummaryRowTextRecording extends SummaryRowTextState {
  final String text;
  const SummaryRowTextRecording(this.text);

  @override
  List<Object> get props => [text];
}

// Mic is stopped but not yet summarized
class SummaryRowTextStopped extends SummaryRowTextState {}

// While sending request to API
class SummaryRowTextLoading extends SummaryRowTextState {}

// Summary result successfully received
class SummaryRowTextSuccess extends SummaryRowTextState {
  final SummaryModel summaryText;
  const SummaryRowTextSuccess(this.summaryText);
  @override
  List<Object> get props => [summaryText];
}

// API or flow error
class SummaryRowTextFailure extends SummaryRowTextState {
  final String errMessage;
  const SummaryRowTextFailure(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}