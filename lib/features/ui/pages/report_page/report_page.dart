import 'package:bhc_mobile_app/assets/asset_paths.dart';
import 'package:bhc_mobile_app/features/ui/widgets/custom_buttons/filled_custom_button.dart';
import 'package:bhc_mobile_app/features/ui/widgets/new_button.dart';
import 'package:flutter/material.dart';

import '../../../../assets/app_colors.dart';
import '../../../../assets/app_sizes.dart';
import '../../../../assets/text_styles.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/widget_wrapper_button.dart';
import '../houses_page/application_form_page/application_form_page.dart';
import '../houses_page/mortgage_page/mortgage_calculator_page.dart';
import 'create_report_page.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: 'Maintenance Report',
        centerTitle: false,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CalculatorButton(
              iconPath: IconAssetsPaths.call,
              text: 'Emergency, call request',
              onPressed: () {},
            ),
            gapH16,
            CalculatorButton(
              iconPath: IconAssetsPaths.plus,
              color: AppColors.brand,
              textColor: AppColors.white,
              text: 'New maintenance request',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  CreateReportPage.routeName,
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: ListView.separated(
          itemCount: content.length,
          separatorBuilder: (context, index) => gapH4,
          itemBuilder: (context, index) => WidgetButton(
            onPressed: () {},
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            content[index],
                            style: AppTextStyles.s20w500,
                          ),
                        ),
                        Text(status[index]),
                        gapW4,
                        Icon(Icons.arrow_forward_outlined)
                      ],
                    ),
                    gapH8,
                    Row(
                      children: [
                        Text(
                          no[index],
                          style: AppTextStyles.s14w400.apply(
                            color: AppColors.grey01,
                          ),
                        ),
                        spacer,
                        Text(
                          date[index],
                          style: AppTextStyles.s14w400.apply(
                            color: AppColors.grey01,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final content = ['Electricity', 'Plumbing', 'Complaints'];
final no = ['No: 395-63-56', 'No: 395-63-56', 'No: 395-63-56'];
final date = ['24.05.2024', '01.01.2024', '30.11.2023'];
final status = ['Completed', 'In progress', 'Canceled'];
