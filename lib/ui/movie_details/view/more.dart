import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movie_mate/res/colors.dart';
import 'package:movie_mate/res/images.dart';
import 'package:movie_mate/res/style.dart';
import 'package:movie_mate/ui/movie_details/bind/movie_details_bind.dart';

class BgImagePart extends StatelessWidget {
  const BgImagePart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieDetailsController>(
      builder: (logic) {
        var data = logic.moviesModelClass?.data?[logic.index.value];
        return Container(
          padding: EdgeInsets.all(25),
          height: context.cHeight / 2,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(data?.posterPath ?? ''),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  Get.back();
                  print('hellllooooooooooooooooo');
                  logic.update();
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white).cPadOnly(l: 5),
                ),
              ).cPadOnly(t: 10),
              GestureDetector(
                onTap: () {
                  logic.toggleWishlist(logic.index.value);
                  logic.update();
                },
                child: Obx(
                      () => Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite,
                      size: 20,
                      color: logic.favouriteButton.value ? Colors.red : Colors.white,
                    ),
                  ),
                ),
              ).cPadOnly(t: 10),
            ],
          ),
        );
      }
    );
  }
}

class GradientOverlayPart extends StatelessWidget {
  const GradientOverlayPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            primaryColor.withOpacity(0.6),
            primaryColor,
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
    );
  }
}

class DateAndDetails extends StatelessWidget {
  const DateAndDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieDetailsController>(
      builder: (logic) {
        var data = logic.moviesModelClass?.data?[logic.index.value];
        print('fffffffffffffffff ${logic.index.value}');
        return Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8, // space between items
          runSpacing: 6, // space between lines when wrapping
          children: [
            _buildDetail(data?.releaseDate ?? ''),
            _buildDivider(),
            _buildDetail("Popularity : ${data?.popularity ?? ''}"),
            _buildDivider(),
            _buildDetail((data?.originalLanguage == 'en') ? 'English' :data?.originalLanguage ?? ''),
            // _buildDivider(),
            // _buildDetail("Title : Barely Lethal"),
          ],
        );
      }
    );
  }

  Widget _buildDetail(String text) {
    return Text(text, style: customStyle(14, Colors.white, FontWeight.w200));
  }

  Widget _buildDivider() {
    return Container(height: 15, width: 1, color: Colors.grey);
  }
}

class OverviewPart extends StatelessWidget {
  const OverviewPart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieDetailsController>(
      builder: (logic) {
        var data = logic.moviesModelClass?.data?[logic.index.value];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Overview',
              style: customStyle(16, Colors.white, FontWeight.bold),
            ).cPadOnly(b: 5),
            Text(
              data?.overview ?? '',
              style: customStyle(14, Colors.white, FontWeight.w300),
            ),
          ],
        );
      }
    );
  }
}

class CastingList extends StatelessWidget {
  const CastingList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieDetailsController>(
      builder: (logic) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Casts',
              style: customStyle(16, Colors.white, FontWeight.bold),
            ).cPadOnly(b: 10),

            SizedBox(
              height: 155,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  var data = logic.moviesModelClass?.data?[logic.index.value].casts?[i];
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        ClipOval(
                          child: Image.network(
                            data?.profilePath ?? '',
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          data?.name ?? '',
                          style: customStyle(14, Colors.white, FontWeight.bold),
                        ).cPadOnly(t: 10),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }
    );
  }
}
