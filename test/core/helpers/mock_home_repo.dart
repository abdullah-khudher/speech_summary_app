import 'package:dartz/dartz.dart';
import 'package:speech_summary/Features/Home/data/models/summary_model/summary_model.dart';
import 'package:speech_summary/Features/Home/data/repos/home_repo.dart';
import 'package:speech_summary/core/errors/failures.dart';

class FakeHomeRepo implements HomeRepo {
  @override
  Future<Either<Failure, SummaryModel>> fetchSummary({required String rawText}) async {
    return const Right(SummaryModel(content: 'Mock Summary'));
  }
}