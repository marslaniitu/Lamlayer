import 'package:flutter/material.dart';
import 'package:lamlayer/core/theme/custom_theme.dart';
import 'package:lamlayer/features/bottom_nav_bar/bottom_nav_bar_provider.dart';
import 'package:lamlayer/features/wrapper/splash_screen.dart';
import 'package:provider/provider.dart';
import 'features/canva/components/canva_validator_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavBarProvider()),
        ChangeNotifierProvider(create: (_) => CanvaValidatorProvider()),
      ],
      child:  MaterialApp(
        title: 'Lamlayer',
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.customLightTheme,
        home: SplashScreen(),
      ),
    );
  }
}
