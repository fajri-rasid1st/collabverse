// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

// Project imports:
import 'package:collabverse/core/extensions/text_style_extension.dart';
import 'package:collabverse/core/utils/asset_path.dart';
import 'package:collabverse/src/shared/widgets/svg_asset.dart';

class CvTextField extends StatefulWidget {
  final bool enabled;
  final bool readOnly;
  final String name;
  final String label;
  final String? initialValue;
  final String? hintText;
  final int maxLines;
  final TextInputType? textInputType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final String? prefixIconName;
  final String? prefixText;
  final String? suffixIconName;
  final String? suffixText;
  final List<String? Function(String?)>? validators;
  final VoidCallback? onTap;
  final VoidCallback? onSuffixIconTap;
  final ValueChanged<String?>? onChanged;

  const CvTextField({
    super.key,
    this.enabled = true,
    this.readOnly = false,
    required this.name,
    required this.label,
    this.initialValue,
    this.hintText,
    this.maxLines = 1,
    this.textInputType,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.sentences,
    this.prefixIconName,
    this.prefixText,
    this.suffixIconName,
    this.suffixText,
    this.validators,
    this.onTap,
    this.onSuffixIconTap,
    this.onChanged,
  });

  @override
  State<CvTextField> createState() => _CvTextFieldState();
}

class _CvTextFieldState extends State<CvTextField> {
  late final ValueNotifier<bool> isFocus;

  @override
  void initState() {
    super.initState();

    isFocus = ValueNotifier(false);
  }

  @override
  void dispose() {
    isFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextTheme.of(context).labelMedium!.semiBold,
        ),
        Focus(
          onFocusChange: (value) => isFocus.value = value,
          child: FormBuilderTextField(
            enabled: widget.enabled,
            readOnly: widget.readOnly,
            name: widget.name,
            initialValue: widget.initialValue,
            maxLines: widget.maxLines,
            keyboardType: widget.textInputType,
            textInputAction: widget.textInputAction,
            textCapitalization: widget.textCapitalization,
            textAlignVertical: TextAlignVertical.center,
            obscureText: widget.textInputType == TextInputType.visiblePassword,
            style: TextTheme.of(context).bodyMedium!.colorOnSurface(context),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintMaxLines: widget.maxLines,
              hintStyle: TextTheme.of(context).bodyMedium!.colorOutlineVariant(context),
              contentPadding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              prefixIcon: widget.prefixIconName != null
                  ? Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 10, 0),
                      child: SvgAsset(
                        AssetPath.getIcon(widget.prefixIconName!),
                        color: ColorScheme.of(context).onSurface,
                        width: 20,
                      ),
                    )
                  : null,
              prefixText: widget.prefixText,
              prefixStyle: TextTheme.of(context).bodyMedium!.semiBold.colorOnSurface(context),
              suffixIcon: widget.suffixIconName != null
                  ? Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 16, 0),
                      child: GestureDetector(
                        onTap: widget.onSuffixIconTap,
                        child: SvgAsset(
                          AssetPath.getIcon(widget.suffixIconName!),
                          color: ColorScheme.of(context).onSurface,
                          width: 20,
                        ),
                      ),
                    )
                  : null,
              suffixText: widget.suffixText,
              suffixStyle: TextTheme.of(context).bodyMedium!.semiBold.colorOnSurface(context),
            ),
            validator: widget.validators != null ? FormBuilderValidators.compose(widget.validators!) : null,
            onTap: widget.onTap,
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }
}
