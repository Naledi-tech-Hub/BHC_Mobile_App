import 'package:bhc_mobile_app/features/ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import '../houses_page/houses_list.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: 'Favourites',
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: 2,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        itemBuilder: (context, index) => HouseTile(
          isFav: true,
          index: index + 1,
        ),
      ),
    );
  }
}
