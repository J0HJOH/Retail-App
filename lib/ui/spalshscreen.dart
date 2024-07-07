

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timbu_shop/ui/welcome_page_slider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>with SingleTickerProviderStateMixin {

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2)
    );

    _animationController.forward();
    Timer(const Duration(seconds: 8),
          ()=>Navigator.pushReplacement(context,
          MaterialPageRoute(builder:
      (context) =>
         const WelcomePageSlider()
      )
    )
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(scale: Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                  parent: _animationController,
                  curve: Curves.easeOut)
            ),
              child: Image.asset('new_logo.png', height: 150,),
            ),
            const SizedBox(
              height: 80,
            ),
            ScaleTransition(
              scale: Tween<double>(begin: 0, end: 1).animate(
                  CurvedAnimation(
                      parent: _animationController,
                      curve: Curves.linear)
              ),
              child: const Text("Retailer App", style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),),
            )
          ],
        ),
      ),

      bottomNavigationBar: const SizedBox(
        height: 40,
        child: Text(
            "Your Best Shopping Experience Ever",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.black
          ),
        ),
      ),
    );
  }
}
