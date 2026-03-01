import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolios_schin/features/data/models/user_model.dart';
import 'package:portfolios_schin/features/data/utils/responsive_helper.dart';
import 'package:url_launcher/url_launcher.dart';


class ContactSection extends StatelessWidget {
  final GlobalKey key;
  final UserModel user = UserModel();

  ContactSection({required this.key}) : super(key: key);

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
                  'Get In Touch',
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
                      flex: 2,
                      child: _buildContactInfo(context),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      flex: 3,
                      child: _buildContactForm(context),
                    ),
                  ],
                ),
              ] else ...[
                _buildContactInfo(context),
                SizedBox(height: 30),
                _buildContactForm(context),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Column(
      children: [
        _buildContactCard(
          context,
          icon: FontAwesomeIcons.envelope,
          title: 'Email',
          value: user.email,
          onTap: () async {
            final url = 'mailto:${user.email}';
            if (await canLaunch(url)) {
              await launch(url);
            }
          },
        ),
        SizedBox(height: isMobile ? 15 : 20),
        _buildContactCard(
          context,
          icon: FontAwesomeIcons.github,
          title: 'GitHub',
          value: 'github.com/shaneminkhant',
          onTap: () async {
            if (await canLaunch(user.github)) {
              await launch(user.github);
            }
          },
        ),
        SizedBox(height: isMobile ? 15 : 20),
        _buildContactCard(
          context,
          icon: FontAwesomeIcons.linkedin,
          title: 'LinkedIn',
          value: 'linkedin.com/in/shaneminkhant',
          onTap: () async {
            if (await canLaunch(user.linkedin)) {
              await launch(user.linkedin);
            }
          },
        ),
      ],
    );
  }

  Widget _buildContactCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(isMobile ? 15 : 20),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(isMobile ? 8 : 12),
              decoration: BoxDecoration(
                color: Color(0xFF6C63FF).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: FaIcon(
                icon,
                color: Color(0xFF6C63FF),
                size: isMobile ? 18 : 24,
              ),
            ),
            SizedBox(width: isMobile ? 10 : 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 12 : 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    value,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 13 : 16,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 30),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send Me a Message',
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 18 : 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: isMobile ? 15 : 20),
          TextField(
            decoration: InputDecoration(
              labelText: 'Name',
              labelStyle: GoogleFonts.poppins(fontSize: isMobile ? 13 : 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey[100]
                  : Colors.grey[900],
              contentPadding: EdgeInsets.all(isMobile ? 12 : 15),
            ),
          ),
          SizedBox(height: isMobile ? 12 : 15),
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: GoogleFonts.poppins(fontSize: isMobile ? 13 : 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey[100]
                  : Colors.grey[900],
              contentPadding: EdgeInsets.all(isMobile ? 12 : 15),
            ),
          ),
          SizedBox(height: isMobile ? 12 : 15),
          TextField(
            maxLines: isMobile ? 3 : 5,
            decoration: InputDecoration(
              labelText: 'Message',
              labelStyle: GoogleFonts.poppins(fontSize: isMobile ? 13 : 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey[100]
                  : Colors.grey[900],
              contentPadding: EdgeInsets.all(isMobile ? 12 : 15),
            ),
          ),
          SizedBox(height: isMobile ? 15 : 20),
          ElevatedButton(
            onPressed: () {
              // Handle send message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Message sent successfully!'),
                  backgroundColor: Color(0xFF6C63FF),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF6C63FF),
              minimumSize: Size(double.infinity, isMobile ? 45 : 50),
              padding: EdgeInsets.symmetric(vertical: isMobile ? 12 : 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Send Message',
              style: GoogleFonts.poppins(
                fontSize: isMobile ? 14 : 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}