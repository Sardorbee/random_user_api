import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:random_user_api/services/model/random_model.dart';

class RandomProvider with ChangeNotifier {
  Future<RandomModel> fetchRandomData() async {
    String url = "https://randomuser.me/api/";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final RandomModel randomData = RandomModel.fromJson(jsonResponse);
        return randomData;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
