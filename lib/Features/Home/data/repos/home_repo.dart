import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../models/SummaryModel/SummaryModel.dart';

abstract class HomeRepo {
  Future<Either<Failure, SummaryModel>> fetchSummary(
      {required String rawText});
}
