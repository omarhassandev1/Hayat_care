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
import 'package:hayat_care/features/appointments/data/data_sources/appointments_mock_data_source.dart'
    as _i901;
import 'package:hayat_care/features/appointments/data/data_sources/booking_mock_date_source.dart'
    as _i20;
import 'package:hayat_care/features/appointments/data/repositories_impl/appointment_repository_impl.dart'
    as _i129;
import 'package:hayat_care/features/appointments/data/repositories_impl/booking_repository_impl.dart'
    as _i941;
import 'package:hayat_care/features/appointments/domain/repositories/appointment_repository.dart'
    as _i913;
import 'package:hayat_care/features/appointments/domain/repositories/booking_repository.dart'
    as _i870;
import 'package:hayat_care/features/appointments/domain/use_cases/appointment_use_case.dart'
    as _i848;
import 'package:hayat_care/features/appointments/domain/use_cases/get_available_slots_use_case.dart'
    as _i939;
import 'package:hayat_care/features/appointments/presentation/cubit/appointments_cubit.dart'
    as _i876;
import 'package:hayat_care/features/appointments/presentation/cubit/booking_cubit.dart'
    as _i365;
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
import 'package:hayat_care/features/chatbot/data/datasources/local_chat_datasource.dart'
    as _i439;
import 'package:hayat_care/features/chatbot/data/repositories/chat_repository_impl.dart'
    as _i1048;
import 'package:hayat_care/features/chatbot/domain/repositories/i_chat_repository.dart'
    as _i42;
import 'package:hayat_care/features/chatbot/domain/use_cases/send_message_use_case.dart'
    as _i589;
import 'package:hayat_care/features/chatbot/presentation/cubit/chat_cubit.dart'
    as _i628;
import 'package:hayat_care/features/doctor_browsing/data/data_source/doctors_mock_data_source.dart'
    as _i555;
import 'package:hayat_care/features/doctor_browsing/data/repository_impl/doctors_repository_impl.dart'
    as _i793;
import 'package:hayat_care/features/doctor_browsing/domain/repositories/doctors_repository.dart'
    as _i566;
import 'package:hayat_care/features/doctor_browsing/domain/use_cases/get_all_doctors_use_case.dart'
    as _i719;
import 'package:hayat_care/features/doctor_browsing/domain/use_cases/search_doctors_use_case.dart'
    as _i135;
import 'package:hayat_care/features/doctor_browsing/presentation/cubit/doctors_cubit.dart'
    as _i230;
import 'package:hayat_care/features/family_members/data/data_source/mock_family_datasource.dart'
    as _i160;
import 'package:hayat_care/features/family_members/data/repository_impl/family_repository_impl.dart'
    as _i974;
import 'package:hayat_care/features/family_members/domain/repository/family_repository.dart'
    as _i802;
import 'package:hayat_care/features/family_members/domain/use_cases/add_family_member.dart'
    as _i640;
import 'package:hayat_care/features/family_members/domain/use_cases/delete_family_member.dart'
    as _i683;
import 'package:hayat_care/features/family_members/domain/use_cases/get_family_members.dart'
    as _i985;
import 'package:hayat_care/features/family_members/presentation/cubit/family_cubit.dart'
    as _i725;
import 'package:hayat_care/features/health/data/datasources/health_mock_datasource.dart'
    as _i350;
import 'package:hayat_care/features/health/data/repositories_impl/health_repository_impl.dart'
    as _i562;
import 'package:hayat_care/features/health/domain/repositories/health_repository.dart'
    as _i336;
import 'package:hayat_care/features/health/domain/use_cases/get_support_groups_use_case.dart'
    as _i458;
import 'package:hayat_care/features/health/domain/use_cases/join_support_group_use_case.dart'
    as _i153;
import 'package:hayat_care/features/health/domain/use_cases/submit_donation_use_case.dart'
    as _i757;
import 'package:hayat_care/features/health/presentation/cubits/donation_cubit/donation_cubit.dart'
    as _i364;
import 'package:hayat_care/features/health/presentation/cubits/health_cubit/health_cubit.dart'
    as _i431;
import 'package:hayat_care/features/layout/presentation/cubit/layout_cubit.dart'
    as _i885;
import 'package:hayat_care/features/profile/data/data_source/mock_profile_data_source.dart'
    as _i672;
import 'package:hayat_care/features/profile/data/repository_impl/profile_repository_impl.dart'
    as _i737;
import 'package:hayat_care/features/profile/domain/repository/profile_repository.dart'
    as _i364;
import 'package:hayat_care/features/profile/domain/usecases/get_profile_usecase.dart'
    as _i727;
import 'package:hayat_care/features/profile/domain/usecases/update_profile_usecase.dart'
    as _i1053;
