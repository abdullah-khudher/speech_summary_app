import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_service.dart';
import '../models/SummaryModel/SummaryModel.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, SummaryModel>> fetchSummary(
      {required String rawText}) async {
    try {
      var data = await apiService.post(
          endPoint:
              'chat/completions', rawText: rawText,);
      SummaryModel summaryText = SummaryModel.fromJson(data);

      return right(summaryText);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }

  }
}
