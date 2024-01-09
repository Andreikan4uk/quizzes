import 'package:get_it/get_it.dart';
import 'package:quiz_app/services/news_api_service.dart';
import 'package:quiz_app/services/remote_config_service.dart';
import 'package:quiz_app/services/resources_api_service.dart';
import 'package:quiz_app/services/storage/storage_service.dart';

class ServiceLocator {
  final _getIt = GetIt.instance;

  Future<void> setup() async {
    final storageService = StorageService();
    _getIt.registerSingleton<StorageService>(storageService);
    await storageService.init();
    GetIt.I.registerSingletonAsync(() => RemoteConfigService().init());
    await GetIt.I.isReady<RemoteConfigService>();
    _getIt.registerSingleton<NewsApiService>(NewsApiService());
    _getIt.registerSingleton<ResourcesApiService>(ResourcesApiService());
  }
}
