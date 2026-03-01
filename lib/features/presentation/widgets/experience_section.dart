import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolios_schin/features/data/models/user_model.dart';
import 'package:portfolios_schin/features/data/utils/responsive_helper.dart';


class ExperienceSection extends StatelessWidget {
  final GlobalKey key;
  final UserModel user = UserModel();

  ExperienceSection({required this.key}) : super(key: key);

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
                  'Work Experience',
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
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: user.experiences.length,
            itemBuilder: (context, index) {
              final experience = user.experiences[index];
              
              return Container(
                margin: EdgeInsets.only(bottom: isMobile ? 15 : 20),
                padding: EdgeInsets.all(isMobile ? 15 : 25),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.white
                      : Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: isMobile ? 40 : 60,
                          height: isMobile ? 40 : 60,
                          decoration: BoxDecoration(
                            color: Color(0xFF6C63FF).withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.work,
                            color: Color(0xFF6C63FF),
                            size: isMobile ? 20 : 30,
                          ),
                        ),
                        SizedBox(width: isMobile ? 10 : 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                experience.position,
                                style: GoogleFonts.poppins(
                                  fontSize: isMobile ? 16 : 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${experience.company} • ${experience.duration}',
                                style: GoogleFonts.inter(
                                  fontSize: isMobile ? 13 : 16,
                                  color: Color(0xFF6C63FF),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: isMobile ? 8 : 10),
                              Text(
                                experience.description,
                                style: GoogleFonts.inter(
                                  fontSize: isMobile ? 13 : 15,
                                  color: Colors.grey[600],
                                  height: 1.6,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}