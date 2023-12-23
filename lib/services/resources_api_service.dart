import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/models/resource.dart';
import 'package:quiz_app/models/resource_query.dart';

class ResourcesApiService {
  Future<Resource> getResource(ResourceQuery query, {String? currency}) async {
    final dateFormat = DateFormat('yyyy-MM-dd');

    final formatedDate = dateFormat.format(DateTime.now());

    try {
      final response = await http.get(
        Uri.parse(
            'https://commodity-rates-api.p.rapidapi.com/open-high-low-close/$formatedDate?base=$currency&symbols=${query.symbol}'),
        headers: {
          'X-RapidAPI-Key':
              '85c601ed47mshd64e6dd8bda74e9p1f52b7jsn8e88c01213e6',
          'X-RapidAPI-Host': 'commodity-rates-api.p.rapidapi.com'
        },
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Resource.fromJson(json);
      } else {
        throw Exception('Status code: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
