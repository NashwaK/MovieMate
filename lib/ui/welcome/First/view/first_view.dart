import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movie_mate/res/colors.dart';
import 'package:movie_mate/res/images.dart';
import 'package:movie_mate/utilities/app_route.dart';

class FirstWelcomeView extends StatelessWidget {
  const FirstWelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            height: context.cHeight,
            width: context.cWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(firstWelcome),
                fit: BoxFit.cover,
              ),
            ),
            child: Text('data'),
          ),

          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white, // #9C9F8E with 90% opacity
                  // Color.fromRGBO(156, 159, 142, 0.9), // #9C9F8E with 90% opacity
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
                    "Catch Every Blockbuster Without the Queue",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primaryColor,
                      // color: Color.fromRGBO(47, 48, 46, 1),
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(Routes.secondWelcome);
                    },
                    child: Container(
                      width: context.cWidth,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: primaryColor,
                      ),
                      child: Text('Next',style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),).cToCenter,
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

