// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AccountPage.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const AccountModule()),
      );
    },
    AuthPage.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const AuthModule()),
      );
    },
    BottomNavigationHolderPage.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const BottomNavigationHolderModule()),
      );
    },
    HomePage.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const HomeModule()),
      );
    },
    LandingPage.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const LandingModule()),
      );
    },
  };
}

/// generated route for
/// [AccountModule]
class AccountPage extends PageRouteInfo<void> {
  const AccountPage({List<PageRouteInfo>? children})
      : super(
          AccountPage.name,
          initialChildren: children,
        );

  static const String name = 'AccountPage';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthModule]
class AuthPage extends PageRouteInfo<void> {
  const AuthPage({List<PageRouteInfo>? children})
      : super(
          AuthPage.name,
          initialChildren: children,
        );

  static const String name = 'AuthPage';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BottomNavigationHolderModule]
class BottomNavigationHolderPage extends PageRouteInfo<void> {
  const BottomNavigationHolderPage({List<PageRouteInfo>? children})
      : super(
          BottomNavigationHolderPage.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavigationHolderPage';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeModule]
class HomePage extends PageRouteInfo<void> {
  const HomePage({List<PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LandingModule]
class LandingPage extends PageRouteInfo<void> {
  const LandingPage({List<PageRouteInfo>? children})
      : super(
          LandingPage.name,
          initialChildren: children,
        );

  static const String name = 'LandingPage';

  static const PageInfo<void> page = PageInfo<void>(name);
}
