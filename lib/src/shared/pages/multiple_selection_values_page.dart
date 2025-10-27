// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:collabverse/core/extensions/button_extension.dart';
import 'package:collabverse/core/extensions/text_style_extension.dart';
import 'package:collabverse/core/utils/asset_path.dart';
import 'package:collabverse/core/utils/navigator_key.dart';
import 'package:collabverse/src/shared/widgets/cv/cv_app_bar.dart';
import 'package:collabverse/src/shared/widgets/scaffold_safe_area.dart';
import 'package:collabverse/src/shared/widgets/svg_asset.dart';

class MultipleSelectionValuesPage extends StatefulWidget {
  final String appBarTitle;
  final List<String> values;
  final List<String>? initialValues;

  const MultipleSelectionValuesPage({
    super.key,
    required this.appBarTitle,
    required this.values,
    this.initialValues,
  });

  @override
  State<MultipleSelectionValuesPage> createState() => _MultipleSelectionValuesPageState();
}

class _MultipleSelectionValuesPageState extends State<MultipleSelectionValuesPage> {
  late final List<String> currentValue;

  @override
  void initState() {
    super.initState();

    currentValue = widget.initialValues ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldSafeArea(
      appBar: CvAppBar(
        title: widget.appBarTitle,
        actions: [
          IconButton(
            onPressed: () => setState(() {
              if (currentValue.length == widget.values.length) {
                currentValue.clear();
              } else {
                currentValue.clear();
                currentValue.addAll(widget.values);
              }
            }),
            icon: SvgAsset(
              AssetPath.getIcon('ph_checks_bold.svg'),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final value = widget.values[index];

                return _CustomCheckBoxListTile(
                  selected: currentValue.contains(value),
                  label: value,
                  value: value,
                  onTap: () => setState(() {
                    if (currentValue.contains(value)) {
                      currentValue.remove(value);
                    } else {
                      currentValue.add(value);
                    }
                  }),
                );
              },
              itemCount: widget.values.length,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            color: ColorScheme.of(context).primaryContainer,
            child: FilledButton(
              onPressed: currentValue.isNotEmpty ? () => navigatorKey.currentState!.pop(currentValue) : null,
              child: Text('Lanjutkan'),
            ).expand(),
          ),
        ],
      ),
    );
  }
}

class _CustomCheckBoxListTile extends StatelessWidget {
  final bool selected;
  final String label;
  final String value;
  final VoidCallback onTap;

  const _CustomCheckBoxListTile({
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
          padding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
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
              SizedBox(width: 8),
              Checkbox(
                value: selected,
                onChanged: (_) {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                side: BorderSide(
                  color: selected ? ColorScheme.of(context).primary : ColorScheme.of(context).outlineVariant,
                  width: 1.5,
                ),
                visualDensity: VisualDensity(
                  vertical: -4,
                  horizontal: -4,
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
