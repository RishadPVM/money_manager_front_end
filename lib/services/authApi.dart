import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class Authapi extends GetxController {
  
Future<void> login() async {
  const url = '/auth/login'; // Replace <your_ip_address> with your actual IP address
  var body = jsonEncode({
    "email": "test@gmail.com",
    "password": "password"
  });
  log(url);
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'}, // Ensure headers are set
      body: body
    );

    log('Response status code: ${response.statusCode}');
    if (response.statusCode == 200) {
      log('Response body: ${response.body}');
    } else {
      log('Failed to login. Status code: ${response.statusCode}');
      log('Response body: ${response.body}');
    }
  } catch (e) {
    log('An error occurred:');
    log(e.toString());
  }
}
}