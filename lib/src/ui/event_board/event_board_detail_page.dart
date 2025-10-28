// Flutter imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collabverse/core/extensions/text_style_extension.dart';
import 'package:collabverse/core/utils/asset_path.dart';
import 'package:collabverse/src/data/models/event_board_model.dart';
import 'package:collabverse/src/shared/widgets/cv/cv_app_bar.dart';
import 'package:collabverse/src/shared/widgets/loading_indicator.dart';
import 'package:collabverse/src/shared/widgets/scaffold_safe_area.dart';
import 'package:collabverse/src/shared/widgets/svg_asset.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventBoardDetailPage extends StatelessWidget {
  final EventBoardModel event;

  const EventBoardDetailPage({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return ScaffoldSafeArea(
      appBar: CvAppBar(
        title: event.name,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgAsset(AssetPath.getIcon('ph_bookmark_simple_bold.svg')),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPoster(context),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  const SizedBox(height: 16),
                  _buildOrganizerInfo(context),
                  const SizedBox(height: 16),
                  Text(event.description ?? 'Tidak ada deskripsi.', style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 24),
                  _buildDetailsSection(context),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomButton(context),
    );
  }

  Widget _buildPoster(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: event.posterUrl ?? '',
      height: 200,
      width: double.infinity,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        height: 200,
        color: Theme.of(context).colorScheme.outlineVariant,
        child: const LoadingIndicator(radius: 20),
      ),
      errorWidget: (context, url, error) => Container(
        height: 200,
        color: Theme.of(context).colorScheme.outlineVariant,
        child: Center(
          child: SvgAsset(
            AssetPath.getVector('ic_cv_primary.png'),
            width: 80,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final bool isOpen = event.status.toLowerCase() == 'open';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(event.name, style: textTheme.headlineSmall!.bold),
        const SizedBox(height: 4),
        Text('${event.venue}, ${event.city}', style: textTheme.bodyMedium!.colorOnSurfaceVariant(context)),
        const SizedBox(height: 12),
        Row(
          children: [
            Chip(
              label: Text(event.status),
              backgroundColor: isOpen ? colorScheme.secondaryContainer : colorScheme.errorContainer,
              labelStyle: textTheme.labelMedium!.bold.copyWith(
                color: isOpen ? colorScheme.secondary : colorScheme.error,
              ),
            ),
            const SizedBox(width: 8),
            Chip(
              label: Text(DateFormat('d MMMM yyyy').format(event.startDate)),
              backgroundColor: colorScheme.tertiaryContainer,
              labelStyle: textTheme.labelMedium!.bold.copyWith(color: colorScheme.onTertiaryContainer),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOrganizerInfo(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        const CircleAvatar(
          radius: 24,
          child: Icon(Icons.person),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Yogyakarta Dance Community', style: textTheme.titleSmall!.bold), // Dummy organizer name
            Text(event.domain, style: textTheme.bodySmall!.colorOnSurfaceVariant(context)),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailsSection(BuildContext context) {
    return Column(
      children: [
        _buildDetailRow(context, 'Bidang Minat', event.domain),
        const Divider(),
        _buildDetailRow(context, 'Peran yg Dicari', event.roles.join(', ')),
        const Divider(),
        _buildDetailRow(context, 'Jumlah', '${event.totalNeeds} Orang'),
        const Divider(),
        _buildDetailRow(context, 'Jarak dari Lokasi Anda', '+/- 3.5 km'), // Dummy
        const Divider(),
        _buildDetailRow(context, 'Score Kecocokan', '80%'), // Dummy
        const Divider(),
        _buildDetailRow(context, 'Deadline', DateFormat('d MMMM yyyy').format(event.deadline)),
        const Divider(),
        _buildDetailRow(context, 'Detail Lokasi', event.locationDetail ?? '-'),
        const Divider(),
        _buildDetailRow(context, 'Sosial Media', '-', isLink: true),
      ],
    );
  }

  Widget _buildDetailRow(BuildContext context, String title, String value, {bool isLink = false}) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: textTheme.bodyMedium),
          Text(
            value,
            style: isLink ? textTheme.bodyMedium!.bold.colorPrimary(context) : textTheme.bodyMedium!.bold,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: FilledButton.icon(
        onPressed: () {},
        icon: SvgAsset(AssetPath.getIcon('ph_paper_plane_tilt.svg'), color: Colors.white),
        label: const Text('Hubungi Via WhatsApp'),
      ),
    );
  }
}
