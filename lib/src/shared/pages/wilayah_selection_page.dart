// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:collabverse/core/enums/result_state.dart';
import 'package:collabverse/core/enums/wilayah_type.dart';
import 'package:collabverse/core/extensions/button_extension.dart';
import 'package:collabverse/core/extensions/text_style_extension.dart';
import 'package:collabverse/core/utils/asset_path.dart';
import 'package:collabverse/core/utils/navigator_key.dart';
import 'package:collabverse/src/data/models/wilayah_model.dart';
import 'package:collabverse/src/providers/api_providers/wilayah_api_provider.dart';
import 'package:collabverse/src/shared/widgets/custom_information.dart';
import 'package:collabverse/src/shared/widgets/cv/cv_app_bar.dart';
import 'package:collabverse/src/shared/widgets/loading_indicator.dart';
import 'package:collabverse/src/shared/widgets/scaffold_safe_area.dart';
import 'package:collabverse/src/shared/widgets/svg_asset.dart';

class WilayahSelectionPage extends StatefulWidget {
  final WilayahType type;
  final WilayahModel? initialValue;
  final WilayahModel? province;

  const WilayahSelectionPage({
    super.key,
    required this.type,
    this.initialValue,
    this.province,
  }) : assert(
         type != WilayahType.city || province != null,
         'province must not be null when type is WilayahType.city',
       );

  @override
  State<WilayahSelectionPage> createState() => _WilayahSelectionPageState();
}

class _WilayahSelectionPageState extends State<WilayahSelectionPage> {
  late final ValueNotifier<WilayahModel?> currentValue;

  @override
  void initState() {
    super.initState();

    // Init current value
    currentValue = ValueNotifier<WilayahModel?>(null);

    // Panggil provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<WilayahApiProvider>();

      if (widget.type == WilayahType.province) {
        provider.getProvinces();
      } else {
        provider.getCities(widget.province!.code);
      }

      currentValue.value = widget.initialValue;
    });
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
        title: widget.type == WilayahType.province ? 'Pilih Provinsi' : 'Pilih Kota/Kabupaten',
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<WilayahApiProvider>(
              builder: (context, provider, child) {
                switch (provider.state) {
                  case ResultState.loading:
                    return LoadingIndicator(radius: 28);
                  case ResultState.error:
                    return CustomInformation(
                      assetName: AssetPath.getVector('404_error_lost_in_space_cuate.svg'),
                      title: 'Gagal Memuat Data',
                      subtitle: provider.message,
                    );
                  case ResultState.success:
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final value = provider.data[index];

                        return ValueListenableBuilder(
                          valueListenable: currentValue,
                          builder: (context, currentValue, child) {
                            return _CustomListTile(
                              selected: currentValue?.code == value.code,
                              label: value.name,
                              value: value.name,
                              onTap: () => this.currentValue.value = value,
                            );
                          },
                        );
                      },
                      itemCount: provider.data.length,
                    );
                }
              },
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
      ),
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
