import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../viewmodels/summary_row_text/summary_row_text_cubit.dart';
import 'custom_button_widget.dart';


class StartAndTestButtons extends StatelessWidget {
  const StartAndTestButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummaryRowTextCubit, SummaryRowTextState>(
      builder: (context, state) {
        if (state is! SummaryRowTextListening && state is! SummaryRowTextRecording) {
          return Column(
            children: [
              CustomButton(
                icon:  Icons.bolt,
                label:  "Test Fake Summary",
                onPressed: () {
                  context.read<SummaryRowTextCubit>().fakeSummaryTest();
                },
              ),
              const SizedBox(height: 8),
              CustomButton(
                label: 'Start 🎙️',
                icon: Icons.mic,
                onPressed: () async {
                  await context.read<SummaryRowTextCubit>().startMicFlow();
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