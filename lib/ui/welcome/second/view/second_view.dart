import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';
import 'package:movie_mate/res/colors.dart';
import 'package:movie_mate/res/images.dart';
import 'package:movie_mate/utilities/app_route.dart';

class SecondWelcomeView extends StatelessWidget {
  const SecondWelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(homeBanner),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Gradient shading at bottom with #9C9F8E
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.blue.shade800,
                  // Color(0xFF9C9F8E),
                ],
                stops: [0.5, 1.0],
              ),
            ),
          ),

          // Text + Button aligned to bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Because MoviesDeserve More Than Queues",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(Routes.home);
                    },
                    child: Container(
                      width: context.cWidth,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white.withOpacity(0.8)
                      ),
                      child: Text('Next',style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 16),).cToCenter,
                    ),
                  ),
                  const SizedBox(height: 30), // extra bottom padding
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
