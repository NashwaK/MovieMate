import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:movie_mate/res/colors.dart';
import 'package:movie_mate/res/images.dart';
import 'package:movie_mate/res/style.dart';
import 'package:movie_mate/ui/home/bind/home_bind.dart';

class FirstPart extends StatelessWidget {
  const FirstPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Container(
          height: context.cHeight * 0.4,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(homeBanner),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Dark overlay (tint)
        Container(
          height: context.cHeight * 0.4,
          width: double.infinity,
          color: Colors.black.withOpacity(0.3),
        ),

        // Bottom gradient fade
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  primaryColor,
                ],
              ),
            ),
          ),
        ),

        // Top Content
        Positioned.fill(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: TextfieldPart(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TextfieldPart extends StatelessWidget {
  const TextfieldPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Search Movie',
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
          prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(0.5)),
          filled: true,
          fillColor: Colors.white.withOpacity(0.25),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        ),
      ),
    );
  }
}

class ProductsPart extends StatelessWidget {
  const ProductsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (logic) {
        return SizedBox(
          height: 220, // enough height for scaling
          child: PageView.builder(
            controller: logic.pageViewController,
            itemCount: 10,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              // calculate scale for center item
              double scale = 1.0;
              scale = (index == logic.currentPage.floor() || index == logic.currentPage.ceil())
                  ? 1.0 + (1 - (logic.currentPage - index).abs()).clamp(0.0, 1.0) * 0.3
                  : 1.0;

              return TweenAnimationBuilder(
                duration: const Duration(milliseconds: 200),
                tween: Tween<double>(begin: 1, end: scale),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(homeBanner),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Bottom button
                      Positioned(
                        bottom: 30,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'data',
                              style: customStyle(14, Colors.black, FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}


// class ProductsPart extends StatelessWidget {
//   const ProductsPart({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeController>(
//         builder: (logic) {
//           return SizedBox(
//             height: 190, // fix height for your product cards
//             child: MasonryGridView.count(
//               crossAxisCount: 1, // single row
//               scrollDirection: Axis.horizontal,
//               mainAxisSpacing: 12,
//               crossAxisSpacing: 12,
//               padding: EdgeInsets.symmetric(horizontal: 12),
//               itemCount: 10,
//               itemBuilder: (context, i) {
//                 return Container(
//                   width: 150,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     image: DecorationImage(
//                       image: AssetImage(homeBanner),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         }
//     );
//   }
// }



















class BackColorLeft extends StatelessWidget {
  const BackColorLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.purple.withOpacity(0.4),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.5),
            blurRadius: 200,
            spreadRadius: 150,
          )
        ],
      ),
    );
  }
}

class BackColorRight extends StatelessWidget {
  const BackColorRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red.withOpacity(0.4),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.5),
            blurRadius: 200,
            spreadRadius: 150,
          )
        ],
      ),
    );
  }
}
