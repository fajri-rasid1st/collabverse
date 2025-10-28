// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:collabverse/core/extensions/text_style_extension.dart';
import 'package:collabverse/core/utils/asset_path.dart';
import 'package:collabverse/src/data/models/event_board_model.dart';
import 'package:collabverse/src/shared/widgets/svg_asset.dart';

class EventBoardCard extends StatelessWidget {
  final EventBoardModel event;
  final VoidCallback? onTap;

  const EventBoardCard({
    super.key,
    required this.event,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final bool isOpen = event.status.toLowerCase() == 'open';

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 1,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: colorScheme.outlineVariant.withValues(alpha: .5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(context),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.name,
                    style: textTheme.titleSmall!.bold,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Chip(
                        label: Text(event.status),
                        backgroundColor: isOpen ? colorScheme.secondaryContainer : colorScheme.errorContainer,
                        labelStyle: textTheme.labelSmall!.bold.copyWith(
                          color: isOpen ? colorScheme.secondary : colorScheme.error,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        visualDensity: VisualDensity.compact,
                      ),
                      const SizedBox(width: 8),
                      SvgAsset(
                        AssetPath.getIcon('ph_gps_fix_bold.svg'),
                        width: 14,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 4),
                      Text('2.8 km', style: textTheme.labelSmall!.colorOnSurfaceVariant(context)),
                      const SizedBox(width: 8),
                      SvgAsset(AssetPath.getIcon('ph_users_bold.svg'), width: 14, color: colorScheme.onSurfaceVariant),
                      const SizedBox(width: 4),
                      Text('${event.totalNeeds} orang', style: textTheme.labelSmall!.colorOnSurfaceVariant(context)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text('Score', style: textTheme.labelSmall!.colorOnSurfaceVariant(context)),
                  Text(
                    '99%', // Dummy score
                    style: textTheme.titleLarge!.bold.colorPrimary(context),
                  ),
                  const SizedBox(height: 8),
                  Text('Lokasi', style: textTheme.labelSmall!.colorOnSurfaceVariant(context)),
                  Text(
                    '${event.venue}, ${event.city}',
                    style: textTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text('Peran', style: textTheme.labelSmall!.colorOnSurfaceVariant(context)),
                  Text(
                    event.roles.join(', '),
                    style: textTheme.bodySmall,
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

  Widget _buildImage(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: colorScheme.outlineVariant,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Center(
            child: Image.asset(
              AssetPath.getIcon('ic_cv_primary.png'),
              width: 50,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Chip(
            label: Text(event.domain),
            backgroundColor: colorScheme.surface,
            labelStyle: Theme.of(context).textTheme.labelSmall!.bold,
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
          ),
        ),
      ],
    );
  }
}
