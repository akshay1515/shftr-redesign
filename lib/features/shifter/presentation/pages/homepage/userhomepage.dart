import 'package:flutter/material.dart';
import 'package:shifter/features/shifter/presentation/widgets/swipecards/userswipecard.dart';
import 'package:shifter/utils/consants.dart';

class UserHomePage extends StatelessWidget {
  static const String Tag = "-/userhomepage";

  const UserHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: /*Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/img_home_back.png'),
                        fit: BoxFit.fill)),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                Constants.app_title,
                style: TextStyle(
                    fontSize: 27,
                    fontFamily: "Pacifico",
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Text(
                "Welcome Rodman !!",
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),*/

      UserSwipeCards()
    );
  }
}
