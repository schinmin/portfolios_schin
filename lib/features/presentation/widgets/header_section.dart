import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolios_schin/features/data/models/user_model.dart';
import 'package:portfolios_schin/features/data/utils/responsive_helper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HeaderSection extends StatelessWidget {
  final UserModel user = UserModel();
  final GlobalKey key;

  HeaderSection({required this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final padding = ResponsiveHelper.getResponsivePadding(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: isMobile ? 40 : 80,
      ),
      child: Column(
        children: [
          if (isMobile) ...[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Color(0xFF6C63FF).withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFF6C63FF), Color(0xFF4A44B3)],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'SMK',
                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
          Column(
            crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, I\'m',
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 20 : 24,
                  color: Colors.grey[600],
                ),
                textAlign: isMobile ? TextAlign.center : TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                user.name,
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 36 : 56,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6C63FF),
                ),
                textAlign: isMobile ? TextAlign.center : TextAlign.left,
              ),
              SizedBox(height: 10),
              Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      user.title,
                      textStyle: GoogleFonts.poppins(
                        fontSize: isMobile ? 20 : 28,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black87
                            : Colors.white70,
                      ),
                      speed: Duration(milliseconds: 100),
                    ),
                    TyperAnimatedText(
                      'Computer Science Graduate',
                      textStyle: GoogleFonts.poppins(
                        fontSize: isMobile ? 20 : 28,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black87
                            : Colors.white70,
                      ),
                      speed: Duration(milliseconds: 100),
                    ),
                    TyperAnimatedText(
                      'From UCS Meiktila',
                      textStyle: GoogleFonts.poppins(
                        fontSize: isMobile ? 20 : 28,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black87
                            : Colors.white70,
                      ),
                      speed: Duration(milliseconds: 100),
                    ),
                  ],
                  repeatForever: true,
                  //textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Text(
                user.bio,
                style: GoogleFonts.inter(
                  fontSize: isMobile ? 14 : 16,
                  height: 1.6,
                  color: Colors.grey[600],
                ),
                textAlign: isMobile ? TextAlign.center : TextAlign.left,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
                children: [
                  _buildSocialButton(
                    icon: FontAwesomeIcons.github,
                    url: user.github,
                  ),
                  SizedBox(width: 15),
                  _buildSocialButton(
                    icon: FontAwesomeIcons.linkedin,
                    url: user.linkedin,
                  ),
                  SizedBox(width: 15),
                  _buildSocialButton(
                    icon: FontAwesomeIcons.twitter,
                    url: user.twitter,
                  ),
                  SizedBox(width: 15),
                  _buildSocialButton(
                    icon: FontAwesomeIcons.envelope,
                    url: 'mailto:${user.email}',
                  ),
                ],
              ),
              SizedBox(height: 40),
              if (isMobile) ...[
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () async{
                         Uri url = Uri.parse("https://drive.google.com/file/d/1J-cSc2ofeYdIH3ONQ5aZdCd3uEmcHLA5/view?usp=drive_link");
                         if(!await launchUrl(url,mode: LaunchMode.externalApplication)){
                           throw Exception("Couldn't launch this $url");
                         }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF6C63FF),
                        minimumSize: Size(double.infinity, 50),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Download Resume',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    OutlinedButton(
                      onPressed: () {
                        // Scroll to contact
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Color(0xFF6C63FF),
                        side: BorderSide(color: Color(0xFF6C63FF), width: 2),
                        minimumSize: Size(double.infinity, 50),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Contact Me',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ] else ...[
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Download resume
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF6C63FF),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Download Resume',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    OutlinedButton(
                      onPressed: () {
                        // Scroll to contact
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Color(0xFF6C63FF),
                        side: BorderSide(color: Color(0xFF6C63FF), width: 2),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Contact Me',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton({required IconData icon, required String url}) {
    return InkWell(
      onTap: () async {
        if (await canLaunch(url)) {
          await launch(url);
        }
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF6C63FF).withOpacity(0.1),
        ),
        child: FaIcon(
          icon,
          color: Color(0xFF6C63FF),
          size: 20,
        ),
      ),
    );
  }
}