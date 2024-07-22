import 'package:architalk/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text('Home screen!'),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 16),
            child: FilledButton(
              onPressed: () {
                context.router.push(const AuthPage());
              },
              child: const Text('Reauth'),
            ),
          ),
        ],
      ),
    );
  }
}
