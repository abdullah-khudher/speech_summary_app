
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'Features/Home/data/repos/home_repo.dart';
import 'Features/Home/data/services/speech_service.dart';
import 'Features/Home/presentation/manger/summary_row_text_cubit/summary_row_text_cubit.dart';
import 'Features/Home/presentation/views/home_view.dart';
import 'core/utils/service_locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();
  setupServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SummaryRowTextCubit(getIt.get<HomeRepo>(),getIt.get<SpeechService>()),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeView(),
      ),
    );
  }
}

