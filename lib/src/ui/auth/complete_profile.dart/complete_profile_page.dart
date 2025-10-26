// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:collabverse/core/enums/role_type.dart';
import 'package:collabverse/src/shared/widgets/form_fields/cv_radio_button_role_field.dart';
import 'package:collabverse/src/shared/widgets/scaffold_safe_area.dart';

class CompleteProfilePage extends StatelessWidget {
  const CompleteProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldSafeArea(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CvRadioButtonRoleField(
              name: 'role',
              label: 'Anda adalah seorang?',
              showMaskRequiredLabel: true,
              initialValue: RoleType.creator,
            ),
          ],
        ),
      ),
    );
  }
}
