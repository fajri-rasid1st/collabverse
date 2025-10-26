// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

// Project imports:
import 'package:collabverse/core/extensions/text_style_extension.dart';
import 'package:collabverse/core/utils/asset_path.dart';
import 'package:collabverse/src/shared/widgets/svg_asset.dart';

class CvTextField extends StatelessWidget {
  final String name;
  final String label;
  final bool enabled;
  final bool readOnly;
  final bool showMaskRequiredLabel;
  final bool obsecureText;
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
    required this.name,
    required this.label,
    this.enabled = true,
    this.readOnly = false,
    this.showMaskRequiredLabel = false,
    this.obsecureText = false,
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
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: label,
                style: TextTheme.of(context).labelMedium!.bold,
              ),
              if (showMaskRequiredLabel)
                TextSpan(
                  text: '*',
                  style: TextTheme.of(context).labelMedium!.bold.colorError(context),
                ),
            ],
          ),
        ),
        FormBuilderTextField(
          enabled: enabled,
          readOnly: readOnly,
          name: name,
          initialValue: initialValue,
          maxLines: maxLines,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization,
          textAlignVertical: TextAlignVertical.center,
          obscureText: obsecureText,
          style: TextTheme.of(context).bodyMedium!.colorOnSurface(context),
          decoration: InputDecoration(
            hintText: hintText,
            hintMaxLines: maxLines,
            hintStyle: TextTheme.of(context).bodyMedium!.colorOutlineVariant(context),
            contentPadding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            prefixIcon: prefixIconName != null
                ? Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 10, 0),
                    child: SvgAsset(
                      AssetPath.getIcon(prefixIconName!),
                      color: ColorScheme.of(context).onSurface,
                      width: 20,
                    ),
                  )
                : null,
            prefixText: prefixText,
            prefixStyle: TextTheme.of(context).bodyMedium!.bold.colorOnSurface(context),
            suffixIcon: suffixIconName != null
                ? Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 16, 0),
                    child: GestureDetector(
                      onTap: onSuffixIconTap,
                      child: SvgAsset(
                        AssetPath.getIcon(suffixIconName!),
                        color: ColorScheme.of(context).onSurface,
                        width: 20,
                      ),
                    ),
                  )
                : null,
            suffixText: suffixText,
            suffixStyle: TextTheme.of(context).bodyMedium!.bold.colorOnSurface(context),
          ),
          validator: validators != null ? FormBuilderValidators.compose(validators!) : null,
          onTap: onTap,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
