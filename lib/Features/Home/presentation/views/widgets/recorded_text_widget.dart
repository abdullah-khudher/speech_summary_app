import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_summary/Features/Home/presentation/views/widgets/recognized_text_widget.dart';
import '../../manger/summary_row_text_cubit/summary_row_text_cubit.dart';

class RecordedTextDisplay extends StatelessWidget {
  const RecordedTextDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummaryRowTextCubit, SummaryRowTextState>(
      builder: (context, state) {
        if (state is SummaryRowTextRecording) {
          return RecognizedTextWidget(text: state.text);
        } else if (state is SummaryRowTextSuccess) {
          return RecognizedTextWidget(text: state.originalText);
        } else if (state is SummaryRowTextListening) {
          return const RecognizedTextWidget(text: "Speak now please");
        } else {
          return const RecognizedTextWidget(text: "Press start to begin Please");
        }
      },
    );
  }
}