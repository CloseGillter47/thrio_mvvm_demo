// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/apis.dart';
import '../services/cache_service.dart';
import '../services/third_party_services_module.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<APIs>(() => APIs());
  gh.lazySingleton<CacheService>(() => CacheService());
  gh.lazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  final sharedPreferences = await thirdPartyServicesModule.caches;
  gh.factory<SharedPreferences>(() => sharedPreferences);
  return get;
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  NavigationService get navigationService => NavigationService();
}
