import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../models/summary_model/summary_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, SummaryModel>> fetchSummary(
      {required String rawText});
}
