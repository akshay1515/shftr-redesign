import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shifter/features/shifter/presentation/pages/home/home.dart';
import 'package:shifter/features/shifter/presentation/provider/bottomnavigationprovider/screen_provider.dart';
import 'package:shifter/features/shifter/presentation/widgets/bottomNavigation/bottom-navigation.dart';
import 'package:shifter/features/shifter/presentation/widgets/homepage/privacy-bottom-sheet.dart';
import 'package:shifter/features/shifter/presentation/widgets/loadingscreen.dart';

class UserHomePage extends StatefulWidget {
  static const String Tag = "-/userhomepage";

  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  GlobalKey<ScaffoldState> _userHomePagescaffoldKey =
      GlobalKey<ScaffoldState>();
  bool _isLoading = false;
  SharedPreferences? _prefrences;
  String? status;
  int? screen_count;
  String? screen_status;
  int start_count = 0;

  showPrivacy(int count, BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black45,
        useRootNavigator: true,
        transitionDuration: Duration(milliseconds: 300),
        transitionBuilder:
            (context, primaryAnimation, secondryAnimation, widget) {
          return SlideTransition(
            position: CurvedAnimation(
                    parent: primaryAnimation, curve: Curves.easeOut)
                .drive(Tween<Offset>(begin: Offset(0, -1), end: Offset.zero)),
            child: widget,
          );
        },
        pageBuilder: ((context, _, __) {
          return PrivacyWebview(pagecount: count);
        }));
  }

  Future getSavedData() async {
    _prefrences = await SharedPreferences.getInstance();
    status = _prefrences!.getString("status");

    if(status != null){
      screen_status = status;
      screen_count = _prefrences!.getInt("count");
    }
  }

  Widget changeScreen(int _currentindex) {
    switch (_currentindex) {
      case 0:
        return UserHome();
      case 1:
        return UserHome();
      case 2:
        return UserHome();
      case 3:
        return UserHome();
      case 4:
        return UserHome();
      default:
        return UserHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ScreenProvider>(context);
    final index = provider.currentIndex;


    return Scaffold(
        key: _userHomePagescaffoldKey,
        body: _isLoading
            ? /*Stack(
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

            /* UserSwipeCards()*/
            Stack(
                children: [
                  changeScreen(index),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: CustomBottomNavigation()),
                ],
              )
            : LoadingScreen());
  }

  @override
  void initState() {
    super.initState();
    getSavedData().then((value) {

      if(status != null){
        if(status == "partial"){
          showPrivacy(screen_count!, context);
        }else{

        }
      }else{
        showPrivacy(0, context);
      }

      setState(() {
        _isLoading = true;
      });
    });
  }
}
