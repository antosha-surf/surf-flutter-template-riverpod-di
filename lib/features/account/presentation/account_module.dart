import 'package:architalk/features/account/presentation/account_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

@RoutePage()
class AccountModule extends StatelessWidget implements AutoRouteWrapper {
  const AccountModule({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }

  @override
  Widget build(BuildContext context) {
    return const AccountScreen();
  }
}
