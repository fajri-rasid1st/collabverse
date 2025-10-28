// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

// Project imports:
import 'package:collabverse/core/extensions/button_extension.dart';
import 'package:collabverse/core/extensions/text_style_extension.dart';
import 'package:collabverse/core/utils/asset_path.dart';
import 'package:collabverse/src/shared/widgets/cv/cv_app_bar.dart';
import 'package:collabverse/src/shared/widgets/cv/cv_text_field.dart';
import 'package:collabverse/src/shared/widgets/scaffold_safe_area.dart';
import 'package:collabverse/src/shared/widgets/svg_asset.dart';

class EventBoardFormPage extends StatelessWidget {
  const EventBoardFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return ScaffoldSafeArea(
      appBar: CvAppBar(
        title: 'Buat Event Board',
      ),
      body: FormBuilder(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CvTextField(
                name: 'eventName',
                label: 'Nama Event',
                showMaskRequiredLabel: true,
                hintText: 'Misal: Open Mic Mingguan Wise Cafe',
                validators: [
                  FormBuilderValidators.required(errorText: 'Nama event wajib diisi'),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Poster/Gambar',
                style: textTheme.labelMedium!.bold,
              ),
              SizedBox(height: 6),
              _buildImagePicker(context),
              SizedBox(height: 16),
              CvTextField(
                name: 'description',
                label: 'Deskripsi',
                hintText: 'Deskripsikan event lebih detail (opsional)',
                maxLines: 4,
                textInputAction: TextInputAction.newline,
              ),
              SizedBox(height: 16),
              CvTextField(
                name: 'venue',
                label: 'Venue',
                showMaskRequiredLabel: true,
                hintText: 'Misal: Kedai Kopi Wise',
                validators: [
                  FormBuilderValidators.required(errorText: 'Venue wajib diisi'),
                ],
              ),
              SizedBox(height: 16),
              CvTextField(
                name: 'startDate',
                label: 'Tanggal Dimulai',
                showMaskRequiredLabel: true,
                hintText: 'Pilih tanggal dimulainya event',
                readOnly: true,
                suffixIconName: 'ph_calendar_dots.svg',
              ),
              SizedBox(height: 16),
              CvTextField(
                name: 'creativeField',
                label: 'Bidang Kreatif',
                showMaskRequiredLabel: true,
                initialValue: 'Musik', // from image
                readOnly: true,
                suffixIconName: 'ph_caret_down.svg',
              ),
              SizedBox(height: 16),
              CvTextField(
                name: 'role',
                label: 'Peran yang Dicari',
                showMaskRequiredLabel: true,
                hintText: 'Pilih peran yang dicari',
                readOnly: true,
                suffixIconName: 'ph_caret_down.svg',
              ),
              SizedBox(height: 16),
              CvTextField(
                name: 'needed',
                label: 'Jumlah yang Dibutuhkan',
                showMaskRequiredLabel: true,
                initialValue: '0',
                textInputType: TextInputType.number,
                suffixText: 'Orang',
                validators: [
                  FormBuilderValidators.required(errorText: 'Jumlah dibutuhkan wajib diisi'),
                  FormBuilderValidators.numeric(errorText: 'Input harus angka'),
                ],
              ),
              SizedBox(height: 16),
              CvTextField(
                name: 'deadline',
                label: 'Deadline',
                showMaskRequiredLabel: true,
                hintText: 'Pilih tanggal event board ditutup',
                readOnly: true,
                suffixIconName: 'ph_calendar_dots.svg',
              ),
              SizedBox(height: 16),
              CvTextField(
                name: 'province',
                label: 'Provinsi',
                showMaskRequiredLabel: true,
                initialValue: 'Sulawesi Selatan', // From image
                readOnly: true,
                suffixIconName: 'ph_caret_down.svg',
              ),
              SizedBox(height: 16),
              CvTextField(
                name: 'city',
                label: 'Kota/Kabupaten',
                showMaskRequiredLabel: true,
                initialValue: 'Makassar', // From image
                readOnly: true,
                suffixIconName: 'ph_caret_down.svg',
              ),
              SizedBox(height: 16),
              CvTextField(
                name: 'locationDetail',
                label: 'Detail Lokasi',
                hintText: 'Detail lokasi event (opsional)',
                maxLines: 2,
                textInputAction: TextInputAction.newline,
              ),
              SizedBox(height: 16),
              Text(
                'Koordinat Lokasi',
                style: textTheme.labelMedium!.bold,
              ),
              SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: FormBuilderTextField(
                      name: 'latitude',
                      style: textTheme.bodyMedium!.colorOnSurface(context),
                      decoration: InputDecoration(
                        hintText: 'lat (opsional)',
                        hintStyle: textTheme.bodyMedium!.colorOutlineVariant(context),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: FormBuilderTextField(
                      name: 'longitude',
                      style: textTheme.bodyMedium!.colorOnSurface(context),
                      decoration: InputDecoration(
                        hintText: 'long (opsional)',
                        hintStyle: textTheme.bodyMedium!.colorOutlineVariant(context),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Gunakan koordinat lokasi saya saat ini',
                  style: textTheme.bodyMedium!.colorPrimary(context).bold,
                ),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Bagaimana memperoleh koordinat lokasi secara manual?',
                  style: textTheme.bodySmall!.colorOutline(context).copyWith(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: FilledButton(
          onPressed: () {
            if (formKey.currentState!.saveAndValidate()) {
              debugPrint(formKey.currentState!.value.toString());
            }
          },
          child: Text('Submit'),
        ).expand(),
      ),
    );
  }

  Widget _buildImagePicker(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outlineVariant,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colorScheme.outlineVariant,
              shape: BoxShape.circle,
            ),
            child: SvgAsset(
              AssetPath.getIcon('ph_image.svg'),
              width: 32,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          SizedBox(height: 16),
          OutlinedButton(
            onPressed: () {},
            child: Text('Pilih Gambar'),
          ),
        ],
      ),
    );
  }
}
