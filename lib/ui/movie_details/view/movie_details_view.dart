import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';
import 'package:movie_mate/res/colors.dart';
import 'package:movie_mate/res/images.dart';
import 'package:movie_mate/res/style.dart';
import 'package:movie_mate/ui/movie_details/bind/movie_details_bind.dart';
import 'package:movie_mate/ui/movie_details/view/more.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: GetBuilder<MovieDetailsController>(
          builder: (logic) {
            var data = logic.moviesModelClass?.data?[logic.index.value];
            return Column(
              children: [
                // Top banner (image + overlay + gradient)
                Stack(
                  children: [
                    // Background image
                    BgImagePart(),
                    // Dark overlay on image
                    IgnorePointer(
                      child: Container(
                        height: context.cHeight / 2,
                        width: double.infinity,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),

                    // Gradient at bottom of image
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: GradientOverlayPart(),
                    ),
                    // Gradient at bottom of image
                    Positioned(
                      bottom: 20,
                      left: 20,
                      right: 0,
                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.network(
                              data?.backdropPath ?? '',
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data?.originalTitle ?? '',style: customStyle(18, Colors.white, FontWeight.bold),
                              ).cPadOnly(l: 15),
                              Text(data?.originalLanguage ?? '',style: customStyle(14, Colors.white, FontWeight.normal),
                              ).cPadOnly(l: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.star,color: Colors.yellow,size: 15,),
                                  Text('${data?.voteAverage ?? '0'}',style: customStyle(14, Colors.white, FontWeight.normal),
                                  ).cPadOnly(l: 5),
                                ],
                              ).cPadOnly(l: 15),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Example body part
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DateAndDetails(),
                    OverviewPart().cPadOnly(t: 15),
                    CastingList().cPadOnly(t: 15),
                  ],
                ).cPadSymmetric(h: 20)
              ],
            );
          }
        ),
      ),
    );
  }
}

