import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized visual identity. Deep indigo + warm amber accent reads as
/// "study tool" without looking like a generic Material default app.
class AppColors {
  static const Color background = Color(0xFFF7F6F3);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color primary = Color(0xFF2E2A6E); // deep indigo
  static const Color primaryLight = Color(0xFF4B4599);
  static const Color accent = Color(0xFFE8A33D); // warm amber
  static const Color textPrimary = Color(0xFF1C1B29);
  static const Color textSecondary = Color(0xFF6B6880);
  static const Color pdfBadge = Color(0xFFCE4257);
  static const Color videoBadge = Color(0xFF2A9D8F);
  static const Color articleBadge = Color(0xFF3D5A80);
  static const Color divider = Color(0xFFE7E5DF);
}

class AppTheme {
  static ThemeData get light {
    final base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.surface,
      ),
      textTheme: GoogleFonts.interTextTheme(base.textTheme).copyWith(
        headlineSmall: GoogleFonts.spaceGrotesk(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          color: AppColors.textSecondary,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppColors.textPrimary,
      ),
      chipTheme: base.chipTheme.copyWith(
        backgroundColor: AppColors.surface,
        selectedColor: AppColors.primary,
        side: const BorderSide(color: AppColors.divider),
        labelStyle: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w500),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
      cardTheme: base.cardTheme.copyWith(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(color: AppColors.divider),
        ),
      ),
    );
  }
}
