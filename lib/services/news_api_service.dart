import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:quiz_app/constants/constants.dart';
import 'package:quiz_app/models/news.dart';

class NewsApiService {
  static const _url = 'https://google-api31.p.rapidapi.com/';

  Future<List<News>> getNews() async {
    try {
      List<News> news = [];
      final data = {
        "text": "Stock market",
        "region": "wt-wt",
        "max_results": 20,
        "time_limit": "d"
      };
      final response = await post(
        Uri.parse(_url),
        headers: {
          'X-RapidAPI-Key': Constants.newsApiKey,
          'X-RapidAPI-Host': Constants.newsApiHost
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        log(data.toString());
        final json = data['news'] as List<dynamic>;
        for (var articleJson in json) {
          news.add(News.fromJson(articleJson));
        }
      }
      return news;
    } catch (e) {
      rethrow;
    }
  }
}
