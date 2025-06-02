import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_summary/Features/Home/presentation/manger/summary_row_text_cubit/summary_row_text_cubit.dart';
import 'package:speech_summary/Features/Home/presentation/views/home_view.dart';
import '../../../../core/helpers/mock_home_repo.dart';
import '../../../../core/helpers/mock_speech_service.dart';

class MockSummaryRowTextCubit extends SummaryRowTextCubit {
  MockSummaryRowTextCubit() : super(FakeHomeRepo(), FakeSpeechService()) {
    emit(const SummaryRowTextInitial());
  }
}

void main() {
  testWidgets('Start button is displayed', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<SummaryRowTextCubit>(
          create: (_) => MockSummaryRowTextCubit(),
          child: const HomeView(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Start 🎙️'), findsOneWidget);
  });
}