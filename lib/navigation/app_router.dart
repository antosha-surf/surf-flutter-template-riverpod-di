import 'package:auto_route/auto_route.dart';

import 'package:architalk/features/account/account.dart';
import 'package:architalk/features/auth/auth.dart';
import 'package:architalk/features/bottom_navigation_holder/bottom_navigation_holder.dart';
import 'package:architalk/features/landing/landing.dart';

import '../features/home/home.dart';

part 'app_router.gr.dart';

/// {@template router.class}
/// Main point of the application navigation.
/// {@endtemplate}
@AutoRouterConfig(replaceInRouteName: 'Flow|Screen|Module,Page')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LandingPage.page,
          path: '/',
          initial: true,
        ),
        AutoRoute(
          page: AuthPage.page,
          path: '/auth',
        ),
        AutoRoute(
          page: BottomNavigationHolderPage.page,
          path: '/main',
          children: [
            AutoRoute(
              page: HomePage.page,
              path: 'home',
            ),
            AutoRoute(
              page: AccountPage.page,
              path: 'account',
            ),
          ],
        ),
      ];
}
