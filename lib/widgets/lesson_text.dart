import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import '../theme/app_theme.dart';

/// Renders a lesson text: paragraphs separated by blank lines, `$$...$$`
/// paragraphs as displayed formulas, `$...$` as inline formulas, and
/// `*italic*` / `**bold**` in the prose.
class LessonText extends StatelessWidget {
  final String text;
  final double fontSize;
  const LessonText(this.text, {super.key, this.fontSize = 16.5});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(fontSize: fontSize, height: 1.6, color: AppColors.textPrimary);
    final paragraphs = text.trim().split(RegExp(r'\n\s*\n'));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final p in paragraphs)
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: _isDisplay(p) ? _DisplayMath(_stripDisplay(p), fontSize: fontSize) : _paragraph(p, style),
          ),
      ],
    );
  }

  static bool _isDisplay(String p) {
    final t = p.trim();
    return t.startsWith(r'$$') && t.endsWith(r'$$') && t.length > 4;
  }

  static String _stripDisplay(String p) {
    final t = p.trim();
    return t.substring(2, t.length - 2);
  }

  Widget _paragraph(String p, TextStyle style) {
    return Text.rich(TextSpan(style: style, children: parseInline(p, style)));
  }

  /// Splits prose into text and inline-formula spans.
  static List<InlineSpan> parseInline(String p, TextStyle style) {
    final spans = <InlineSpan>[];
    final parts = p.split(r'$');
    for (var i = 0; i < parts.length; i++) {
      final part = parts[i];
      if (part.isEmpty) continue;
      // Odd parts sit between a pair of $ signs.
      if (i.isOdd && i < parts.length - 1) {
        final math = Math.tex(
          part,
          mathStyle: MathStyle.text,
          textStyle: style.copyWith(height: 1),
          onErrorFallback: (_) => Text(part, style: style.copyWith(fontFamily: 'monospace')),
        );
        // Split long formulas at operators and relations so they wrap like
        // words instead of running off the edge of the screen.
        List<Widget> pieces;
        try {
          pieces = math.texBreak().parts;
        } catch (_) {
          pieces = [math];
        }
        for (var k = 0; k < pieces.length; k++) {
          final piece = pieces[k];
          // Splitting drops the space after '=' or '+'; put it back, which
          // also lets the line wrap there.
          if (k > 0) spans.add(const TextSpan(text: ' '));
          spans.add(WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            // A piece that cannot be split and is still wider than the line
            // (only on very narrow screens) shrinks to fit.
            child: FittedBox(fit: BoxFit.scaleDown, child: piece),
          ));
        }
      } else {
        spans.addAll(_emphasis(part));
      }
    }
    return spans;
  }

  /// `**bold**` and `*italic*` runs; everything else plain.
  static List<InlineSpan> _emphasis(String text) {
    final spans = <InlineSpan>[];
    final pattern = RegExp(r'\*\*(.+?)\*\*|\*(.+?)\*');
    var pos = 0;
    for (final m in pattern.allMatches(text)) {
      if (m.start > pos) spans.add(TextSpan(text: text.substring(pos, m.start)));
      if (m.group(1) != null) {
        spans.add(TextSpan(text: m.group(1), style: const TextStyle(fontWeight: FontWeight.w700)));
      } else {
        spans.add(TextSpan(text: m.group(2), style: const TextStyle(fontStyle: FontStyle.italic)));
      }
      pos = m.end;
    }
    if (pos < text.length) spans.add(TextSpan(text: text.substring(pos)));
    return spans;
  }
}

/// A displayed formula, centred, scrolling sideways when wider than the screen.
class _DisplayMath extends StatelessWidget {
  final String tex;
  final double fontSize;
  const _DisplayMath(this.tex, {required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, box) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: box.maxWidth),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Math.tex(
                tex,
                mathStyle: MathStyle.display,
                textStyle: TextStyle(fontSize: fontSize, color: AppColors.textPrimary),
                onErrorFallback: (_) => Text(tex,
                    style: TextStyle(fontSize: fontSize - 3, fontFamily: 'monospace', color: AppColors.textSecondary)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
