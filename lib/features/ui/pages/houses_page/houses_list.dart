import 'package:bhc_mobile_app/assets/app_colors.dart';
import 'package:bhc_mobile_app/assets/app_sizes.dart';
import 'package:bhc_mobile_app/assets/asset_paths.dart';
import 'package:bhc_mobile_app/assets/text_styles.dart';
import 'package:bhc_mobile_app/features/ui/pages/house_details_page/house_details_page.dart';
import 'package:bhc_mobile_app/features/ui/widgets/custom_buttons/filled_custom_button.dart';
import 'package:bhc_mobile_app/features/ui/widgets/widget_wrapper_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;

class HousesList extends StatelessWidget {
  const HousesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 160, 16.0, 8),
      child: Column(
        children: [
          const _FilterSortRow(),
          gapH24,
          Expanded(
            child: ListView.separated(
              itemCount: 5,
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) => gapH24,
              itemBuilder: (context, index) => HouseTile(index: index + 1),
            ),
          ),
        ],
      ),
    );
  }
}

class HouseTile extends StatelessWidget {
  const HouseTile({
    super.key,
    this.isFav = false,
    required this.index,
  });

  final bool isFav;
  final int index;

  @override
  Widget build(BuildContext context) {
    return WidgetButton(
      onPressed: () {
        Navigator.pushNamed(context, HouseDetailsPage.routeName);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/$index.jpg',
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                  height: 200,
                ),
                Positioned(
                  top: Sizes.p1,
                  right: Sizes.p1,
                  child: _BookMarkButton(isFav: isFav),
                )
              ],
            ),
          ),
          gapH12,
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('Villa', style: AppTextStyles.s20w500),
              spacer,
              Text('3 945 000 ',
                  style: AppTextStyles.s18w600.apply(color: AppColors.brand)),
              Text('BWP',
                  style: AppTextStyles.s12w600.apply(color: AppColors.brand))
            ],
          ),
          gapH4,
          Text(
            '18697 Masokwe, Gaborone',
            style: AppTextStyles.s14w400.apply(
              color: AppColors.grey01,
            ),
          ),
          Divider(
            height: 16,
            thickness: 1,
            color: AppColors.white.withOpacity(0.3),
          ),
          Row(
            children: [
              SvgPicture.asset(IconAssetsPaths.beds),
              gapW4,
              const Text('9', style: AppTextStyles.s14w400),
              gapW12,
              SvgPicture.asset(IconAssetsPaths.bath),
              gapW4,
              const Text('2', style: AppTextStyles.s14w400),
              gapW12,
              SvgPicture.asset(IconAssetsPaths.space),
              gapW4,
              const Text('200 m \u00B2', style: AppTextStyles.s14w400),
            ],
          )
        ],
      ),
    );
  }
}

class _BookMarkButton extends StatefulWidget {
  const _BookMarkButton({super.key, required this.isFav});

  final bool isFav;

  @override
  State<_BookMarkButton> createState() => _BookMarkButtonState();
}

class _BookMarkButtonState extends State<_BookMarkButton> {
  late bool isFav = widget.isFav;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFav = !isFav;
        });
      },
      icon: Container(
        height: Sizes.p40,
        width: Sizes.p40,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.black40,
        ),
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: 8.0,
            sigmaY: 8.0,
          ),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            child: Icon(
              isFav ? Icons.bookmark : Icons.bookmark_border_rounded,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _FilterSortRow extends StatelessWidget {
  const _FilterSortRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FilledCustomButton.childSizeSecondary(
          onPressed: () {},
          height: Sizes.p32,
          width: Sizes.p96,
          textKey: 'Filter',
          alignment: Alignment.center,
          textStyle: AppTextStyles.s16w600,
        ),
        spacer,
        Text(
          'Sort',
          style: AppTextStyles.s16w600.apply(color: AppColors.brand),
        ),
        gapW4,
        SvgPicture.asset(IconAssetsPaths.filter)
      ],
    );
  }
}
