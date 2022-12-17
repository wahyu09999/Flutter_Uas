import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpHelper {
  final String _baseUrl = 'http://127.0.0.1:8000/api/';
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

    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      const key = 'token';

      final token = json.decode(response.body);

      prefs.setString(key, token['token']);
    }
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

  Future<Response> logout(String token) async {
    final url = Uri.parse(_baseUrl + 'auth/logout');
    final body = {};
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + '$token',
    };
    final response = await post(url, body: body, headers: headers);

    return response;
}

  getKategori() async {
    final url = Uri.parse(_baseUrl + 'category');
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final token = prefs.get(key);
    final headers = {
      'Authorization': 'Bearer ' + '$token',
      'Accept': 'application/json',
    };
    final response = await get(url, headers: headers);

    return response;
  }

  Future<Response> logOut(String token) async {
    final url = Uri.parse(_baseUrl + 'auth/logout');
    final body = {};
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + '$token',
    };
    final response = await post(url, body: body, headers: headers);

    return response;
  }
}
