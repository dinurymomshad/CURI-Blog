import 'dart:convert';

import 'package:curi_blog/data/network/api.dart';
import 'package:http/http.dart';
import 'package:nb_utils/nb_utils.dart';

class Network {
  static getRequest(String endpoint, {bool noBaseUrl = false}) async {
    Response response;

    if (noBaseUrl) {
      print('URL: $endpoint');
      response = await get(endpoint);
    } else {
      print('URL: ${API.base}$endpoint');
      response = await get('${API.base}$endpoint');
    }
    return response;
  }

  static Future handleResponse(Response response) async {
    if (isSuccessful(response.statusCode)) {
      print('Success: ${response.body}');
      if (response.body.isNotEmpty) {
        return jsonDecode(response.body);
      } else {
        return response.body;
      }
    } else {
      print('Error: ${response.body}');
      if (response.body.isJson()) {
        return response.statusCode;
      } else {
        return response.statusCode;
      }
    }
  }

  static bool isSuccessful(int code) {
    return code >= 200 && code <= 206;
  }
}
