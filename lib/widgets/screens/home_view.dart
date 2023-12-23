import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/generated/assets.gen.dart';
import 'package:quiz_app/widgets/screens/calculator_main_view.dart';
import 'package:quiz_app/widgets/screens/cards_view.dart';
import 'package:quiz_app/widgets/screens/news/screens/news_view.dart';
import 'package:quiz_app/widgets/screens/settings_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var _currentIndex = 0;

  final _bottomNavItems = [
    _BottomNavItem(
      inactive: Assets.icons.cardsInactive,
      active: Assets.icons.cardsActive,
    ),
    _BottomNavItem(
      inactive: Assets.icons.calculatorInactive,
      active: Assets.icons.calculatorActive,
    ),
    _BottomNavItem(
      inactive: Assets.icons.newsInactive,
      active: Assets.icons.newsActive,
    ),
    _BottomNavItem(
      inactive: Assets.icons.settingInactive,
      active: Assets.icons.settingActive,
    ),
  ];

  void _selectModule(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            _bottomNavItems.length,
            (index) => _BottomNavItemWidget(
              bottomNavItem: _bottomNavItems[index],
              isActive: _currentIndex == index,
              onPressed: () => _selectModule(index),
            ),
          ),
        ),
      ),
      body: [
        const CardsView(),
        const CalculatorView(),
        const NewsView(),
        const SettingsView(),
      ][_currentIndex],
    );
  }
}

class _BottomNavItemWidget extends StatelessWidget {
  final _BottomNavItem bottomNavItem;
  final bool isActive;
  final VoidCallback? onPressed;
  const _BottomNavItemWidget({
    required this.bottomNavItem,
    required this.isActive,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child:
          isActive ? bottomNavItem.active.svg() : bottomNavItem.inactive.svg(),
      onPressed: onPressed,
    );
  }
}

class _BottomNavItem {
  final SvgGenImage inactive;
  final SvgGenImage active;

  _BottomNavItem({
    required this.inactive,
    required this.active,
  });
}
