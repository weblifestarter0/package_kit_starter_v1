import 'dart:io';

import 'package:dio/dio.dart';

class SendinblueRepository {
  final String apiKey;

  SendinblueRepository({
    required this.apiKey,
  });

  Future<Map<String, dynamic>> sendTransactionalEmail({required Map<String, dynamic> data}) async {
    var response = await Dio().post(
      "https://api.sendinblue.com/v3/smtp/email",
      data: data,
      options: Options(
        headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.contentTypeHeader: "application/json",
          "api-key": apiKey,
        },
      ),
    );

    print("sendTransactionalEmail response ${response.data}");

    return response.data;
  }
}
