import 'dart:io';

import 'package:bhc_mobile_app/assets/app_colors.dart';
import 'package:bhc_mobile_app/assets/text_styles.dart';
import 'package:bhc_mobile_app/features/ui/widgets/app_bar.dart';
import 'package:bhc_mobile_app/features/ui/widgets/custom_text_field.dart';
import 'package:bhc_mobile_app/features/ui/widgets/widget_wrapper_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../../assets/app_sizes.dart';
import '../../../../util/alert_utils.dart';
import '../../widgets/custom_buttons/filled_custom_button.dart';

final map = {
  "Electrical": ['Electricity Tripping'],
  "Plumbing": ["Leaking water"],
  "Carpentry": ["Leaking water"],
  "Masonry": ["Leaking water"],
  "External": ["Leaking water"],
  "Mechanical": ["Leaking water"],
};

class CreateReportPage extends StatefulWidget {
  static const routeName = '/createReport';

  const CreateReportPage({super.key});

  @override
  State<CreateReportPage> createState() => _CreateReportPageState();
}

class _CreateReportPageState extends State<CreateReportPage> {
  String? reportType;
  String? faultType;
  int? severityDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: 'Create Maintenance request',
        centerTitle: false,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
        child: Material(
          borderRadius: BorderRadius.circular(999),
          child: FilledCustomButton(
            onPressed: () {
              AlertUtils.showCustomDialog(
                buttonTextKey: 'Close',
                context: context,
                titleKey: 'Confirmation',
                isDismissible: true,
                bodyText:
                    'Your report has been logged with BHC. Your reference number is BHC13920, you will assisted within ${severityDate ?? 1} day(s)',
              ).then((val) {
                Navigator.pop(context);
              });
            },
            textKey: 'Submit request',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              DropdownButtonFormField<int>(
                decoration: InputDecoration(labelText: 'Severity'),
                value: null,
                items: [
                  DropdownMenuItem(
                    value: 1,
                    child: Text('Emergency (24 hrs)'),
                  ),
                  DropdownMenuItem(
                    value: 3,
                    child: Text('Urgent (3 days)'),
                  ),
                  DropdownMenuItem(
                    value: 14,
                    child: Text('Normal (14 days)'),
                  )
                ],
                onChanged: (val) {
                  severityDate = val;
                  setState(() {});
                },
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Category'),
                value: null,
                items: [
                  DropdownMenuItem(
                    value: 'Planned',
                    child: Text('Planned'),
                  ),
                  DropdownMenuItem(
                    value: 'UnPlanned',
                    child: Text('UnPlanned'),
                  ),
                  DropdownMenuItem(
                    value: 'cot',
                    child: Text('Change of tenancy'),
                  ),
                  DropdownMenuItem(
                    value: 'van',
                    child: Text('Vandalism'),
                  )
                ],
                onChanged: (val) {},
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Type of report'),
                value: reportType,
                items: [
                  DropdownMenuItem(
                    value: 'Fault',
                    child: Text('Fault'),
                  ),
                  DropdownMenuItem(
                    value: 'Enquiry',
                    child: Text('Enquiry'),
                  ),
                  DropdownMenuItem(
                    value: 'Complaint',
                    child: Text('Complaint'),
                  ),
                  DropdownMenuItem(
                    value: 'Other',
                    child: Text('Other'),
                  )
                ],
                onChanged: (val) {
                  reportType = val;
                  setState(() {});
                },
              ),
              if (reportType == 'Fault')
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Fault type'),
                  value: faultType,
                  items: [
                    DropdownMenuItem(
                      value: 'Electrical',
                      child: Text('Electrical'),
                    ),
                    DropdownMenuItem(
                      value: 'Carpentry',
                      child: Text('Carpentry'),
                    ),
                    DropdownMenuItem(
                      value: 'Plumbing',
                      child: Text('Plumbing'),
                    ),
                    DropdownMenuItem(
                      value: 'Masonry',
                      child: Text('Masonry'),
                    ),
                    DropdownMenuItem(
                      value: 'Mechanical',
                      child: Text('Mechanical'),
                    ),
                    DropdownMenuItem(
                      value: 'External',
                      child: Text('External'),
                    )
                  ],
                  onChanged: (val) {
                    faultType = val;
                    setState(() {});
                  },
                ),
              if (faultType != null)
                DropdownButtonFormField<String>(
                  decoration:
                      InputDecoration(labelText: '$faultType Fault Incident'),
                  value: null,
                  items: map[faultType]
                      ?.map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                  onChanged: (val) {},
                ),
              CustomTextField(
                labelTextKey: 'Describe the problem',
                maxLines: null,
              ),
              gapH16,
              if (reportType == 'Fault') FilesView()
            ],
          ),
        ),
      ),
    );
  }
}

class FilesView extends StatefulWidget {
  const FilesView({super.key});

  @override
  State<FilesView> createState() => _FilesViewState();
}

class _FilesViewState extends State<FilesView> {
  List<PlatformFile> files = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetButton(
          onPressed: () async {
            await FilePicker.platform
                .pickFiles(allowMultiple: true, type: FileType.media)
                .then((val) {
              if (val != null) files.addAll(val.files);
              setState(() {});
              print(files);
            });
          },
          child: Row(
            children: [
              Icon(
                Icons.attach_file,
                color: AppColors.brand,
              ),
              Text(
                'Attach file',
                style: AppTextStyles.s18w500.apply(color: AppColors.brand),
              ),
            ],
          ),
        ),
        gapH20,
        if (files.isNotEmpty)
          SizedBox(
            height: 80,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: files.length,
              separatorBuilder: (context, index) => gapW12,
              itemBuilder: (context, index) => files[index].path != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        File(files[index].path!),
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    )
                  : SizedBox(),
            ),
          ),
      ],
    );
  }
}
