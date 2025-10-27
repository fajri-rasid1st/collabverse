// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:collabverse/src/shared/widgets/cv_app_bar.dart';
import 'package:collabverse/src/shared/widgets/scaffold_safe_area.dart';

class SingleSelectionValuePage extends StatelessWidget {
  final String appBarTitle;
  // final List<String> labels;
  // final List<T> values;
  // final T? initialValue;

  const SingleSelectionValuePage({
    super.key,
    required this.appBarTitle,
    // required this.labels,
    // required this.values,
    // this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    final labels = ['Option 1', 'Option 2', 'Option 3'];
    final values = ['Value 1', 'Value 2', 'Value 3'];

    return ScaffoldSafeArea(
      appBar: CvAppBar(
        title: appBarTitle,
      ),
      body: SingleChildScrollView(),
    );
  }
}
