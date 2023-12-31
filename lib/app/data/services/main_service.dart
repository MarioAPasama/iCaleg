import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:icaleg/app/views/views/loading_view.dart';

class MainService {
  String urlAPIMain = 'https://icaleg.windypermadi.com/';
  late String urlRedirect = '${urlAPIMain}icaleg-restapi/api/';

  Future<dynamic> postAPI(
      {required String url, Map? body, http.Client? client}) async {
    client ??= http.Client();
    String apiHttp = urlRedirect + url;

    Get.dialog(loadingDefault(), barrierDismissible: false);

    final response = await http.post(Uri.parse(apiHttp), body: body);

    log('Url:$apiHttp\nBody\n$body\n${response.body}');

    final result = jsonDecode(response.body);
    Get.back();

    return result;
  }

  Future<dynamic> getAPI(
      {required String url,
      Map<String, dynamic>? body,
      http.Client? client}) async {
    client ??= http.Client();
    String queryString = Uri(queryParameters: body).query;
    String apiHttp = '$urlRedirect$url?$queryString';

    final response = await http.get(Uri.parse(apiHttp));

    log('Url:$apiHttp\nBody\n$body\n${response.body}');

    final result = jsonDecode(response.body);

    return result;
  }
}
