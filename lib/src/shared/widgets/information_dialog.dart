// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:collabverse/core/extensions/text_style_extension.dart';
import 'package:collabverse/core/utils/asset_path.dart';
import 'package:collabverse/src/shared/widgets/svg_asset.dart';

class InformationDialog extends StatelessWidget {
  const InformationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      contentPadding: const EdgeInsets.all(24),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgAsset(
            AssetPath.getIcon('ph_info.svg'),
            width: 32,
            color: colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Bagaimana Sistem Rekomendasi Bekerja?',
            textAlign: TextAlign.center,
            style: textTheme.titleLarge!.bold.colorPrimary(context),
          ),
          const SizedBox(height: 8),
          Text(
            'Daftar rekomendasi Event Board atau Project Brief yang muncul disesuaikan dengan bidang minat, lokasi terdekat, dan peran yang sesuai denganmu.',
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Mengerti'),
            ),
          ),
        ],
      ),
    );
  }
}
