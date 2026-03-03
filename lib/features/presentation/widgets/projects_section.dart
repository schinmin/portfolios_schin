import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolios_schin/features/data/models/user_model.dart';
import 'package:portfolios_schin/features/data/utils/responsive_helper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ProjectsSection extends StatelessWidget {
  final GlobalKey key;
  final UserModel user = UserModel();

  ProjectsSection({required this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final padding = ResponsiveHelper.getResponsivePadding(context);
    final crossAxisCount = ResponsiveHelper.isDesktop(context) ? 3 : (isMobile ? 1 : 2);

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
                  'Featured Projects',
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
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: isMobile ? 1.0 : 1.2,
              crossAxisSpacing: isMobile ? 15 : 20,
              mainAxisSpacing: isMobile ? 15 : 20,
            ),
            itemCount: user.projects.length,
            itemBuilder: (context, index) {
              final project = user.projects[index];
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : Color(0xFF1E1E1E),
                      Theme.of(context).brightness == Brightness.light
                          ? Color(0xFFF5F5F5)
                          : Color(0xFF2A2A2A),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: isMobile ? 120 : 150,
                      decoration: BoxDecoration(
                        color: Color(0xFF6C63FF).withOpacity(0.1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.apps,
                          size: isMobile ? 40 : 60,
                          color: Color(0xFF6C63FF),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(isMobile ? 12 : 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project.title,
                              style: GoogleFonts.poppins(
                                fontSize: isMobile ? 16 : 20,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: isMobile ? 5 : 10),
                            Expanded(
                              child: Text(
                                project.description,
                                maxLines: isMobile ? 2 : 3,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(
                                  fontSize: isMobile ? 12 : 14,
                                  color: Colors.grey[600],
                                  height: 1.5,
                                ),
                              ),
                            ),
                            SizedBox(height: isMobile ? 8 : 15),
                            Wrap(
                              spacing: isMobile ? 4 : 8,
                              runSpacing: isMobile ? 4 : 8,
                              children: project.technologies.take(3).map((tech) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isMobile ? 6 : 8,
                                    vertical: isMobile ? 2 : 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF6C63FF).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    tech,
                                    style: GoogleFonts.poppins(
                                      fontSize: isMobile ? 10 : 12,
                                      color: Color(0xFF6C63FF),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            SizedBox(height: isMobile ? 8 : 15),
                            Row(
                              children: [
                                _buildProjectButton(
                                  icon: FontAwesomeIcons.github,
                                  onTap: () async {
                                   final Uri url = Uri.parse(project.githubUrl);
                                   if(!await launchUrl(url,mode: LaunchMode.externalApplication)){
                                    throw Exception("Couldn't lauch $url");
                                   }
                                  },
                                  isMobile: isMobile,
                                ),
                                SizedBox(width: isMobile ? 8 : 10),
                                if (project.liveUrl != null)
                                  _buildProjectButton(
                                    icon: FontAwesomeIcons.arrowUpRightFromSquare,
                                    onTap: () async {
                                       final Uri url = Uri.parse(project.liveUrl!);
                                   if(!await launchUrl(url,mode: LaunchMode.externalApplication)){
                                    throw Exception("Couldn't lauch $url");
                                   }
                                    },
                                    isMobile: isMobile,
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
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

  Widget _buildProjectButton({
    required IconData icon,
    required VoidCallback onTap,
    required bool isMobile,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: EdgeInsets.all(isMobile ? 6 : 8),
        decoration: BoxDecoration(
          color: Color(0xFF6C63FF).withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: FaIcon(
          icon,
          size: isMobile ? 14 : 16,
          color: Color(0xFF6C63FF),
        ),
      ),
    );
  }
}