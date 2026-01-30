import 'package:bloc/bloc.dart';
import 'package:karma_design_system_mobile/karma_design_system_mobile.dart';
import 'package:tejara_store/main/app_store_module/bloc/app_store_event.dart';
import 'package:tejara_store/main/app_store_module/bloc/app_store_state.dart';

class AppStoreBloc extends Bloc<AppStoreEvent, AppStoreState> {
  final AppStoreProvider _appStoreProvider;

  AppStoreBloc(this._appStoreProvider) : super(AppStoreStateUpToDate()) {
    on<AppStoreEventCheckForUpdates>((event, emit) async {
      final isAppStoreVersionNewerThanInstalled = await _appStoreProvider
          .isAppStoreVersionNewerThanInstalled();
      if (isAppStoreVersionNewerThanInstalled) {
        Map<AppStoreVersionResultsEnum, dynamic> appStoreVersionResults =
            await _getVersions();

        final String? installedVersion =
            appStoreVersionResults[AppStoreVersionResultsEnum.installedVersion]
                ?.toString();
        final String? appStoreVersion =
            appStoreVersionResults[AppStoreVersionResultsEnum.appStoreVersion]
                ?.toString();

        emit(
          AppStoreStateUpdateAvailable(
            installedVersion: installedVersion,
            appStoreVersion: appStoreVersion,
          ),
        );
      } else {
        emit(AppStoreStateUpToDate());
      }
    });

    on<AppStoreEventUpdateApplication>((event, emit) async {
      await _appStoreProvider.updateApplication();
    });
  }

  Future<Map<AppStoreVersionResultsEnum, dynamic>> _getVersions() async {
    Map<AppStoreVersionResultsEnum, Future<dynamic>> futures = {
      AppStoreVersionResultsEnum.installedVersion: _appStoreProvider
          .getInstalledVersion(),
      AppStoreVersionResultsEnum.appStoreVersion: _appStoreProvider
          .getAppStoreVersion(),
    };

    return ConcurrentFutures.execute<AppStoreVersionResultsEnum, dynamic>(
      futures,
    );
  }
}

enum AppStoreVersionResultsEnum { installedVersion, appStoreVersion }
