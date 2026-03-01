import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolios_schin/features/presentation/pages/home_page.dart';
import 'package:portfolios_schin/features/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Shane Min Khant - Flutter Developer',
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: Color(0xFF6C63FF),
              scaffoldBackgroundColor: Colors.white,
              fontFamily: GoogleFonts.inter().fontFamily,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black87),
              ),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: Color(0xFF6C63FF),
              scaffoldBackgroundColor: Color(0xFF121212),
              fontFamily: GoogleFonts.inter().fontFamily,
              appBarTheme: AppBarTheme(
                backgroundColor: Color(0xFF121212),
                elevation: 0,
              ),
            ),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}