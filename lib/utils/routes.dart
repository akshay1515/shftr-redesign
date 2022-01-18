import 'package:flutter/material.dart';
import 'package:shifter/features/shifter/presentation/pages/homepage/userhomepage.dart';
import 'package:shifter/features/shifter/presentation/pages/locationactivity/location_activity.dart';
import 'package:shifter/features/shifter/presentation/pages/loginactivity/loginactivity.dart';
import 'package:shifter/features/shifter/presentation/pages/loginactivity/otpactivity.dart';
import 'package:shifter/features/shifter/presentation/pages/selectionactivity/selectionscreen.dart';
import 'package:shifter/features/shifter/presentation/pages/signupactivity/businessregister.dart';
import 'package:shifter/features/shifter/presentation/pages/signupactivity/newuserdetails.dart';
import 'package:shifter/features/shifter/presentation/pages/splashactivity/splashscreen.dart';
import 'package:shifter/features/shifter/presentation/pages/updateProfileActivity/update_personal_activity.dart';
import 'package:shifter/features/shifter/presentation/pages/user-category/usercategory.dart';
import 'package:shifter/features/shifter/presentation/pages/user-skill/userSkillSelect.dart';
import 'package:shifter/features/shifter/presentation/widgets/bottom_navigation.dart';
import 'package:shifter/features/shifter/presentation/widgets/selectbusinesstype/naicecategory.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case SelectionScreen.Tag:
        return MaterialPageRoute(builder: (_) => SelectionScreen());
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case LoginActivity.Tag:
        return MaterialPageRoute(builder: (_) => LoginActivity());
      case NewUserDetails.Tag:
        return MaterialPageRoute(builder: (_) => NewUserDetails());
      case OTPActivity.Tag:
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => OTPActivity(mobileNumber: args['mobile']));
        } else {
          return MaterialPageRoute(builder: (_) => LoginActivity());
        }
      case NAICECategory.Tag:
        return MaterialPageRoute(builder: (_) => NAICECategory());
      case NavScreen.Tag:
        return MaterialPageRoute(builder: (_) => NavScreen());
      case UpdatePersonalActivity.Tag:
        return MaterialPageRoute(builder: (_) => UpdatePersonalActivity());
      case RegisterBusiness.Tag:
        return MaterialPageRoute(builder: (_) => RegisterBusiness());
      case UserCategory.Tag:
        return MaterialPageRoute(builder: (_) => UserCategory());
      case UserSkillSelect.Tag:
        return MaterialPageRoute(builder: (_)=>UserSkillSelect());
      case UserHomePage.Tag:
        return MaterialPageRoute(builder:(_)=>UserHomePage());
      case LocationActivity.Tag:
        return MaterialPageRoute(builder:(_)=>LocationActivity());
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