import 'package:hayat_care/features/profile/presentation/cubit/profile_cubit.dart'
    as _i713;
import 'package:hayat_care/features/reviews/data/datasources/reviews_mock_datasource.dart'
    as _i551;
import 'package:hayat_care/features/reviews/data/repositories_impl/reviews_repository_impl.dart'
    as _i1008;
import 'package:hayat_care/features/reviews/domain/repositories/reviews_repository.dart'
    as _i982;
import 'package:hayat_care/features/reviews/domain/use_cases/get_doctor_reviews_use_case.dart'
    as _i47;
import 'package:hayat_care/features/reviews/domain/use_cases/submit_review_use_case.dart'
    as _i60;
import 'package:hayat_care/features/reviews/presentation/cubit/reviews_cubit.dart'
    as _i185;
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
    gh.singleton<_i885.LayoutCubit>(() => _i885.LayoutCubit());
    gh.lazySingleton<_i901.AppointmentsMockDataSource>(
      () => _i901.AppointmentsMockDataSource(),
    );
    gh.lazySingleton<_i20.BookingMockDataSource>(
      () => _i20.BookingMockDataSource(),
    );
    gh.lazySingleton<_i439.LocalChatDatasource>(
      () => _i439.LocalChatDatasource(),
    );
    gh.lazySingleton<_i555.DoctorsMockDataSource>(
      () => _i555.DoctorsMockDataSource(),
    );
    gh.lazySingleton<_i160.MockFamilyDataSource>(
      () => _i160.MockFamilyDataSource(),
    );
    gh.lazySingleton<_i350.HealthMockDatasource>(
      () => _i350.HealthMockDatasource(),
    );
    gh.lazySingleton<_i672.MockProfileDataSource>(
      () => _i672.MockProfileDataSource(),
    );
    gh.lazySingleton<_i551.ReviewsMockDatasource>(
      () => _i551.ReviewsMockDatasource(),
    );
    gh.lazySingleton<_i704.SettingsLocalDataSource>(
      () => _i704.SettingsLocalDataSourceImpl(gh<_i986.Box<dynamic>>()),
    );
    gh.lazySingleton<_i336.HealthRepository>(
      () => _i562.HealthRepositoryImpl(gh<_i350.HealthMockDatasource>()),
    );
    gh.lazySingleton<_i913.AppointmentsRepository>(
      () => _i129.AppointmentsRepositoryImpl(
        gh<_i901.AppointmentsMockDataSource>(),
        gh<_i555.DoctorsMockDataSource>(),
      ),
    );
    gh.lazySingleton<_i364.ProfileRepository>(
      () => _i737.ProfileRepositoryImpl(gh<_i672.MockProfileDataSource>()),
    );
    gh.lazySingleton<_i870.BookingRepository>(
      () => _i941.BookingRepositoryImpl(gh<_i20.BookingMockDataSource>()),
    );
    gh.factory<_i939.GetAvailableSlotsUseCase>(
      () => _i939.GetAvailableSlotsUseCase(gh<_i870.BookingRepository>()),
    );
    gh.lazySingleton<_i802.FamilyRepository>(
      () => _i974.FamilyRepositoryImpl(gh<_i160.MockFamilyDataSource>()),
    );
    gh.factory<_i848.GetAppointmentsByStatusUseCase>(
      () => _i848.GetAppointmentsByStatusUseCase(
        gh<_i913.AppointmentsRepository>(),
      ),
    );
    gh.lazySingleton<_i289.ArticlesRepository>(
      () => _i845.ArticlesRepositoryImpl(),
    );
    gh.lazySingleton<_i653.SettingsRepository>(
      () => _i312.SettingsRepositoryImpl(gh<_i704.SettingsLocalDataSource>()),
    );
    gh.lazySingleton<_i42.IChatRepository>(
      () => _i1048.ChatRepositoryImpl(gh<_i439.LocalChatDatasource>()),
    );
    gh.lazySingleton<_i566.DoctorsRepository>(
      () => _i793.DoctorsRepositoryImpl(gh<_i555.DoctorsMockDataSource>()),
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
    gh.factory<_i458.GetSupportGroupsUseCase>(
      () => _i458.GetSupportGroupsUseCase(gh<_i336.HealthRepository>()),
    );
    gh.factory<_i153.JoinSupportGroupUseCase>(
      () => _i153.JoinSupportGroupUseCase(gh<_i336.HealthRepository>()),
    );
    gh.factory<_i757.SubmitDonationUseCase>(
      () => _i757.SubmitDonationUseCase(gh<_i336.HealthRepository>()),
    );
    gh.factory<_i589.SendTextMessageUseCase>(
      () => _i589.SendTextMessageUseCase(gh<_i42.IChatRepository>()),
    );
    gh.factory<_i589.SendFileMessageUseCase>(
      () => _i589.SendFileMessageUseCase(gh<_i42.IChatRepository>()),
    );
    gh.lazySingleton<_i727.GetProfileUseCase>(
      () => _i727.GetProfileUseCase(repository: gh<_i364.ProfileRepository>()),
    );
    gh.lazySingleton<_i1053.UpdateProfileUseCase>(
      () => _i1053.UpdateProfileUseCase(
        repository: gh<_i364.ProfileRepository>(),
      ),
    );
    gh.lazySingleton<_i664.GetArticlesUseCase>(
      () => _i664.GetArticlesUseCase(gh<_i289.ArticlesRepository>()),
    );
    gh.lazySingleton<_i982.ReviewsRepository>(
      () => _i1008.ReviewsRepositoryImpl(gh<_i551.ReviewsMockDatasource>()),
    );
    gh.factory<_i47.GetDoctorReviewsUseCase>(
      () => _i47.GetDoctorReviewsUseCase(gh<_i982.ReviewsRepository>()),
    );
    gh.factory<_i60.SubmitReviewUseCase>(
      () => _i60.SubmitReviewUseCase(gh<_i982.ReviewsRepository>()),
    );
    gh.factory<_i876.AppointmentsCubit>(
      () => _i876.AppointmentsCubit(
        getAppointmentsByStatusUseCase:
            gh<_i848.GetAppointmentsByStatusUseCase>(),
      ),
    );
    gh.lazySingleton<_i640.AddFamilyMemberUseCase>(
      () => _i640.AddFamilyMemberUseCase(
        repository: gh<_i802.FamilyRepository>(),
      ),
    );
    gh.lazySingleton<_i683.DeleteFamilyMemberUseCase>(
      () => _i683.DeleteFamilyMemberUseCase(
        repository: gh<_i802.FamilyRepository>(),
      ),
    );
    gh.lazySingleton<_i985.GetFamilyMembersUseCase>(
      () => _i985.GetFamilyMembersUseCase(
        repository: gh<_i802.FamilyRepository>(),
      ),
    );
    gh.factory<_i713.ProfileCubit>(
      () => _i713.ProfileCubit(
        getProfileUseCase: gh<_i727.GetProfileUseCase>(),
        updateProfileUseCase: gh<_i1053.UpdateProfileUseCase>(),
      ),
    );
    gh.lazySingleton<_i719.GetAllDoctorsUseCase>(
      () => _i719.GetAllDoctorsUseCase(
        doctorsRepository: gh<_i566.DoctorsRepository>(),
      ),
    );
    gh.factory<_i135.SearchDoctorsUseCase>(
      () => _i135.SearchDoctorsUseCase(gh<_i566.DoctorsRepository>()),
    );
    gh.factory<_i364.DonationCubit>(
      () => _i364.DonationCubit(gh<_i757.SubmitDonationUseCase>()),
    );
    gh.factory<_i431.HealthCubit>(
      () => _i431.HealthCubit(
        gh<_i458.GetSupportGroupsUseCase>(),
        gh<_i153.JoinSupportGroupUseCase>(),
      ),
    );
    gh.factory<_i365.BookingCubit>(
      () => _i365.BookingCubit(
        getAvailableSlotsUseCase: gh<_i939.GetAvailableSlotsUseCase>(),
      ),
    );
    gh.factory<_i230.DoctorsCubit>(
      () => _i230.DoctorsCubit(
        getAllDoctorsUseCase: gh<_i719.GetAllDoctorsUseCase>(),
        searchDoctorsUseCase: gh<_i135.SearchDoctorsUseCase>(),
      ),
    );
    gh.factory<_i185.ReviewsCubit>(
      () => _i185.ReviewsCubit(
        gh<_i47.GetDoctorReviewsUseCase>(),
        gh<_i60.SubmitReviewUseCase>(),
      ),
    );
    gh.lazySingleton<_i304.GetFavoriteArticlesUseCase>(
      () => _i304.GetFavoriteArticlesUseCase(
        articlesRepository: gh<_i289.ArticlesRepository>(),
      ),
    );
    gh.factory<_i725.FamilyCubit>(
      () => _i725.FamilyCubit(
        getFamilyMembersUseCase: gh<_i985.GetFamilyMembersUseCase>(),
        addFamilyMemberUseCase: gh<_i640.AddFamilyMemberUseCase>(),
        deleteFamilyMemberUseCase: gh<_i683.DeleteFamilyMemberUseCase>(),
      ),
    );
    gh.factory<_i628.ChatCubit>(
      () => _i628.ChatCubit(
        gh<_i589.SendTextMessageUseCase>(),
        gh<_i589.SendFileMessageUseCase>(),
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
