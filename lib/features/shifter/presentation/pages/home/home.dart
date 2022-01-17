import 'package:flutter/material.dart';
import 'package:shifter/utils/colorconstant.dart';
import 'package:shifter/utils/consants.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  bool isKyc = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      /*appBar: AppBar(automaticallyImplyLeading: false,title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Image.asset("assets/images/logo.png",height: 40,width: 40,color: Colors.black,),
        SizedBox(width: 5,),
        Text(
          Constants.app_title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: "Pacifico",
            fontSize: 25,
          ),
        ),
      ],),
      backgroundColor: Colors.amber.shade600,
      ),*/
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * 0.35,
                  width: size.width,
                  padding: EdgeInsets.only(left: 10, right: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/img_home_back.png",
                        ),
                        fit: BoxFit.fill),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 35,
                          ),
                          Text(
                            Constants.app_title,
                            style: TextStyle(
                              color: ColorConstant.offwhite,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Pacifico",
                              fontSize: 25,
                              letterSpacing: 1
                            ),
                            softWrap: true,
                            textAlign: TextAlign.center,
                            textWidthBasis: TextWidthBasis.parent,
                            textScaleFactor: 1.5,
                          ),
                          Text(
                            "Welcome Shftr",
                            style: TextStyle(
                                color: ColorConstant.offwhite,
                                fontSize: 23,
                                fontFamily: "Poppins"),
                          ),
                          Text(
                            "Shftr's Name",
                            style: TextStyle(
                                color: ColorConstant.offwhite,
                                fontSize: 20,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w700),
                          ),
                          Text("Designation",style: TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            color: ColorConstant.offwhite,
                            fontWeight: FontWeight.w300,
                            fontFamily: "Poppins"
                          ),),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "City Name",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Poppins",
                                    fontSize: 17,
                                    color: ColorConstant.offwhite),
                              ),
                              SizedBox(width: 2),
                              Icon(
                                Icons.arrow_drop_down_circle_rounded,
                                color: ColorConstant.offwhite,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/logo.png",
                            height: 65,
                            width: 65,
                            fit: BoxFit.fill,
                            color: ColorConstant.offwhite,
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                !isKyc
                    ? Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: MaterialBanner(
                          content: Text(
                            "Please complete your kyc to start applying for shifts",
                            style: TextStyle(color: ColorConstant.offwhite),
                          ),
                          actions: [
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                setState(() {
                                  isKyc = !isKyc;
                                });
                              },
                              child: Text(
                                'Apply KYC',
                                style: TextStyle(fontFamily: "Poppins"),
                              ),
                              color: Colors.amber.shade700,
                            )
                          ],
                          backgroundColor: Colors.black.withOpacity(0.8),
                        ),
                      )
                    : Container(),
                Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.3,
                    ),
                    Container(
                      width: size.width,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 15, right: 15),
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        "Shftr Advertisement section",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
