import 'package:architalk/common/widgets/di_scope.dart';
import 'package:architalk/features/home/di/home_scope.dart';
import 'package:architalk/features/home/home.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeModule extends StatelessWidget implements AutoRouteWrapper {
  /// {@macro debug_flow.class}
  const HomeModule({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return DiScope<IHomeScope>(
      provider: IHomeScope.provider,
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
