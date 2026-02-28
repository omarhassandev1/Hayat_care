// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:hayat_care/core/di/register_module.dart' as _i777;
import 'package:hayat_care/features/app_settings/data/data_source/settings_local_data_source.dart'
    as _i704;
import 'package:hayat_care/features/app_settings/data/repository_impl/settings_repository_impl.dart'
    as _i312;
import 'package:hayat_care/features/app_settings/domain/repository/settings_repository.dart'
    as _i653;
import 'package:hayat_care/features/app_settings/domain/usecases/theme_usecase.dart'
    as _i289;
import 'package:hayat_care/features/app_settings/presentation/cubit/app_settings_cubit.dart'
    as _i226;
import 'package:hayat_care/features/articles/data/repository_impl/articles_repository_impl.dart'
    as _i845;
import 'package:hayat_care/features/articles/domain/repository/articles_repository.dart'
    as _i289;
import 'package:hayat_care/features/articles/domain/use_cases/get_articles_usecase.dart'
    as _i664;
import 'package:hayat_care/features/articles/domain/use_cases/get_favorite_articles_usecase.dart'
    as _i304;
import 'package:hayat_care/features/articles/presentation/cubit/articles_cubit.dart'
    as _i428;
import 'package:hive_flutter/hive_flutter.dart' as _i986;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i986.Box<dynamic>>(
      () => registerModule.settingsBox,
      preResolve: true,
    );
    gh.lazySingleton<_i704.SettingsLocalDataSource>(
      () => _i704.SettingsLocalDataSourceImpl(gh<_i986.Box<dynamic>>()),
    );
    gh.lazySingleton<_i289.ArticlesRepository>(
      () => _i845.ArticlesRepositoryImpl(),
    );
    gh.lazySingleton<_i653.SettingsRepository>(
      () => _i312.SettingsRepositoryImpl(gh<_i704.SettingsLocalDataSource>()),
    );
    gh.lazySingleton<_i289.GetThemeUseCase>(
      () => _i289.GetThemeUseCase(gh<_i653.SettingsRepository>()),
    );
    gh.lazySingleton<_i289.CacheThemeUseCase>(
      () => _i289.CacheThemeUseCase(gh<_i653.SettingsRepository>()),
    );
    gh.lazySingleton<_i289.GetLanguageUseCase>(
      () => _i289.GetLanguageUseCase(gh<_i653.SettingsRepository>()),
    );
    gh.lazySingleton<_i289.SetLanguageUseCase>(
      () => _i289.SetLanguageUseCase(gh<_i653.SettingsRepository>()),
    );
    gh.factory<_i226.AppSettingCubit>(
      () => _i226.AppSettingCubit(
        gh<_i289.GetLanguageUseCase>(),
        gh<_i289.SetLanguageUseCase>(),
        gh<_i289.GetThemeUseCase>(),
        gh<_i289.CacheThemeUseCase>(),
      ),
    );
    gh.lazySingleton<_i664.GetArticlesUseCase>(
      () => _i664.GetArticlesUseCase(gh<_i289.ArticlesRepository>()),
    );
    gh.lazySingleton<_i304.GetFavoriteArticlesUseCase>(
      () => _i304.GetFavoriteArticlesUseCase(
        articlesRepository: gh<_i289.ArticlesRepository>(),
      ),
    );
    gh.factory<_i428.ArticlesCubit>(
      () => _i428.ArticlesCubit(
        gh<_i664.GetArticlesUseCase>(),
        gh<_i304.GetFavoriteArticlesUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i777.RegisterModule {}
