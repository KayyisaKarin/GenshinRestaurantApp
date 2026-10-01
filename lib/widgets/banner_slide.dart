import 'package:flutter/material.dart';
import 'package:genshin_restaurant_app/models/promo_banner.dart';

class BannerSlide extends StatelessWidget {
  const BannerSlide({super.key, required this.banner});

  final PromoBanner banner;

  @override
  Widget build(BuildContext context) {
    final startColor = banner.gradientColors.isNotEmpty
        ? banner.gradientColors.first
        : const Color(0xFF8C3B14);
    final endColor = banner.gradientColors.length > 1
        ? banner.gradientColors.last
        : const Color(0xFF381608);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [startColor, endColor],
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // 1. Genshin Scenery Background Image (if provided)
              if (banner.bgImageUrl != null && banner.bgImageUrl!.isNotEmpty)
                Positioned.fill(
                  child: Image.network(
                    banner.bgImageUrl!,
                    fit: BoxFit.cover,
                    // Request headers to pass WallpaperCave & Fandom hotlink checks
                    headers: const {
                      'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)',
                      'Referer': 'https://wallpapercave.com/',
                    },
                    errorBuilder: (context, error, stackTrace) =>
                        SizedBox.shrink(),
                  ),
                ),

              // 2. Darkening Nation Tint Overlay so text is readable
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        startColor.withValues(alpha: 0.92),
                        startColor.withValues(alpha: 0.70),
                        endColor.withValues(alpha: 0.40),
                      ],
                    ),
                  ),
                ),
              ),

              // 3. Subtle ambient glow behind the dish
              Positioned(
                right: -10,
                top: -10,
                bottom: -10,
                child: Container(
                  width: 170,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.12),
                  ),
                ),
              ),

              // 4. Foreground Content: Text on Left, Specialty Dish on Right
              Padding(
                padding: EdgeInsets.fromLTRB(20, 16, 16, 16),
                child: Row(
                  children: [
                    // Text Column
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.22),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'SPECIAL FEAST',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9.5,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            banner.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.5,
                              fontWeight: FontWeight.w800,
                              height: 1.15,
                              shadows: [
                                Shadow(
                                  color: Colors.black45,
                                  blurRadius: 4,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            banner.subtitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.92),
                              fontSize: 12,
                              height: 1.3,
                              shadows: const [
                                Shadow(
                                  color: Colors.black38,
                                  blurRadius: 3,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 8),

                    // Dish Image Floating on the Right
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: Hero(
                          tag: 'banner-${banner.title}',
                          child: Image.network(
                            banner.imageUrl,
                            fit: BoxFit.contain,
                            height: 120,
                            width: 120,
                            // Request headers for Fandom wiki dish images
                            headers: const {
                              'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)',
                            },
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                              Icons.restaurant_menu_rounded,
                              size: 48,
                              color: Colors.white54,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}