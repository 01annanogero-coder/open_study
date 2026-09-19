import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/study_resource.dart';
import '../theme/app_theme.dart';

class ResourceCard extends StatelessWidget {
  final StudyResource resource;
  final VoidCallback onTap;

  const ResourceCard({super.key, required this.resource, required this.onTap});

  Color get _badgeColor {
    switch (resource.type) {
      case ResourceType.pdf:
        return AppColors.pdfBadge;
      case ResourceType.video:
        return AppColors.videoBadge;
      case ResourceType.article:
        return AppColors.articleBadge;
      case ResourceType.unknown:
        return AppColors.textSecondary;
    }
  }

  IconData get _icon {
    switch (resource.type) {
      case ResourceType.pdf:
        return Icons.picture_as_pdf_rounded;
      case ResourceType.video:
        return Icons.play_circle_fill_rounded;
      case ResourceType.article:
        return Icons.article_rounded;
      case ResourceType.unknown:
        return Icons.insert_drive_file_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: resource.thumbnailUrl != null
                    ? CachedNetworkImage(
                        imageUrl: resource.thumbnailUrl!,
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                        errorWidget: (_, __, ___) => _fallbackThumb(),
                      )
                    : _fallbackThumb(),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      resource.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: [
                        _tag(resource.source, AppColors.textSecondary),
                        _tag(resource.license, AppColors.accent),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fallbackThumb() => Container(
        width: 64,
        height: 64,
        color: _badgeColor.withOpacity(0.12),
        child: Icon(_icon, color: _badgeColor),
      );

  Widget _tag(String text, Color color) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: color.withOpacity(0.12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      );
}
