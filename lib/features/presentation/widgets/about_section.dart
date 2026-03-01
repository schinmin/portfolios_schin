import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolios_schin/features/data/models/user_model.dart';
import 'package:portfolios_schin/features/data/utils/responsive_helper.dart';

class AboutSection extends StatelessWidget {
  final GlobalKey key;
  final UserModel user = UserModel();

  AboutSection({required this.key}) : super(key: key);

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
                  'About Me',
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
          Column(
            children: [
              if (!isMobile) ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: _buildAboutText(context),
                    ),
                    Expanded(
                      flex: 2,
                      child: _buildStatsColumn(context),
                    ),
                  ],
                ),
              ] else ...[
                _buildAboutText(context),
                SizedBox(height: 30),
                _buildStatsColumn(context),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAboutText(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Who am I?',
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 20 : 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 20),
        Text(
          user.bio,
          style: GoogleFonts.inter(
            fontSize: isMobile ? 14 : 16,
            height: 1.8,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 20),
        Text(
          'I\'m currently working at ${user.company} as a ${user.position}, building amazing mobile applications with Flutter. I graduated from ${user.university} with a degree in ${user.major}.',
          style: GoogleFonts.inter(
            fontSize: isMobile ? 14 : 16,
            height: 1.8,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 30),
        _buildInfoRow('Name:', user.name,context),
        _buildInfoRow('University:', user.university,context),
        _buildInfoRow('Major:', user.major,context),
        _buildInfoRow('Current Position:', '${user.position} at ${user.company}',context),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value , BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: isMobile ? 100 : 120,
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: isMobile ? 14 : 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.inter(
                fontSize: isMobile ? 14 : 16,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsColumn(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Column(
      children: [
        _buildStatCard('3+', 'Years Experience', isMobile),
        SizedBox(height: isMobile ? 15 : 20),
        _buildStatCard('15+', 'Projects Completed', isMobile),
        SizedBox(height: isMobile ? 15 : 20),
        _buildStatCard('10+', 'Happy Clients', isMobile),
        SizedBox(height: isMobile ? 15 : 20),
        _buildStatCard('5+', 'Technologies', isMobile),
      ],
    );
  }

  Widget _buildStatCard(String number, String label, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 20 : 25),
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
          Text(
            number,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 14 : 16,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}