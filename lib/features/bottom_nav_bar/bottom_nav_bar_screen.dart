import 'package:flutter/material.dart';
import 'package:lamlayer/core/theme/custom_colors.dart';
import 'package:lamlayer/features/bottom_nav_bar/bottom_nav_bar_provider.dart';
import 'package:lamlayer/features/canva/canva_screen.dart';
import 'package:lamlayer/features/history/history_screen.dart';
import 'package:liquid_bottom_nav_bar/liquid_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentIndex = 0;

  static const items = <LiquidNavItem>[
    LiquidNavItem(
      icon: Icons.add_circle_outline_outlined,
      activeIcon: Icons.add_circle,
      label: '',

    ),

    LiquidNavItem(
      icon: Icons.history_outlined,
      activeIcon: Icons.history,
      label: '',


    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: IndexedStack(
          index: provider.currentIndex,
          children: [
            CanvaScreen(),
            HistoryScreen()
          ],
        ),
          bottomNavigationBar: SafeArea(
            child: LiquidBottomNavBar(
              items: items,
              blobBaseWidthFactor: 0.8,
              blobExpandedWidthFactor: 0.8,
              blobBaseHeight: 40,
              blobExpandedHeight: 40,
              blobStretchMultiplier: 40,
              blobMaxStretch: 40,
              currentIndex: provider.currentIndex,
              onTap: (index) => provider.setCurrentIndex(index),
              showLabel: true,
              blurSigma: 8,
              iconSize: 20,
              height: 60,
              style: LiquidNavStyle(
                containerColor: CustomColors.primaryColor,
                liquidColor: CustomColors.secondaryColor,
                activeIconColor: CustomColors.white,
                inactiveIconColor: CustomColors.grey,
                showLabel: false,
                borderRadius: BorderRadius.all(Radius.circular(100)),
                labelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(color: CustomColors.grey),
                activeLabelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(color: CustomColors.white, fontWeight: FontWeight.bold),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0D000000),
                    blurRadius: 18,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
