import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:movie_mate/res/colors.dart';
import 'package:movie_mate/res/images.dart';
import 'package:movie_mate/res/style.dart';
import 'package:movie_mate/ui/wishlist/view/more.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "My Wishlist",
          style: customStyle(18, Colors.white, FontWeight.bold),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5), // circular bg
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                size: 18,
                color: Colors.white,
              ).cPadOnly(l: 5,t: 1),
            ),
          ),
        ),
      ),
      backgroundColor: primaryColor,
      body: ListViewPart(),
    );
  }
}
