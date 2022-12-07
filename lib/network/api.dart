import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpHelper {
  final String _baseUrl = 'http://172.168.22.7:8000/api/';
  final String token = '';

  Future<Response> login(String email, String password, String deviceId) async {
    final url = Uri.parse(_baseUrl + 'auth/login');
    final body = {
      'email': email,
      'password': password,
      'device_name': deviceId
    };
    final headers = {
      'Accept': 'application/json',
    };

    final response = await post(url, body: body, headers: headers);
    return response;
  }

 Future<Response> register(
      String name, String email, String password, String deviceId) async {
    final url = Uri.parse(_baseUrl + 'auth/register');
    final body = {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password,
      'device_name': deviceId,
    };
    final headers = {
      'Accept': 'application/json',
    };

    final response = await post(url, body: body, headers: headers);
    return response;
  }
 
}
