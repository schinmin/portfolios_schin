import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolios_schin/features/data/utils/responsive_helper.dart';
import 'package:provider/provider.dart';
import '../widgets/header_section.dart';
import '../widgets/about_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/education_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer_section.dart';
import '../providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = [
    GlobalKey(), // Header
    GlobalKey(), // About
    GlobalKey(), // Skills
    GlobalKey(), // Projects
    GlobalKey(), // Experience
    GlobalKey(), // Education
    GlobalKey(), // Contact
  ];

  void _scrollToSection(int index) {
    final key = _sectionKeys[index];
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    return Scaffold(
      drawer: isMobile ? _buildMobileDrawer() : null,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : Color(0xFF121212),
              Theme.of(context).brightness == Brightness.light
                  ? Color(0xFFF5F5F5)
                  : Color(0xFF1E1E1E),
            ],
          ),
        ),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              expandedHeight: isMobile ? 70 : 80,
              floating: true,
              pinned: true,
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? Colors.white.withOpacity(0.9)
                  : Color(0xFF121212).withOpacity(0.9),
              flexibleSpace: FlexibleSpaceBar(
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SMK',
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 20 : 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6C63FF),
                        ),
                      ),
                      if (!isMobile)
                        Row(
                          children: [
                            _NavButton(
                              label: 'Home',
                              onTap: () => _scrollToSection(0),
                            ),
                            _NavButton(
                              label: 'About',
                              onTap: () => _scrollToSection(1),
                            ),
                            _NavButton(
                              label: 'Skills',
                              onTap: () => _scrollToSection(2),
                            ),
                            _NavButton(
                              label: 'Projects',
                              onTap: () => _scrollToSection(3),
                            ),
                            _NavButton(
                              label: 'Experience',
                              onTap: () => _scrollToSection(4),
                            ),
                            _NavButton(
                              label: 'Contact',
                              onTap: () => _scrollToSection(6),
                            ),
                            IconButton(
                              icon: Icon(
                                Theme.of(context).brightness == Brightness.light
                                    ? Icons.dark_mode
                                    : Icons.light_mode,
                                color: Color(0xFF6C63FF),
                              ),
                              onPressed: () {
                                Provider.of<ThemeProvider>(context, listen: false)
                                    .toggleTheme();
                              },
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                centerTitle: false,
              ),
              actions: isMobile
                  ? [
                      IconButton(
                        icon: Icon(
                          Theme.of(context).brightness == Brightness.light
                              ? Icons.dark_mode
                              : Icons.light_mode,
                          color: Color(0xFF6C63FF),
                        ),
                        onPressed: () {
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme();
                        },
                      ),
                    ]
                  : [],
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                HeaderSection(key: _sectionKeys[0]),
                AboutSection(key: _sectionKeys[1]),
                SkillsSection(key: _sectionKeys[2]),
                ProjectsSection(key: _sectionKeys[3]),
                ExperienceSection(key: _sectionKeys[4]),
                EducationSection(key: _sectionKeys[5]),
                ContactSection(key: _sectionKeys[6]),
                FooterSection(),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileDrawer() {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : Color(0xFF121212),
              Theme.of(context).brightness == Brightness.light
                  ? Color(0xFFF5F5F5)
                  : Color(0xFF1E1E1E),
            ],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF6C63FF),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Shane Min Khant',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Mid Flutter Developer',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(Icons.home, 'Home', () {
              Navigator.pop(context);
              _scrollToSection(0);
            }),
            _buildDrawerItem(Icons.person, 'About', () {
              Navigator.pop(context);
              _scrollToSection(1);
            }),
            _buildDrawerItem(Icons.code, 'Skills', () {
              Navigator.pop(context);
              _scrollToSection(2);
            }),
            _buildDrawerItem(Icons.apps, 'Projects', () {
              Navigator.pop(context);
              _scrollToSection(3);
            }),
            _buildDrawerItem(Icons.work, 'Experience', () {
              Navigator.pop(context);
              _scrollToSection(4);
            }),
            _buildDrawerItem(Icons.school, 'Education', () {
              Navigator.pop(context);
              _scrollToSection(5);
            }),
            _buildDrawerItem(Icons.contact_mail, 'Contact', () {
              Navigator.pop(context);
              _scrollToSection(6);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF6C63FF)),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _NavButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black87
                : Colors.white70,
          ),
        ),
      ),
    );
  }
}