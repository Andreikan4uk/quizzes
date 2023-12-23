import 'package:quiz_app/generated/assets.gen.dart';
import 'package:quiz_app/models/resource_query.dart';

class Constants {
  static const newsApiKey =
      '19672c07cbmsh0eb7ed69aa7a086p18194ajsn1e466426c7bc';
  static const newsApiHost = 'google-api31.p.rapidapi.com';

  static final reourseQueries = [
    ResourceQuery(symbol: 'XAU', icon: Assets.images.metall, name: 'Gold'),
    ResourceQuery(symbol: 'XAG', icon: Assets.images.metall, name: 'Silver'),
    ResourceQuery(
        symbol: 'BRENTOIL', icon: Assets.images.oil, name: 'Brentoil'),
    ResourceQuery(symbol: 'COCOA', icon: Assets.images.coffee, name: 'Cocoa'),
    ResourceQuery(symbol: 'NG', icon: Assets.images.gas, name: 'Gas'),
    ResourceQuery(symbol: 'XCU', icon: Assets.images.metall, name: 'Copper'),
    ResourceQuery(symbol: 'XPT', icon: Assets.images.metall, name: 'Platinum'),
    ResourceQuery(symbol: 'WHEAT', icon: Assets.images.grade, name: 'Wheat'),
    ResourceQuery(
        symbol: 'HOU22', icon: Assets.images.oil, name: 'Heating Oil'),
    ResourceQuery(symbol: 'NI', icon: Assets.images.metall, name: 'Nickel'),
  ];
}
