import 'package:flutter/material.dart';
import 'package:speech_summary/Features/Home/presentation/views/widgets/control_buttons_widget.dart';
import 'package:speech_summary/Features/Home/presentation/views/widgets/recorded_text_widget.dart';
import 'package:speech_summary/Features/Home/presentation/views/widgets/start_buttons_widget.dart';
import 'package:speech_summary/Features/Home/presentation/views/widgets/summary_result_widget.dart';
import '../manger/summary_row_text_cubit/summary_row_text_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
   const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocListener<SummaryRowTextCubit, SummaryRowTextState>(
            listener: (context, state) {
              if (state is SummaryRowTextFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errMessage)),
                );
              }
            },
            child: const SingleChildScrollView(
              padding:  EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                   RecordedTextDisplay(),
                   SizedBox(height: 16),
                   StartAndTestButtons(),
                   StopAndRetryButtons(),
                   SizedBox(height: 16),
                   SummaryResultDisplay(),
                ],
              ),
            ),
          )
          ,
        ),
      ),
    );
  }
}
