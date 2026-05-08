import 'package:flutter/material.dart';
import 'package:lamlayer/features/bottom_nav_bar/bottom_nav_bar_screen.dart';

import '../../core/theme/custom_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> BottomNavBarScreen()), (r)=> false);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child:Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              center: AlignmentGeometry.topLeft,
              radius: 1.2,
              colors: [
                Color(0xff3cb9ca),
                Color(0xff3cb9ca),
                Color(0xFF4c49ec),
                Color(0xff7a2efc),
              ],
              stops: [0.0, 0.4, 0.8, .9],
            ),
          ),
          child: Center(
            child: Text(
              'Lamlayer',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: CustomColors.white, fontWeight: FontWeight.bold)
            ),
          ),
        )
      ),
    );
  }
}
