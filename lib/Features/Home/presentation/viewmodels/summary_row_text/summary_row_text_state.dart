part of 'summary_row_text_cubit.dart';

abstract class SummaryRowTextState extends Equatable {
  const SummaryRowTextState();
  @override
  List<Object> get props => [];
}

// App just started / nothing happened yet
class SummaryRowTextInitial extends SummaryRowTextState {
  const SummaryRowTextInitial();
}

// when start capturing text
class SummaryRowTextListening extends SummaryRowTextState {
  const SummaryRowTextListening();
}

// When mic is capturing text live
class SummaryRowTextRecording extends SummaryRowTextState {
  final String text;
  const SummaryRowTextRecording(this.text);

  @override
  List<Object> get props => [text];
}

// While sending request to API
class SummaryRowTextLoading extends SummaryRowTextState {
  const SummaryRowTextLoading();
}

// Summary result successfully received
class SummaryRowTextSuccess extends SummaryRowTextState {
  final SummaryModel summaryText;
  final String originalText;

   const SummaryRowTextSuccess(this.summaryText, this.originalText);
  @override
  List<Object> get props => [summaryText,originalText];
}

// API or flow error
class SummaryRowTextFailure extends SummaryRowTextState {
  final String errMessage;
  const SummaryRowTextFailure(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}