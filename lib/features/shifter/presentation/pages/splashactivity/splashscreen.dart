import 'package:flutter/material.dart';
import 'package:shifter/features/shifter/presentation/models/recruiter/recruiter.dart';
import 'package:shifter/utils/consants.dart';
import 'package:shifter/features/shifter/presentation/pages/selectionactivity/selectionscreen.dart';
import 'package:shifter/utils/fontconstant.dart';
import 'package:shifter/utils/preferences/recruiter_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacementNamed(SelectionScreen.Tag);
    });
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splash/splashimage.png'),
                fit: BoxFit.cover,
                alignment: Alignment.center)),
        child: Container(
          alignment: Alignment.center,
          width: size.width,
          height: size.height,
          color: Colors.black.withOpacity(0.3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage(
                  "assets/images/logo.png"
              ),height: 100,width: 100,fit: BoxFit.fill,),
              SizedBox(height: 10,),
              Text(
                Constants.app_title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Pacifico",
                  fontSize: FontConstant.h1,
                  height: 1.2,
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
