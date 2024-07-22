import 'package:architalk/features/auth/presentation/auth_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

@RoutePage()
class AuthModule extends StatelessWidget implements AutoRouteWrapper {
  const AuthModule({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }

  @override
  Widget build(BuildContext context) {
    return const AuthScreen();
  }
}
