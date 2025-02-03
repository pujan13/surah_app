import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiConfig{
  static const String BASE_URL = 'http://192.168.1.24:3000/api';
  static const String AUTHENTICATE_API = '$BASE_URL/branchUser/authenticate';
}

Future<void> loginAuth() async {
  final url = Uri.parse(ApiConfig.AUTHENTICATE_API);

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Data: $data');
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (e) {
    print('Exception: $e');
  }
}

void main() {
  loginAuth();
}
