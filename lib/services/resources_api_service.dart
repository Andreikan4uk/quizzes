import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/models/resource.dart';
import 'package:quiz_app/models/resource_query.dart';
import 'package:quiz_app/services/remote_config_service.dart';

class ResourcesApiService {
  final _remoteConfigService = GetIt.instance<RemoteConfigService>();
  Future<Resource> getResource(ResourceQuery query, {String? currency}) async {
    final dateFormat = DateFormat('yyyy-MM-dd');

    final formatedDate = dateFormat.format(DateTime.now());

    try {
      final response = await http.get(
        Uri.parse(
            'https://commodity-rates-api.p.rapidapi.com/open-high-low-close/$formatedDate?base=$currency&symbols=${query.symbol}'),
        headers: {
          'X-RapidAPI-Key':
              _remoteConfigService.getString(ConfigKey.resourcesApiKey),
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
