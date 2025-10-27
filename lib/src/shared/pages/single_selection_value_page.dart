// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:collabverse/core/enums/data_source_mode.dart';
import 'package:collabverse/core/extensions/button_extension.dart';
import 'package:collabverse/core/extensions/text_style_extension.dart';
import 'package:collabverse/core/utils/asset_path.dart';
import 'package:collabverse/core/utils/navigator_key.dart';
import 'package:collabverse/src/shared/widgets/cv/cv_app_bar.dart';
import 'package:collabverse/src/shared/widgets/scaffold_safe_area.dart';
import 'package:collabverse/src/shared/widgets/svg_asset.dart';

class SingleSelectionValuePage extends StatefulWidget {
  final String appBarTitle;
  final List<String>? values;
  final String? initialValue;
  final VoidCallback? dataFetch;
  final DataSourceMode mode;

  const SingleSelectionValuePage({
    super.key,
    required this.appBarTitle,
    this.values,
    this.initialValue,
    this.dataFetch,
    this.mode = DataSourceMode.local,
  }) : assert(
         (mode == DataSourceMode.local && values != null && dataFetch == null) ||
             (mode == DataSourceMode.remote && dataFetch != null && values == null),
         'Either values or dataFetch must be provided, but not both.',
       );

  @override
  State<SingleSelectionValuePage> createState() => _SingleSelectionValuePageState();
}

class _SingleSelectionValuePageState extends State<SingleSelectionValuePage> {
  late final ValueNotifier<String?> currentValue;

  @override
  void initState() {
    super.initState();

    currentValue = ValueNotifier<String?>(widget.initialValue);
  }

  @override
  void dispose() {
    currentValue.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldSafeArea(
      appBar: CvAppBar(
        title: widget.appBarTitle,
      ),
      body: widget.mode == DataSourceMode.local
          ? Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final value = widget.values![index];

                      return ValueListenableBuilder(
                        valueListenable: currentValue,
                        builder: (context, currentValue, child) {
                          return _CustomListTile(
                            selected: currentValue == value,
                            label: value,
                            value: value,
                            onTap: () => this.currentValue.value = value,
                          );
                        },
                      );
                    },
                    itemCount: widget.values!.length,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  color: ColorScheme.of(context).primaryContainer,
                  child: ValueListenableBuilder(
                    valueListenable: currentValue,
                    builder: (context, currentValue, child) {
                      return FilledButton(
                        onPressed: currentValue != null ? () => navigatorKey.currentState!.pop(currentValue) : null,
                        child: Text('Lanjutkan'),
                      ).expand();
                    },
                  ),
                ),
              ],
            )
          : null,
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final bool selected;
  final String label;
  final String value;
  final VoidCallback onTap;

  const _CustomListTile({
    required this.selected,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).disabledColor,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: TextTheme.of(context).bodyMedium!.bold,
                ),
              ),
              if (selected) ...[
                SizedBox(width: 8),
                SvgAsset(
                  AssetPath.getIcon('ph_check_bold.svg'),
                ),
              ],
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: !selected ? onTap : null,
            ),
          ),
        ),
      ],
    );
  }
}
