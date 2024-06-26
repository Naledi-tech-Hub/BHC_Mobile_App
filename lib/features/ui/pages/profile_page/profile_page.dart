import 'package:bhc_mobile_app/assets/app_sizes.dart';
import 'package:bhc_mobile_app/assets/text_styles.dart';
import 'package:bhc_mobile_app/features/ui/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../assets/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(42),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 56 / 2,
                  child: Icon(Icons.pic),
                ),
                gapW16,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Richard Tekere',
                      style: AppTextStyles.s24w600,
                    ),
                    Text(
                      'emailexample@gmail.com',
                      style:
                          AppTextStyles.s16w500.apply(color: AppColors.grey01),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  gapH12,
                  _PaymentCard(),
                  gapH24,
                  Container(
                    height: 48,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        color: AppColors.white50,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Row(
                      children: [
                        Text(
                          'Personal information',
                          style: AppTextStyles.s16w400,
                        ),
                        spacer,
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _PaymentCard extends StatelessWidget {
  const _PaymentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            AppColors.white50,
            AppColors.white.withOpacity(0.1),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Next payment: 29.07.2024',
            style: AppTextStyles.s16w400.apply(color: AppColors.grey01),
          ),
          gapH4,
          Text(
            '3 945 BWP',
            style: AppTextStyles.s22w600.apply(color: AppColors.brand),
          ),
          gapH16,
          Row(
            children: [
              Icon(
                Icons.account_balance_wallet_outlined,
                color: AppColors.grey02,
              ),
              gapW8,
              Text(
                'Payments',
                style: AppTextStyles.s16w400,
              ),
              spacer,
              Icon(Icons.arrow_forward_outlined)
            ],
          ),
        ],
      ),
    );
  }
}
