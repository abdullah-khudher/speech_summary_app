import 'package:equatable/equatable.dart';

class SummaryModel extends Equatable{
  final String content;

  const SummaryModel({required this.content});

  factory SummaryModel.fromJson(Map<String, dynamic> json) {
    return SummaryModel(
      content: json['choices'][0]['message']['content'],
    );
  }

  @override
  List<Object> get props => [content];}
