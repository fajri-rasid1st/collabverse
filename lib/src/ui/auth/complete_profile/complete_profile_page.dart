// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:collabverse/core/enums/user_type.dart';
import 'package:collabverse/core/extensions/button_extension.dart';
import 'package:collabverse/core/extensions/text_style_extension.dart';
import 'package:collabverse/core/routes/route_names.dart';
import 'package:collabverse/core/utils/asset_path.dart';
import 'package:collabverse/core/utils/navigator_key.dart';
import 'package:collabverse/src/data/domain_role_data.dart';
import 'package:collabverse/src/shared/clippers/auth_page_clipper.dart';
import 'package:collabverse/src/shared/widgets/cv/cv_radio_button_user_type_field.dart';
import 'package:collabverse/src/shared/widgets/cv/cv_text_field.dart';
import 'package:collabverse/src/shared/widgets/scaffold_safe_area.dart';
import 'package:collabverse/src/shared/widgets/svg_asset.dart';
import 'package:collabverse/src/ui/auth/complete_profile/complete_profile_controller.dart';

class CompleteProfilePage extends StatelessWidget {
  const CompleteProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Complete profile controller
    final controller = context.read<CompleteProfileController>();

    return ScaffoldSafeArea(
      body: FormBuilder(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  ClipPath(
                    clipper: AuthPageClipper(),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      color: ColorScheme.of(context).primaryContainer,
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    child: Image.asset(
                      AssetPath.getIcon('ic_cv_primary.png'),
                      height: 100,
                      width: 100,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 20),
                child: Column(
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Collab\t',
                            style: TextTheme.of(context).headlineSmall!.bold.colorPrimary(context),
                          ),
                          TextSpan(
                            text: 'Verse',
                            style: TextTheme.of(context).headlineSmall!.light.colorPrimary(context),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Agar kamu lebih mudah menemukan peluang collab yang sesuai dengan minat kamu, isi formulir di bawah dulu ya.',
                      style: TextTheme.of(context).bodySmall!.colorOutline(context),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Bidang Minat',
                        style: TextTheme.of(context).titleLarge!.bold.colorPrimary(context),
                      ),
                    ),
                    SizedBox(height: 8),
                    CvRadioButtonUserTypeField(
                      name: 'userType',
                      label: 'Anda adalah seorang?',
                      showMaskRequiredLabel: true,
                      initialValue: UserType.creator,
                    ),
                    SizedBox(height: 12),
                    CvTextField(
                      name: 'domain',
                      label: 'Bidang Kreatif',
                      showMaskRequiredLabel: true,
                      hintText: 'Pilih bidang kreatif/minat',
                      readOnly: true,
                      suffixIconName: 'ph_caret_down.svg',
                      onTap: () async {
                        final selectedDomain = await navigatorKey.currentState!.pushNamed(
                          Routes.singleSelectionValue,
                          arguments: {
                            'appBarTitle': 'Pilih Bidang Kreatif/Minat',
                            'values': DomainRoleData.domains,
                          },
                        );

                        if (selectedDomain != null) {
                          controller.formKey.currentState!.fields['domain']!.didChange(selectedDomain);
                        }
                      },
                      validators: [
                        FormBuilderValidators.required(
                          errorText: 'Bidang kreatif wajib diisi',
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    CvTextField(
                      name: 'roles',
                      label: 'Peran',
                      showMaskRequiredLabel: true,
                      hintText: 'Pilih peran yang sesuai minat',
                      readOnly: true,
                      suffixIconName: 'ph_caret_down.svg',
                      // onTap: () => , // TODO:
                      validators: [
                        FormBuilderValidators.required(
                          errorText: 'Peran wajib diisi',
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Alamat',
                        style: TextTheme.of(context).titleLarge!.bold.colorPrimary(context),
                      ),
                    ),
                    SizedBox(height: 8),
                    CvTextField(
                      name: 'province',
                      label: 'Provinsi',
                      showMaskRequiredLabel: true,
                      hintText: 'Pilih Provinsi',
                      readOnly: true,
                      suffixIconName: 'ph_caret_down.svg',
                      // onTap: () => , // TODO:
                      validators: [
                        FormBuilderValidators.required(
                          errorText: 'Provinsi wajib diisi',
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    CvTextField(
                      name: 'city',
                      label: 'Kota/Kabupaten',
                      showMaskRequiredLabel: true,
                      hintText: 'Pilih Kota/Kabupaten',
                      readOnly: true,
                      suffixIconName: 'ph_caret_down.svg',
                      // onTap: () => , // TODO:
                      validators: [
                        FormBuilderValidators.required(
                          errorText: 'Kota/kabupaten wajib diisi',
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sosial Media',
                        style: TextTheme.of(context).titleLarge!.bold.colorPrimary(context),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: CvTextField(
                            name: '-',
                            label: 'Instagram',
                            initialValue: 'instagram.com/',
                            enabled: false,
                            readOnly: true,
                            textStyle: TextTheme.of(context).bodyMedium!.bold.colorOnSurface(context),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          flex: 4,
                          child: CvTextField(
                            name: 'instagramUsername',
                            label: '',
                            hintText: 'username_instagram',
                            textInputType: TextInputType.twitter,
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Catatan: Setelah di-submit, bidang kreatif kamu sudah tidak dapat diganti.',
                      style: TextTheme.of(context).labelSmall!.bold.colorError(context),
                    ),
                    SizedBox(height: 20),
                    FilledButton.icon(
                      onPressed: () => controller.submit(),
                      label: Text('Mulai Explore!'),
                      icon: SvgAsset(
                        AssetPath.getIcon('ph_paper_plane_tilt.svg'),
                      ),
                    ).expand(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
