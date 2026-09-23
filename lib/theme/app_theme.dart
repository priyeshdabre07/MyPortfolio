import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand & Background Palette
  static const Color bgDark = Color(0xFF080C14);
  static const Color bgSurface = Color(0xFF0E1524);
  static const Color bgCard = Color(0xFF131D31);
  static const Color bgCardHover = Color(0xFF18243C);

  // Accents
  static const Color accentMint = Color(0xFF00F5A0);
  static const Color accentCyan = Color(0xFF00D2FF);
  static const Color accentEmerald = Color(0xFF10B981);
  static const Color accentIndigo = Color(0xFF6366F1);

  // Text
  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFF64748B);

  // Borders
  static const Color borderSubtle = Color(0x1E94A3B8);
  static const Color borderHover = Color(0x5500F5A0);

  // Gradients
  static const LinearGradient mintCyanGradient = LinearGradient(
    colors: [accentMint, accentCyan],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF141E34), Color(0xFF0E1626)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient glowGradient = LinearGradient(
    colors: [Color(0x3300F5A0), Color(0x1500D2FF), Colors.transparent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: bgDark,
      primaryColor: accentMint,
      canvasColor: bgDark,
      colorScheme: const ColorScheme.dark(
        primary: accentMint,
        secondary: accentCyan,
        surface: bgSurface,
      ),
      textTheme: GoogleFonts.plusJakartaSansTextTheme(
        ThemeData.dark().textTheme,
      ).apply(
        bodyColor: textPrimary,
        displayColor: textPrimary,
      ),
    );
  }
}
