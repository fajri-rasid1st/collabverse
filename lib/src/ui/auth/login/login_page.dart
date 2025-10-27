// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:collabverse/core/extensions/button_extension.dart';
import 'package:collabverse/core/extensions/text_style_extension.dart';
import 'package:collabverse/core/routes/route_names.dart';
import 'package:collabverse/core/utils/asset_path.dart';
import 'package:collabverse/core/utils/navigator_key.dart';
import 'package:collabverse/src/shared/clippers/auth_page_clipper.dart';
import 'package:collabverse/src/shared/widgets/cv/cv_text_field.dart';
import 'package:collabverse/src/shared/widgets/scaffold_safe_area.dart';
import 'package:collabverse/src/shared/widgets/svg_asset.dart';
import 'package:collabverse/src/ui/auth/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(context) {
    // Login controller
    final controller = context.read<LoginController>();

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
                      height: 230,
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
                      'Temukan kesempatan collab-mu dengan lebih mudah!',
                      style: TextTheme.of(context).bodySmall!.colorOutline(context),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Login dahulu sebelum lanjut',
                        style: TextTheme.of(context).titleLarge!.bold.colorPrimary(context),
                      ),
                    ),
                    SizedBox(height: 16),
                    CvTextField(
                      name: 'email',
                      label: 'Email',
                      hintText: 'Email kamu',
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
                    SizedBox(height: 12),
                    Consumer<LoginController>(
                      builder: (context, controller, child) {
                        final obsecured = controller.obsecurePassword;

                        return CvTextField(
                          name: 'password',
                          label: 'Password',
                          hintText: 'Password kamu',
                          obsecureText: obsecured,
                          suffixIconName: obsecured ? 'ph_eye_closed.svg' : 'ph_eye.svg',
                          onSuffixIconTap: () => controller.obsecurePassword = !obsecured,
                          textInputType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          validators: [
                            FormBuilderValidators.required(
                              errorText: 'Password wajib diisi',
                            ),
                          ],
                        );
                      },
                    ),

                    SizedBox(height: 20),
                    FilledButton(
                      onPressed: () => controller.login(),
                      child: Text('Masuk'),
                    ).expand(),
                    SizedBox(height: 24),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        spacing: 8,
                        children: [
                          Expanded(
                            child: Divider(),
                          ),
                          Text(
                            'atau',
                            style: TextTheme.of(context).bodySmall!.colorOutline(context),
                          ),
                          Expanded(
                            child: Divider(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: SvgAsset(
                        AssetPath.getIcon('ph_google.svg'),
                      ),
                      label: Text('Lanjutkan dengan Google'),
                    ).expand(),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Belum punya akun Collabs?\t',
                          style: TextTheme.of(context).bodyMedium!.colorOutline(context),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Unfocus any text field
                            FocusManager.instance.primaryFocus?.unfocus();

                            navigatorKey.currentState!.pushNamed(Routes.register);
                          },
                          child: Text(
                            'Daftar di sini',
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
