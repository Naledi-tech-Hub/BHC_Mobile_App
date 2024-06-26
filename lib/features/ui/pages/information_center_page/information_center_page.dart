import 'package:bhc_mobile_app/assets/app_colors.dart';
import 'package:bhc_mobile_app/assets/app_sizes.dart';
import 'package:bhc_mobile_app/assets/text_styles.dart';
import 'package:bhc_mobile_app/features/ui/widgets/app_bar.dart';
import 'package:bhc_mobile_app/features/ui/widgets/widget_wrapper_button.dart';
import 'package:flutter/material.dart';

class InformationCenter extends StatelessWidget {
  const InformationCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: 'Information Center',
        //centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: ListView.separated(
          itemCount: 5,
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
                            title[index],
                            style: AppTextStyles.s20w500,
                          ),
                        ),
                        Icon(Icons.arrow_forward_outlined)
                      ],
                    ),
                    gapH8,
                    Text(
                      'Lorem ipsum dolor sit amet consectetur. Vitae.',
                      style: AppTextStyles.s14w400.apply(
                        color: AppColors.grey01,
                      ),
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

final title = [
  'BHC products',
  'The procedure for applying for a house or a lease',
  'Eligibility criteria for renting and selling a property',
  'Housing complexes',
  'Frequently Asked Questions'
];
