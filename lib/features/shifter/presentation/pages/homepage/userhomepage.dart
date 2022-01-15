import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shifter/features/shifter/presentation/widgets/homepage/privacy-bottom-sheet.dart';
import 'package:shifter/features/shifter/presentation/widgets/loadingscreen.dart';
import 'package:shifter/features/shifter/presentation/widgets/swipecards/userswipecard.dart';

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

    if (status != null) {
      if (status == "partial") {
        int count = _prefrences!.getInt("count")!;
        showPrivacy(count, context);
      } else {}
    } else {
      showPrivacy(0, context);
    }

  }

  @override
  Widget build(BuildContext context) {
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

            UserSwipeCards()
            : LoadingScreen());
  }

  @override
  void initState() {
    super.initState();
    getSavedData().then((value) {
      setState(() {
        _isLoading = true;
      });
    });
  }
}
