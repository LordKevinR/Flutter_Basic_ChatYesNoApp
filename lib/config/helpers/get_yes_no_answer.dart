import 'package:chat_yes_no_app/domain/entities/message.dart';
import 'package:chat_yes_no_app/infrastructure/models/yes_no_model.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get("https://yesno.wtf/api");

    final message = YesNoModel.fromJson(response.data);

    return message.toMessageEntity();
  }
}
