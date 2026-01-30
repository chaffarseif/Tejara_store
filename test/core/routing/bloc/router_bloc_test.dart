import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:karma_design_system_mobile/providers/router_providers/mocks/router_provider.mock.dart';
import 'package:karma_design_system_mobile/providers/router_providers/models/router_path.model.dart';
import 'package:karma_design_system_mobile/providers/router_providers/router.provider.dart';
import 'package:karma_design_system_mobile/utils/mocks/build_context.mock.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:tejara_store/core/routing/bloc/router_bloc.dart';

void main() {
  late BuildContext buildContext;
  late RouterProvider routerProvider;

  setUp(
    () => {
      buildContext = MockBuildContext(),
      routerProvider = MockRouterProvider(),
    },
  );
  group('RouterBloc', () {
    group('RouterEventGoToRouterPath event', () {
      final routerPath = RouterPath(basePath: faker.randomGenerator.string(10));
      blocTest(
        'RouterEventGoToRouterPath routing ',
        setUp: (() {
          when(
            () => routerProvider.replaceRoute(buildContext, routerPath),
          ).thenAnswer((_) async => Future.value());
        }),
        build: () => RouterBloc(routerProvider),
        act: (bloc) {
          bloc.add(
            RoutingEventGoToRouterPath(
              context: buildContext,
              routerPath: routerPath,
            ),
          );
        },
        verify: (_) {
          verify(
            () => routerProvider.replaceRoute(buildContext, routerPath),
          ).called(1);
        },
      );
    });
    group('RouterEventGoBack event', () {
      blocTest(
        'RouterEventGoBack routing ',
        setUp: (() {
          when(
            () => routerProvider.goBack(buildContext),
          ).thenAnswer((_) async => Future.value());
        }),
        build: () => RouterBloc(routerProvider),
        act: (bloc) {
          bloc.add(RoutingEventGoBack(context: buildContext));
        },
        verify: (_) {
          verify(() => routerProvider.goBack(buildContext)).called(1);
        },
      );
    });
  });
}
