import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifter/features/shifter/presentation/pages/selectionactivity/selectionwidget.dart';
import 'package:shifter/features/shifter/presentation/provider/selectionprovider/selection_activity_provider.dart';
import 'package:shifter/features/shifter/presentation/widgets/selectionwidget/selection_modal_sheet.dart';
import 'package:shifter/utils/consants.dart';
import 'package:shifter/utils/fontconstant.dart';

class SelectionScreen extends StatelessWidget {
  static const String Tag = '-/selectionscreen';

  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/splash/splashimage.png"),
                fit: BoxFit.cover)),
        child: Container(
          height: size.height,
          width: size.width,
          color: Colors.black.withOpacity(0.3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage(
                  "assets/images/logo.png"
              ),height: 60,width: 60,fit: BoxFit.fill,),
              Text(
                Constants.app_title,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Pacifico",
                    fontSize: FontConstant.h2,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 1.5,
              ),
              Text(
                Constants.app_tagline,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: FontConstant.Tagline_text,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 10, right: 10),
                child: Text(
                  Constants.welcome_screen_message,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white54.withOpacity(0.7),
                    fontFamily: "Poppins",
                    fontSize: FontConstant.Tagline_text,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: (){
                      Provider.of<SelectionProvider>(context,listen: false).changeScreen(Constants.login);
                      SelectionModalSheet(context: context);
                    },
                    child: Text(Constants.login,style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'
                    ),),
                    color: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    ),
                  ),
                  SizedBox(width: 10,),
                  MaterialButton(
                    onPressed: (){
                      Provider.of<SelectionProvider>(context,listen: false).changeScreen(Constants.signup);
                      SelectionModalSheet(context: context);
                    },
                    child: Text(Constants.signup,style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins'
                    ),),
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
