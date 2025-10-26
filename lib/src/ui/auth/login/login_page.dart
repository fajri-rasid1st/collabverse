// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:collabverse/core/extensions/button_extension.dart';
import 'package:collabverse/core/extensions/text_style_extension.dart';
import 'package:collabverse/core/utils/asset_path.dart';
import 'package:collabverse/src/shared/widgets/form_fields/cv_text_field.dart';
import 'package:collabverse/src/shared/widgets/scaffold_safe_area.dart';
import 'package:collabverse/src/shared/widgets/svg_asset.dart';
import 'package:collabverse/src/ui/auth/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Form key
    final formKey = GlobalKey<FormBuilderState>();

    // Login controller
    final loginController = context.read<LoginController>();

    return ScaffoldSafeArea(
      body: FormBuilder(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  ClipPath(
                    clipper: _LoginPageClipper(),
                    child: Container(
                      height: 225,
                      width: double.infinity,
                      color: ColorScheme.of(context).primaryContainer,
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    child: Image.asset(
                      AssetPath.getIcon('ic_cv_primary.png'),
                      height: 100,
                      width: 100,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
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
                    ),
                    SizedBox(height: 16),
                    ValueListenableBuilder(
                      valueListenable: loginController.obsecurePassword,
                      builder: (context, obsecurePassword, child) {
                        return CvTextField(
                          name: 'password',
                          label: 'Password',
                          hintText: 'Password kamu',
                          obsecureText: obsecurePassword,
                          suffixIconName: obsecurePassword ? 'ph_eye_closed.svg' : 'ph_eye.svg',
                          onSuffixIconTap: () => loginController.obsecurePassword.value = !obsecurePassword,
                          textInputType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    FilledButton(
                      onPressed: () {},
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
                          onTap: () {},
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

class _LoginPageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height - 90);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 90,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
