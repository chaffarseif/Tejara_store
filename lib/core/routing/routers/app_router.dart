import 'package:auto_route/auto_route.dart';
import 'package:karma_design_system_mobile/providers/router_providers/models/router_path.model.dart';
import 'package:tejara_store/core/routing/routers/app_router.gr.dart';

const loginRouteContainer = RouterPath(basePath: 'login');
const registerRouteContainer = RouterPath(basePath: 'register');

@AutoRouterConfig(replaceInRouteName: 'Container,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: ResponsiveRoute.page,
      initial: true,
      children: [
        AutoRoute(
          page: CoreBlocProviderRoute.page,
          initial: true,
          children: [
            AutoRoute(
              page: ThemeSelectorRoute.page,
              initial: true,
              children: [
                AutoRoute(
                  page: AppLifeCycleRoute.page,
                  initial: true,
                  children: [
                    AutoRoute(
                      page: InternetCheckerRoute.page,
                      initial: true,
                      children: [
                        AutoRoute(
                          page: AppStoreUpdateRoute.page,
                          initial: true,
                          children: [
                            AutoRoute(
                              page: GeneralBlocProviderRoute.page,
                              initial: true,
                              children: [
                                AutoRoute(
                                  page: LoginRoute.page,
                                  path: loginRouteContainer.path,
                                ),
                                AutoRoute(
                                  page: RegisterRoute.page,
                                  path: registerRouteContainer.path,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ];
}
