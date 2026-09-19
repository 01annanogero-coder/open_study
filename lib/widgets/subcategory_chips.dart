import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// The auto-generated "Year 1, Sem 1" / "Introduction to Kiswahili" style
/// chips. Tapping one re-runs the search narrowed to that subcategory.
class SubcategoryChips extends StatelessWidget {
  final List<String> subcategories;
  final String? selected;
  final ValueChanged<String?> onSelected;

  const SubcategoryChips({
    super.key,
    required this.subcategories,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (subcategories.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: subcategories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final label = subcategories[index];
          final isSelected = label == selected;
          return ChoiceChip(
            label: Text(label),
            selected: isSelected,
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : AppColors.textPrimary,
            ),
            onSelected: (_) => onSelected(isSelected ? null : label),
          );
        },
      ),
    );
  }
}
