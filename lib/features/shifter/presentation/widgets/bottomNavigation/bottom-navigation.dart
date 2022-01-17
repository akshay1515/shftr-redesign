import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifter/features/shifter/presentation/provider/bottomnavigationprovider/screen_provider.dart';
import 'package:shifter/utils/colorconstant.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<ScreenProvider>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
          color: ColorConstant.primary,
          borderRadius: BorderRadius.circular(15)),
      height: size.height * 0.075,
      width: size.width,
      margin: EdgeInsets.only(left: 6, right: 6, bottom: 15),
      child: Padding(
        padding: const EdgeInsets.only(left: 6.0, right: 6.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Bottom_navigation_widget(
              title: "Home",
              index: 0,
              callBack: () {
                provider.changeScreen(0);
              },
              icons: Icons.widgets_rounded,
            ),
            Bottom_navigation_widget(
              title: "Jobs",
              index: 1,
              callBack: () {
                provider.changeScreen(1);
              },
              icons: Icons.view_carousel_rounded,
            ),
            Bottom_navigation_widget(
              title: "Interviews",
              index: 2,
              callBack: () {
                provider.changeScreen(2);
              },
              icons: Icons.timelapse_rounded,
            ),
            Bottom_navigation_widget(
              title: "Hiring",
              index: 3,
              callBack: () {
                provider.changeScreen(3);
              },
              icons: Icons.folder_rounded,
            ),
            Bottom_navigation_widget(
              title: "Profile",
              index: 4,
              callBack: () {
                provider.changeScreen(4);
              },
              icons: Icons.person_rounded,
            ),
          ],
        ),
      ),
    );
  }
}

class Bottom_navigation_widget extends StatelessWidget {
  final int index;
  final Function callBack;
  final String title;
  final IconData icons;

  const Bottom_navigation_widget({
    Key? key,
    required this.index,
    required this.callBack,
    required this.title,
    required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ScreenProvider>(context);
    final _currentIndex = provider.currentIndex;
    return Container(
      margin: EdgeInsets.only(top: 3, bottom: 3),
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      decoration: BoxDecoration(
          color: _currentIndex == index ? ColorConstant.offwhite : Colors.transparent,
          borderRadius: _currentIndex == index
              ? BorderRadius.circular(15)
              : BorderRadius.zero),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icons,
            size: 25,
            color: index == _currentIndex ? Colors.amber.shade700 : Colors.black87,
          ),
          Text(
            title,
            style: TextStyle(
              color: _currentIndex == index
                  ? Colors.amber.shade700
                  : Colors.black87,
              fontWeight:
                  _currentIndex == index ? FontWeight.w700 : FontWeight.w300,
              fontFamily: "Poppins",
            ),
          ),
        ],
      ),
    );
  }
}
