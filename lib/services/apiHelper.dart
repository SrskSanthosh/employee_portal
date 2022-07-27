import 'dart:convert';
import 'dart:io';

import 'package:employee_portal/services/api_response.dart';
import 'package:employee_portal/services/app_exception.dart';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
  static dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 422:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 510:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  //Get Method
  static Future<ApiResponse> getAPI(String url, String accessToken) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': "*/*",
          'Authorization': accessToken,
        },
      );
      var responseJson = _returnResponse(response);
      return ApiResponse.completed(responseJson);
    } on SocketException {
      return ApiResponse.error('No Internet connection');
    }
  }
}
