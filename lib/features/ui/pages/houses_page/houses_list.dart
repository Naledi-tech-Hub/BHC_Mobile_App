import 'package:flutter/cupertino.dart';

class HousesList extends StatelessWidget {
  const HousesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => SizedBox(),
    );
  }
}
