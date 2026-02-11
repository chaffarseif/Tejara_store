import 'package:auto_route/auto_route.dart';
import 'package:karma_design_system_mobile/providers/router_providers/models/router_path.model.dart';
import 'package:tejara_store/core/routing/routers/app_router.gr.dart';

const loginRouteContainer = RouterPath(basePath: '');
const registerRouteContainer = RouterPath(basePath: 'register');
const splashRouteContainer = RouterPath(basePath: 'splash');
const homeRouteContainer = RouterPath(basePath: 'home');
const onBoardingRouteContainer = RouterPath(basePath: 'onboarding');
const forgetPasswordRouteContainer = RouterPath(basePath: 'forget-password');

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
                                  page: RoutingListenerRoute.page,
                                  initial: true,
                                  children: [
                                    AutoRoute(
                                      page: SplashRoute.page,
                                      path: splashRouteContainer.path,
                                      initial: true,
                                    ),
                                    AutoRoute(
                                      page: OnboardingRoute.page,
                                      path: onBoardingRouteContainer.path,
                                    ),
                                    AutoRoute(
                                      page: LoginRoute.page,
                                      path: loginRouteContainer.path,
                                    ),
                                    AutoRoute(
                                      page: RegisterRoute.page,
                                      path: registerRouteContainer.path,
                                    ),
                                    AutoRoute(
                                      page: ForgetPasswordRoute.page,
                                      path: forgetPasswordRouteContainer.path,
                                    ),
                                    AutoRoute(
                                      page: HomeRoute.page,
                                      path: homeRouteContainer.path,
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
      ],
    ),
  ];
}
