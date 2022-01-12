import 'package:flutter/material.dart';
import 'loginwidget/countrylist.dart';

void showCountryList(BuildContext context) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15))),
    context: context,
    enableDrag: false,
    isDismissible: true,
    useRootNavigator: true,
    builder: (context) {
      return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              image: DecorationImage(
                image: AssetImage("assets/images/texturebackground.jpg"),
                fit: BoxFit.fill,
              )
          ),
          child: CountriesList());
    },
  );
}