import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolios_schin/features/data/models/user_model.dart';
import 'package:portfolios_schin/features/data/utils/responsive_helper.dart';


class EducationSection extends StatelessWidget {
  final GlobalKey key;
  final UserModel user = UserModel();

  EducationSection({required this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final padding = ResponsiveHelper.getResponsivePadding(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: isMobile ? 40 : 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  'Education',
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 28 : 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6C63FF),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: isMobile ? 80 : 100,
                  height: 4,
                  color: Color(0xFF6C63FF),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.all(isMobile ? 20 : 30),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6C63FF), Color(0xFF4A44B3)],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF6C63FF).withOpacity(0.3),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(isMobile ? 15 : 20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.school,
                        size: isMobile ? 30 : 50,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: isMobile ? 15 : 30),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.education[0].degree,
                            style: GoogleFonts.poppins(
                              fontSize: isMobile ? 18 : 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            user.education[0].institution,
                            style: GoogleFonts.poppins(
                              fontSize: isMobile ? 14 : 18,
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            user.education[0].duration,
                            style: GoogleFonts.inter(
                              fontSize: isMobile ? 12 : 16,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isMobile ? 15 : 20),
                Text(
                  user.education[0].description,
                  style: GoogleFonts.inter(
                    fontSize: isMobile ? 13 : 15,
                    color: Colors.white.withOpacity(0.9),
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}