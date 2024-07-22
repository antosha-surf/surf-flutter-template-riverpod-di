import 'package:architalk/features/bottom_navigation_holder/presentation/bottom_navigation_holder_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

@RoutePage()
class BottomNavigationHolderModule extends StatelessWidget
    implements AutoRouteWrapper {
  const BottomNavigationHolderModule({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }

  @override
  Widget build(BuildContext context) {
    return const BottomNavigationHolderScreen();
  }
}
