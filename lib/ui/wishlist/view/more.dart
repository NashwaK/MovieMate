import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:movie_mate/res/images.dart';
import 'package:movie_mate/res/style.dart';

class ListViewPart extends StatelessWidget {
  const ListViewPart({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: 5, // sample wishlist count
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Number
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  "${index + 1}",
                  style: customStyle(
                    14,
                    Colors.white,
                    FontWeight.bold,
                  ),
                ),
              ).cPadOnly(r: 12, t: 5),

              // Poster
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  homeBanner,
                  height: 150,
                  width: 110,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 12),

              // Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Doctor Strange',
                      style: customStyle(16, Colors.white, FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 6),

                    DetailRow(
                      icon: Icons.star,
                      text: "2.5",
                      iconColor: Colors.yellow,
                    ),

                    DetailRow(
                      icon: Icons.date_range_sharp,
                      text: "2010",
                    ),

                    DetailRow(
                      icon: Icons.language,
                      text: "English",
                    ),

                    DetailRow(
                      icon: Icons.title,
                      text: "Drop Dead Gorgeous",
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DetailRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final int maxLines;
  final Color? iconColor; // optional icon color
  final Color? textColor; // optional text color

  const DetailRow({
    super.key,
    required this.icon,
    required this.text,
    this.maxLines = 1,
    this.iconColor, // pass color for icon if needed
    this.textColor, // pass color for text if needed
  });

  @override
  Widget build(BuildContext context) {
    final Color finalIconColor = iconColor ?? const Color.fromRGBO(238, 238, 238, 0.7);
    final Color finalTextColor = textColor ?? const Color.fromRGBO(238, 238, 238, 0.7);

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: finalIconColor,
            size: 16,
          ).cPadOnly(r: 5),
          Expanded(
            child: Text(
              text,
              style: customStyle(
                14,
                finalTextColor,
                FontWeight.normal,
              ),
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
