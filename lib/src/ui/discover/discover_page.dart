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
  late final TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldSafeArea(
      safeAreaBottom: false,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              floating: true,
              title: Text(
                'Event Board',
                style: TextTheme.of(context).titleLarge!.bold.colorPrimary(context),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: SvgAsset(
                    AssetPath.getIcon('ph_magnifying_glass_bold.svg'),
                  ),
                ),
              ],
              actionsPadding: EdgeInsets.only(right: 4),
              bottom: TabBar(
                controller: tabController,
                labelStyle: TextTheme.of(context).titleSmall!.bold,
                labelColor: ColorScheme.of(context).primary,
                unselectedLabelStyle: TextTheme.of(context).bodyMedium!.medium,
                unselectedLabelColor: ColorScheme.of(context).outlineVariant,
                indicatorWeight: 4,
                dividerHeight: .5,
                tabs: [
                  Tab(text: 'Rekomendasi'),
                  Tab(text: 'Semua'),
                  Tab(text: 'Terdekat'),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: [
            _buildRekomendasiTab(context),
            _buildRekomendasiTab(context),
            _buildRekomendasiTab(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigatorKey.currentState!.pushNamed(Routes.eventBoardForm),
        child: SvgAsset(
          AssetPath.getIcon('ph_plus_bold.svg'),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: [
          NavigationDestination(
            label: 'Event Board',
            icon: SvgAsset(
              AssetPath.getIcon('ph_blueprint_bold.svg'),
            ),
            selectedIcon: SvgAsset(
              AssetPath.getIcon('ph_blueprint_fill.svg'),
            ),
          ),
          NavigationDestination(
            label: 'Project Brief',
            icon: SvgAsset(
              AssetPath.getIcon('ph_presentation_chart_bold.svg'),
            ),
            selectedIcon: SvgAsset(
              AssetPath.getIcon('ph_presentation_chart_fill.svg'),
            ),
          ),
          NavigationDestination(
            label: 'Profile',
            icon: SvgAsset(
              AssetPath.getIcon('ph_user_bold.svg'),
            ),
            selectedIcon: SvgAsset(
              AssetPath.getIcon('ph_user_bold.svg'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRekomendasiTab(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => InformationDialog(),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: ColorScheme.of(context).primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  SvgAsset(
                    AssetPath.getIcon('ph_info.svg'),
                    color: ColorScheme.of(context).onPrimaryContainer,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Bagaimana sistem rekomendasi bekerja?',
                      style: TextTheme.of(context).bodySmall!.colorOnPrimaryContainer(context),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: ColorScheme.of(context).onPrimaryContainer,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
}
