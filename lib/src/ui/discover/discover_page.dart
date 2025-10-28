// Flutter imports:
import 'package:collabverse/core/routes/route_names.dart';
import 'package:collabverse/core/extensions/text_style_extension.dart';
import 'package:collabverse/core/utils/asset_path.dart';
import 'package:collabverse/core/utils/navigator_key.dart';
import 'package:collabverse/src/data/dummy_event_board.dart';
import 'package:collabverse/src/shared/widgets/event_board_card.dart';
import 'package:collabverse/src/shared/widgets/scaffold_safe_area.dart';
import 'package:collabverse/src/shared/widgets/svg_asset.dart';
import 'package:collabverse/src/shared/widgets/information_dialog.dart';
import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return ScaffoldSafeArea(
      safeAreaBottom: false,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text('Event Board', style: textTheme.headlineSmall!.bold),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: SvgAsset(AssetPath.getIcon('ph_magnifying_glass_bold.svg')),
                ),
              ],
              pinned: true,
              floating: true,
              bottom: TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Rekomendasi'),
                  Tab(text: 'Semua'),
                  Tab(text: 'Terdekat'),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildRekomendasiTab(context),
            const Center(child: Text('Semua')),
            const Center(child: Text('Terdekat')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: SvgAsset(AssetPath.getIcon('ph_plus_bold.svg')),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildRekomendasiTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildInfoBanner(context),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.55,
            ),
            itemCount: dummyEvents.length,
            itemBuilder: (context, index) {
              final event = dummyEvents[index];
              return EventBoardCard(
                event: event,
                onTap: () => navigatorKey.currentState!.pushNamed(
                  Routes.eventBoardDetail,
                  arguments: {'event': event},
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBanner(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => const InformationDialog(),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: theme.colorScheme.secondaryContainer.withValues(alpha: .5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            SvgAsset(
              AssetPath.getIcon('ph_info.svg'),
              color: theme.colorScheme.onSecondaryContainer,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Bagaimana sistem rekomendasi bekerja?',
                style: theme.textTheme.bodySmall!.copyWith(color: theme.colorScheme.onSecondaryContainer),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 14, color: theme.colorScheme.onSecondaryContainer),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return BottomNavigationBar(
      currentIndex: 1, // Discover page
      onTap: (index) {
        // Handle navigation
      },
      items: [
        BottomNavigationBarItem(
          icon: SvgAsset(AssetPath.getIcon('ph_blueprint_bold.svg')),
          activeIcon: SvgAsset(AssetPath.getIcon('ph_blueprint_fill.svg'), color: colorScheme.primary),
          label: 'Project Brief',
        ),
        BottomNavigationBarItem(
          icon: SvgAsset(AssetPath.getIcon('ph_presentation_chart_bold.svg')),
          activeIcon: SvgAsset(AssetPath.getIcon('ph_presentation_chart_fill.svg'), color: colorScheme.primary),
          label: 'Event Board',
        ),
        BottomNavigationBarItem(
          icon: SvgAsset(AssetPath.getIcon('ph_paper_plane_tilt.svg')), // Placeholder for chat
          activeIcon: SvgAsset(AssetPath.getIcon('ph_paper_plane_tilt.svg'), color: colorScheme.primary),
          label: 'Pesan',
        ),
        BottomNavigationBarItem(
          icon: SvgAsset(AssetPath.getIcon('ph_user_bold.svg')),
          activeIcon: SvgAsset(AssetPath.getIcon('ph_user_bold.svg'), color: colorScheme.primary),
          label: 'Profil',
        ),
      ],
    );
  }
}
