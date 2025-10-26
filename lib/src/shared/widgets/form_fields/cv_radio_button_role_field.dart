// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';

// Project imports:
import 'package:collabverse/core/enums/role_type.dart';
import 'package:collabverse/core/extensions/text_style_extension.dart';

class CvRadioButtonRoleField extends StatelessWidget {
  final String name;
  final String label;
  final bool showMaskRequiredLabel;
  final RoleType? initialValue;

  const CvRadioButtonRoleField({
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
        FormBuilderField<RoleType?>(
          name: name,
          initialValue: initialValue,
          // validator: validators != null ? FormBuilderValidators.compose(validators!) : null,
          builder: (field) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: RoleType.values
                  .map(
                    (roleType) => _RadioOptionField(
                      value: roleType,
                      field: field,
                      selected: field.value == roleType,
                      onChanged: (value) {
                        field.didChange(value);
                      },
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
  final RoleType value;
  final FormFieldState<RoleType?> field;
  final ValueChanged<RoleType?> onChanged;

  const _RadioOptionField({
    required this.selected,
    required this.value,
    required this.field,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<RoleType>(
      title: Text(
        value.display,
        style: TextTheme.of(context).titleMedium!.bold,
      ),
      subtitle: Text(
        value.isCreator ? 'Membuat project brief, mencari project brief dan event board' : 'Membuat event board',
        style: TextTheme.of(context).bodySmall,
      ),
      value: value,
      groupValue: field.value,
      selected: selected,
      onChanged: onChanged,
    );
  }
}
