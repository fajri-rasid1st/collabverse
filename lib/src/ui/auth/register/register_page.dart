// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:collabverse/core/extensions/button_extension.dart';
import 'package:collabverse/core/extensions/text_style_extension.dart';
import 'package:collabverse/core/utils/asset_path.dart';
import 'package:collabverse/core/utils/navigator_key.dart';
import 'package:collabverse/core/utils/utils.dart';
import 'package:collabverse/src/shared/clippers/auth_page_clipper.dart';
import 'package:collabverse/src/shared/widgets/form_fields/cv_text_field.dart';
import 'package:collabverse/src/shared/widgets/scaffold_safe_area.dart';
import 'package:collabverse/src/ui/auth/register/register_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Register controller
    final controller = context.read<RegisterController>();

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
                padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                      'Temukan kesempatan collab-mu dengan lebih mudah!',
                      style: TextTheme.of(context).bodySmall!.colorOutline(context),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Buat akun, lalu mulai eksplorasi.',
                        style: TextTheme.of(context).titleLarge!.bold.colorPrimary(context),
                      ),
                    ),
                    SizedBox(height: 16),
                    CvTextField(
                      name: 'fullName',
                      label: 'Nama Lengkap',
                      showMaskRequiredLabel: true,
                      hintText: 'John Doe',
                      textInputType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      validators: [
                        FormBuilderValidators.required(
                          errorText: 'Nama lengkap wajib diisi',
                        ),
                        FormBuilderValidators.match(
                          RegExp(r'^(?=.{3,}$)[A-Za-zÀ-ÿ\s]+$'),
                          errorText: 'Nama lengkap tidak valid',
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    CvTextField(
                      name: 'email',
                      label: 'Email',
                      showMaskRequiredLabel: true,
                      hintText: 'johndoe123@gmail.com',
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validators: [
                        FormBuilderValidators.required(
                          errorText: 'Email wajib diisi',
                        ),
                        FormBuilderValidators.email(
                          errorText: 'Format email tidak valid',
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: CvTextField(
                            name: '',
                            label: 'Nomor HP',
                            showMaskRequiredLabel: true,
                            initialValue: '${Utils.convertCountryCodeToEmoji('ID')}\t+62',
                            enabled: false,
                            readOnly: true,
                            textStyle: TextTheme.of(context).bodyMedium!.bold.colorOnSurface(context),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          flex: 9,
                          child: CvTextField(
                            name: 'phoneNumber',
                            label: '',
                            hintText: 'xxx-xxxx-xxxx',
                            textInputType: TextInputType.numberWithOptions(),
                            textInputAction: TextInputAction.next,
                            validators: [
                              FormBuilderValidators.required(
                                errorText: 'Nomor HP wajib diisi',
                              ),
                              FormBuilderValidators.match(
                                RegExp(r'^[0-9]{9,13}$'),
                                errorText: 'Nomor HP tidak valid',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Consumer<RegisterController>(
                      builder: (context, controller, child) {
                        final obsecured = controller.obsecurePassword;

                        return CvTextField(
                          name: 'password',
                          label: 'Password',
                          showMaskRequiredLabel: true,
                          hintText: 'Masukkan password',
                          obsecureText: obsecured,
                          suffixIconName: obsecured ? 'ph_eye_closed.svg' : 'ph_eye.svg',
                          onSuffixIconTap: () => controller.obsecurePassword = !obsecured,
                          onChanged: (value) => controller.currentPassword = value ?? '',
                          textInputType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          validators: [
                            FormBuilderValidators.required(
                              errorText: 'Password wajib diisi',
                            ),
                            FormBuilderValidators.minLength(
                              8,
                              errorText: 'Password minimal 8 karakter',
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 16),
                    Consumer<RegisterController>(
                      builder: (context, controller, child) {
                        final obsecured = controller.obsecureConfirmPassword;
                        final currentPassword = controller.currentPassword;

                        return CvTextField(
                          name: 'confirmPassword',
                          label: 'Konfirmasi Password',
                          showMaskRequiredLabel: true,
                          hintText: 'Ulangi password di atas',
                          obsecureText: obsecured,
                          suffixIconName: obsecured ? 'ph_eye_closed.svg' : 'ph_eye.svg',
                          onSuffixIconTap: () => controller.obsecureConfirmPassword = !obsecured,
                          textInputType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          validators: [
                            FormBuilderValidators.required(
                              errorText: 'Konfirmasi password wajib diisi',
                            ),
                            FormBuilderValidators.equal(
                              currentPassword,
                              errorText: 'Konfirmasi password tidak sesuai',
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    FilledButton(
                      onPressed: () => controller.register(),
                      child: Text('Daftar'),
                    ).expand(),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sudah punya akun Collabs?\t',
                          style: TextTheme.of(context).bodyMedium!.colorOutline(context),
                        ),
                        GestureDetector(
                          onTap: () => navigatorKey.currentState!.pop(),
                          child: Text(
                            'Masuk di sini',
                            style: TextTheme.of(context).bodyMedium!.bold.colorPrimary(context),
                          ),
                        ),
                      ],
                    ),
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
