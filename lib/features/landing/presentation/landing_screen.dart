import 'package:architalk/features/landing/di/landing_scope.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:architalk/common/bloc/bloc.dart';
import 'package:architalk/features/landing/domain/domain.dart';
import 'package:architalk/features/landing/presentation/bloc/redirect_info_cubit.dart';
import 'package:architalk/navigation/app_router.dart';

/// Landing screen.
class LandingScreen extends StatelessWidget {
  /// @nodoc.
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ILandingScope>();
    return BlocConsumer<RedirectInfoCubit, SingleActionState<RedirectToPage>>(
      listener: (ctx, state) {
        if (state.isSuccess) {
          final redirectToPage = state.data;

          context.router.replace(
            switch (redirectToPage) {
              RedirectToPage.auth => const AuthPage(),
              RedirectToPage.main => const BottomNavigationHolderPage(),
            },
          );
        }
      },
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: Text('Landing. Waiting to be redirected...'),
          ),
        );
      },
    );
  }
}
