import 'package:architalk/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:architalk/uikit/colors/app_color_scheme.dart';
import 'package:architalk/uikit/text/app_text_scheme.dart';

/// Bottom navigation holder. Will hold wrapper around the 3 main screens
/// and a connector bottom navigation bar.
class BottomNavigationHolderScreen extends StatelessWidget {
  /// @nodoc.
  const BottomNavigationHolderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomePage(),
        AccountPage(),
      ],
      bottomNavigationBuilder: (ctx, router) {
        const navBarItems = <_NavBarItem>[
          (title: 'home', icon: '123'),
          (title: 'account', icon: '123'),
        ];

        return BottomNavigationBar(
          currentIndex: router.activeIndex,
          backgroundColor: AppColorScheme.of(ctx).surface,
          onTap: router.setActiveIndex,
          selectedLabelStyle: AppTextScheme.of(ctx).caption,
          unselectedLabelStyle: AppTextScheme.of(ctx).caption,
          selectedItemColor: AppColorScheme.of(ctx).textPrimary,
          unselectedItemColor: AppColorScheme.of(ctx).textSecondary,
          items: [
            ...List.generate(
              navBarItems.length,
              (index) => BottomNavigationBarItem(
                label: navBarItems[index].title,
                icon: const Icon(Icons.ac_unit),
              ),
            ),
          ],
        );
      },
    );
  }
}

typedef _NavBarItem = ({
  String title,
  String icon,
});
