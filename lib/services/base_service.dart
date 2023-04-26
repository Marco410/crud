import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:global_configuration/global_configuration.dart';

class BaseService extends ChangeNotifier {
  final String _baseUrl = GlobalConfiguration().getValue('base_url');

  Future<String> baseGet(urlBaseCall) async {
    final url = Uri.https(_baseUrl, urlBaseCall);
    final resp = await http.get(url, headers: {
      "Content-type": "application/json",
      "Accept": "*/*",
    });
    return resp.body;
  }

  Future<String> baseGetWithParams(urlBaseCall, userID) async {
    final url = Uri.https(_baseUrl, urlBaseCall, {'userId': userID});
    final resp = await http.get(url, headers: {
      "Content-type": "application/json",
      "Accept": "*/*",
    });
    return resp.body;
  }

  Future<String> basePost(urlBaseCall, data) async {
    final url = Uri.https(_baseUrl, urlBaseCall);
    Map<String, String> userHeader = {
      "Content-type": "application/json",
      "Accept": "*/*",
    };
    final resp =
        await http.post(url, headers: userHeader, body: json.encode(data));

    return resp.body;
  }

  Future<String> baseDelete(urlBaseCall) async {
    final url = Uri.https(_baseUrl, urlBaseCall);
    final resp = await http.delete(url, headers: {
      "Content-type": "application/json",
      "Accept": "*/*",
    });
    return resp.body;
  }
}
