// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';

// Project imports:
import 'package:collabverse/core/extensions/text_style_extension.dart';
import 'package:collabverse/core/utils/asset_path.dart';
import 'package:collabverse/src/shared/widgets/form_fields/cv_text_field.dart';
import 'package:collabverse/src/shared/widgets/scaffold_safe_area.dart';
import 'package:collabverse/src/shared/widgets/svg_asset.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldSafeArea(
      body: FormBuilder(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  ClipPath(
                    clipper: _LoginPageClipper(),
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                  Image.asset(
                    AssetPath.getImage('ic_cv_primary.png'),
                    height: 150,
                    width: 150,
                  ),
                  Positioned(
                    top: 160,
                    child: Column(
                      children: [
                        Text(
                          'Collab Verse',
                          style: Theme.of(context).textTheme.headlineSmall!.bold,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Temukan kesempatan collab-mu dengan lebih mudah!',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login dahulu sebelum lanjut',
                      style: Theme.of(context).textTheme.titleLarge!.semiBold,
                    ),
                    const SizedBox(height: 16),
                    const CvTextField(
                      name: 'email',
                      label: 'Email',
                      hintText: 'Email kamu',
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    const CvTextField(
                      name: 'password',
                      label: 'Password',
                      hintText: 'Password kamu',
                      textInputType: TextInputType.visiblePassword,
                      suffixIconName: 'ph_eye.svg',
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Masuk'),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'atau',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        const Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 24),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: SvgAsset(
                        AssetPath.getIcon('ph_google.svg'),
                        width: 22,
                      ),
                      label: const Text('Lanjutkan dengan Google'),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Belum punya akun Collabs? ',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Daftar di sini',
                            style: Theme.of(context).textTheme.bodyMedium!.semiBold.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
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
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
