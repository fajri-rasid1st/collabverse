// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:collabverse/core/extensions/text_style_extension.dart';
import 'package:collabverse/core/utils/asset_path.dart';
import 'package:collabverse/core/utils/navigator_key.dart';
import 'package:collabverse/src/shared/widgets/svg_asset.dart';

class CvAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double? titleSpacing;
  final bool automaticallyImplyLeading;
  final Widget? leading;
  final List<Widget>? actions;

  const CvAppBar({
    super.key,
    required this.title,
    this.titleSpacing,
    this.automaticallyImplyLeading = true,
    this.leading,
    this.actions,
  }) : assert(
         !automaticallyImplyLeading || leading == null,
         'Cannot provide a leading widget when automaticallyImplyLeading is true.',
       );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: preferredSize.height,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: TextTheme.of(context).titleLarge!.bold.colorPrimary(context),
      ),
      titleSpacing: titleSpacing ?? 0,
      leading:
          leading ??
          (automaticallyImplyLeading
              ? IconButton(
                  onPressed: () => navigatorKey.currentState!.pop(),
                  icon: SvgAsset(
                    AssetPath.getIcon('ph_arrow_left_bold.svg'),
                  ),
                )
              : null),
      actions: actions,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Divider(
          height: 1,
          thickness: 1,
          color: Theme.of(context).disabledColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(66);
}
