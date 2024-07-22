import 'package:architalk/common/widgets/di_scope.dart';
import 'package:architalk/features/landing/di/landing_scope.dart';
import 'package:architalk/features/landing/landing.dart';
import 'package:architalk/features/landing/presentation/bloc/redirect_info_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LandingModule extends StatelessWidget implements AutoRouteWrapper {
  const LandingModule({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return DiScope<ILandingScope>(
      provider: LandingScope.provider,
      child: BlocProvider<RedirectInfoCubit>(
        create: (context) => RedirectInfoCubit(
          repo: context.read<ILandingScope>().landingRedirectRepository,
        )..performAction(),
        child: this,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const LandingScreen();
  }
}
