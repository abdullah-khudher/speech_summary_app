import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_summary/Features/Home/presentation/views/widgets/custom_button_view.dart';
import 'package:speech_summary/Features/Home/presentation/views/widgets/recognized_text_view.dart';
import '../../../../core/constants/dummy_data.dart';
import '../manger/summary_row_text_cubit/summary_row_text_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeView extends StatelessWidget {
   const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<SummaryRowTextCubit, SummaryRowTextState>(
          listener: (context, state) {
            if (state is SummaryRowTextFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errMessage)),
              );
            }
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                /// Display recorded text or recording status
                BlocBuilder<SummaryRowTextCubit, SummaryRowTextState>(
                  builder: (context, state) {
                    if (state is SummaryRowTextRecording) {
                      return RecognizedTextWidget(text:state.text);
                    } else {
                      return const RecognizedTextWidget(text:"Press start to begin");
                    }
                  },
                ),

                const SizedBox(height: 16),

                /// Start button
                 ElevatedButton.icon(
                  onPressed: () {
                    context.read<SummaryRowTextCubit>().fetchSummary(
                        rawText: fakeText
                    );
                  },
                  icon: const Icon(Icons.bolt),
                  label: const Text("Test Fake Summary"),
                ),
                // CustomButton(
                //   label: 'Start 🎙',
                //   icon: Icons.mic,
                //   onPressed: () async {
                //     await context.read<SummaryRowTextCubit>().startMicFlow();
                //   },
                // ),

                const SizedBox(height: 8),

                CustomButton(
                  label: 'Stop',
                  icon: Icons.stop,
                  onPressed: () async {
                    await context.read<SummaryRowTextCubit>().stopAndSummarize();
                  },
                ),

                const SizedBox(height: 24),

                /// Summary result
                BlocBuilder<SummaryRowTextCubit, SummaryRowTextState>(
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
                ),
              ],
            ),
          ),
        )
        ,
      ),
    );
  }
}
