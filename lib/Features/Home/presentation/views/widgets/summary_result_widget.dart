import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_summary/Features/Home/presentation/views/widgets/recognized_text_widget.dart';
import '../../viewmodels/summary_row_text/summary_row_text_cubit.dart';

class SummaryResultDisplay extends StatelessWidget {
  const SummaryResultDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummaryRowTextCubit, SummaryRowTextState>(
      builder: (context, state) {
        if (state is SummaryRowTextLoading) {
          return const CircularProgressIndicator();
        } else if (state is SummaryRowTextSuccess) {
          return RecognizedTextWidget(text: state.summaryText.content);
        } else if (state is SummaryRowTextFailure) {
          return RecognizedTextWidget(text: state.errMessage);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}