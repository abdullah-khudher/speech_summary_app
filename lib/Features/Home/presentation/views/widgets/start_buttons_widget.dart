

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manger/summary_row_text_cubit/summary_row_text_cubit.dart';
import 'custom_button_widget.dart';


class StopAndRetryButtons extends StatelessWidget {
  const StopAndRetryButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummaryRowTextCubit, SummaryRowTextState>(
      builder: (context, state) {
        if (state is SummaryRowTextListening || state is SummaryRowTextRecording) {
          return Column(
            children: [
              CustomButton(
                label: 'Finish & Get Summary',
                icon: Icons.stop,
                onPressed: () async {
                  await context.read<SummaryRowTextCubit>().stopAndSummarize();
                },
              ),
              const SizedBox(height: 8),
              CustomButton(
                label: 'Discard & Retry',
                icon: Icons.restart_alt,
                onPressed: () async {
                  await context.read<SummaryRowTextCubit>().discardRecording();
                },
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}