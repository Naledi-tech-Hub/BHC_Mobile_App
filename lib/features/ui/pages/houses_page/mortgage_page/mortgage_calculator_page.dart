import 'package:bhc_mobile_app/assets/app_colors.dart';
import 'package:bhc_mobile_app/assets/app_sizes.dart';
import 'package:bhc_mobile_app/assets/text_styles.dart';
import 'package:bhc_mobile_app/features/ui/pages/house_details_page/house_details_page.dart';
import 'package:flutter/cupertino.dart';

class MortgageCalculatorPage extends StatelessWidget {
  static const routeName = '/mortgagePage';

  const MortgageCalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Calculate mortgage estimate',
            style: AppTextStyles.s20w600,
          ),
          gapH32,
          DetailsTile(
            startString: 'Real estate cost',
            endString: '3 945 000 BWP',
          ),
          gapH8,
          DetailsTile(
            startString: 'Mortgage rate',
            endString: '4 %',
          )
        ],
      ),
    );
  }
}
