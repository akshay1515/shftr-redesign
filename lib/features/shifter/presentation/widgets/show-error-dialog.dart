import 'package:flutter/material.dart';
import 'package:shifter/utils/colorconstant.dart';

enum messageType {
  Error,
  Success,
  Other,
}

showErrorMessage(
    {required BuildContext context,
    required String title,
    required String body,
    required messageType type,
    required VoidCallback buttonFunction}) {
  Widget iconImage() {
    switch (type) {
      case messageType.Error:
        return Icon(
          Icons.report_gmailerrorred_rounded,
          color: Colors.red.shade300,
          size: 60,
        );
      case messageType.Success:
        return Icon(
          Icons.check_circle_rounded,
          color: Colors.green.shade300,
          size: 60,
        );
      default:
        return Icon(
          Icons.error_outline,
          color: Colors.amber.shade400,
          size: 60,
        );
    }
  }

  showDialog(
    barrierDismissible: false,
      barrierColor: Colors.black54,
      useSafeArea: true,
      useRootNavigator: true,
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Stack(
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 20),
                margin: EdgeInsets.only(top: 45),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(0, 10),
                          blurRadius: 10),
                    ]),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      body,
                      style: TextStyle(fontSize: 14, fontFamily: "Poppins"),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: MaterialButton(
                        color: ColorConstant.primary,
                          onPressed: buttonFunction,
                          child: Text(
                            "Ok",
                            style: TextStyle(fontSize: 18),
                          )),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20,
                right: 20,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 45,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(45)),
                      child: iconImage()
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
