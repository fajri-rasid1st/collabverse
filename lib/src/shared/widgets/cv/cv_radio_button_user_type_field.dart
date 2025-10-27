// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';

// Project imports:
import 'package:collabverse/core/enums/user_type.dart';
import 'package:collabverse/core/extensions/text_style_extension.dart';

class CvRadioButtonUserTypeField extends StatelessWidget {
  final String name;
  final String label;
  final bool showMaskRequiredLabel;
  final UserType? initialValue;

  const CvRadioButtonUserTypeField({
    super.key,
    required this.name,
    required this.label,
    this.showMaskRequiredLabel = false,
    this.initialValue,
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
        FormBuilderField<UserType?>(
          name: name,
          initialValue: initialValue,
          valueTransformer: (userType) => userType?.value,
          builder: (field) {
            return Column(
              spacing: 8,
              children: UserType.values
                  .map(
                    (type) => _RadioOptionField(
                      value: type,
                      field: field,
                      selected: type == field.value,
                      onChanged: (value) => field.didChange(value),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ],
    );
  }
}

class _RadioOptionField extends StatelessWidget {
  final bool selected;
  final UserType value;
  final FormFieldState<UserType?> field;
  final ValueChanged<UserType?> onChanged;

  const _RadioOptionField({
    required this.selected,
    required this.value,
    required this.field,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? ColorScheme.of(context).secondaryContainer : null,
        border: Border.all(
          color: selected ? ColorScheme.of(context).primary : ColorScheme.of(context).outlineVariant,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: RadioListTile<UserType>(
        value: value,
        groupValue: field.value,
        selected: selected,
        onChanged: onChanged,
        dense: true,
        radioScaleFactor: 1.25,
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        title: Text(
          value.display,
          style: TextTheme.of(context).titleMedium!.bold,
        ),
        subtitle: Text(
          value.isCreator ? 'Membuat project brief, mencari project brief dan event board' : 'Membuat event board',
          style: selected
              ? TextTheme.of(context).labelSmall!.colorSecondary(context)
              : TextTheme.of(context).labelSmall!.colorOutline(context),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        visualDensity: VisualDensity(
          vertical: 0,
          horizontal: -4,
        ),
      ),
    );
  }
}
