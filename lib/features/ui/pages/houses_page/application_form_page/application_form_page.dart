import 'package:bhc_mobile_app/assets/app_colors.dart';
import 'package:bhc_mobile_app/assets/app_sizes.dart';
import 'package:bhc_mobile_app/assets/asset_paths.dart';
import 'package:bhc_mobile_app/assets/text_styles.dart';
import 'package:bhc_mobile_app/features/ui/pages/report_page/create_report_page.dart';
import 'package:bhc_mobile_app/features/ui/widgets/app_bar.dart';
import 'package:bhc_mobile_app/features/ui/widgets/custom_buttons/filled_custom_button.dart';
import 'package:bhc_mobile_app/features/ui/widgets/custom_text_field.dart';
import 'package:bhc_mobile_app/util/alert_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApplicationFormPage extends StatelessWidget {
  static const routeName = '/applicationPAge';

  const ApplicationFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: 'Make an application',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              HouseMiniCard(),
              gapH32,
              CustomTextField(labelTextKey: 'Name'),
              gapH8,
              CustomTextField(labelTextKey: 'Surname'),
              gapH8,
              CustomTextField(labelTextKey: 'Omang ID'),
              gapH8,
              CustomTextField(labelTextKey: 'Email'),
              gapH8,
              CustomTextField(labelTextKey: 'Phone number'),
              gapH16,
              FilesView(),
              gapH90,
              FilledCustomButton(
                onPressed: () {
                  AlertUtils.showCustomDialog(
                    buttonTextKey: 'Close',
                    context: context,
                    titleKey: 'Confirmation',
                    isDismissible: true,
                    bodyText:
                        'Your application has been successfully submitted, your application Id is DA123453. An email will be sent to you with details for a physical meetup  ',
                  ).then((val) {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  });
                },
                textKey: 'Submit Application',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HouseMiniCard extends StatelessWidget {
  const HouseMiniCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 81,
      child: Row(
        children: [
          Image.asset(ImageAssetPaths.house),
          gapW16,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Apartment'),
              gapH2,
              Text(
                '18697 Masokwe, Gaborone',
                style: AppTextStyles.s14w400.apply(color: AppColors.grey01),
              ),
              gapH8,
              Text(
                '3 945 000 BWP',
                style: AppTextStyles.s22w600.apply(color: AppColors.brand),
              ),
            ],
          )
        ],
      ),
    );
  }
}
