import 'package:bhc_mobile_app/assets/app_colors.dart';
import 'package:bhc_mobile_app/assets/app_sizes.dart';
import 'package:bhc_mobile_app/assets/asset_paths.dart';
import 'package:bhc_mobile_app/assets/text_styles.dart';
import 'package:bhc_mobile_app/features/ui/pages/houses_page/application_form_page/application_form_page.dart';
import 'package:bhc_mobile_app/features/ui/pages/houses_page/houses_page.dart';
import 'package:bhc_mobile_app/features/ui/widgets/app_bar.dart';
import 'package:bhc_mobile_app/features/ui/widgets/custom_buttons/filled_custom_button.dart';
import 'package:bhc_mobile_app/features/ui/widgets/widget_wrapper_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';

import '../../widgets/new_button.dart';
import '../houses_page/mortgage_page/mortgage_calculator_page.dart';
import '../report_page/create_report_page.dart';

class HouseDetailsPage extends StatelessWidget {
  static const routeName = '/houseDetails';

  HouseDetailsPage({super.key});

  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: 'Apartment',
        centerTitle: false,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
        child: Material(
          borderRadius: BorderRadius.circular(999),
          child: FilledCustomButton(
            onPressed: () {
              Navigator.pushNamed(context, ApplicationFormPage.routeName);
            },
            textKey: 'Make an application',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ImagePageView(),
            gapH16,
            _Body(),
          ],
        ),
      ),
    );
  }
}

class _ImagePageView extends StatefulWidget {
  const _ImagePageView({
    super.key,
  });

  @override
  State<_ImagePageView> createState() => _ImagePageViewState();
}

class _ImagePageViewState extends State<_ImagePageView> {
  final PageController controller = PageController();
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: 5,
            controller: controller,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                currentPage = index + 1;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(
                ImageAssetPaths.house,
                fit: BoxFit.fitWidth,
              );
            },
          ),
          Positioned(
            bottom: Sizes.p16,
            left: Sizes.p16,
            child: Container(
              height: Sizes.p20,
              width: Sizes.p40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.grey01.withOpacity(0.6),
                borderRadius: BorderRadius.circular(Sizes.p4),
              ),
              child: Text(
                '$currentPage/5',
                style: AppTextStyles.s12w400.apply(color: AppColors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '18697 Masokwe, Gaborone',
            style: AppTextStyles.s16w400.apply(color: AppColors.grey01),
          ),
          gapH8,
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '3 945 000 ',
                style: AppTextStyles.s22w600,
              ),
              Text(
                'BWP',
                style: AppTextStyles.s12w600,
              ),
            ],
          ),
          gapH24,
          DetailsTile(
            startString: 'Type of deal',
            endString: 'Buying',
          ),
          gapH8,
          DetailsTile(
            startString: 'Number of rooms',
            endString: '9',
          ),
          gapH8,
          DetailsTile(
            startString: 'Area',
            endString: '200 m \u00B2',
          ),
          gapH8,
          DetailsTile(
            startString: 'Year of construction',
            endString: '2020',
          ),
          gapH24,
          CalculatorButton(
            iconPath: IconAssetsPaths.calculate,
            text: 'Calculate Mortgage',
            onPressed: () {
              Navigator.pushNamed(context, MortgageCalculatorPage.routeName);
            },
          ),
          gapH24,
          _SmallMap(),
          gapH24,
          Text(
            '''Selling a 3 bedroom apartment with designer decoration, in a good neighbourhod in the coty center

As tenants we consider solvent, neat citizens.
The apartment has everything you need for a comfortable life.''',
          ),
          gapH150,
        ],
      ),
    );
  }
}

class _SmallMap extends StatelessWidget {
  const _SmallMap({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(-24.653257, 25.906792),
          initialZoom: 16,
        ),
        children: [
          TileLayer(
            minNativeZoom: 6,
            maxNativeZoom: 19,
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'bw.bhc.app',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(-24.653257, 25.906792),
                child: _MarkerIcon(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DetailsTile extends StatelessWidget {
  const DetailsTile({
    super.key,
    required this.startString,
    required this.endString,
  });

  final String startString;
  final String endString;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.white50),
        ),
      ),
      padding: const EdgeInsets.only(bottom: Sizes.p8),
      child: Row(
        children: [
          Text(
            startString,
            style: AppTextStyles.s16w400.apply(color: AppColors.grey01),
          ),
          spacer,
          Text(
            endString,
            style: AppTextStyles.s16w400.apply(color: AppColors.black),
          )
        ],
      ),
    );
  }
}

class _MarkerIcon extends StatelessWidget {
  const _MarkerIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.brand,
      ),
      child: Container(
        height: 12,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white,
        ),
      ),
    );
  }
}
