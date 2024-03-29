import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifter/features/shifter/presentation/provider/userswipecardprovider.dart';
import 'package:shifter/features/shifter/presentation/widgets/swipecards/card-widget.dart';

class UserSwipeCards extends StatelessWidget {
  const UserSwipeCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildCards() {
      final provider = Provider.of<UserSwipeCardProvider>(context);
      final urlimages = provider.urlImages;

      return Stack(
        children: urlimages.map((e) => CardWidget(urlImage: e,onDisplay: urlimages.last == e,)).toList(),
      );
    }
    return SafeArea(child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(16),
      child: buildCards(),
    ));


  }


}
