import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  final openAiApiKey = dotenv.env['OPENAI_API_KEY'];
  final baseURL = dotenv.env['BASE_URL'];

  Future<Map<String, dynamic>> post({required String endPoint, required String rawText}) async {

    final response = await _dio.post(
      "$baseURL$endPoint",
      options: Options(
        headers: {
          'Authorization': 'Bearer $openAiApiKey',
          'Content-Type': 'application/json',
        },
      ),
      data: {
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "system", "content": "You are a helpful assistant that summarizes text into one short sentence"},
          {"role": "user", "content": "Summarize the following paragraph into one short sentence, highlighting only the key idea: $rawText"},
        ],
        "temperature": 0.5,
      },
    );
    return response.data;
  }
}
