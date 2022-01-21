import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shifter/features/shifter/presentation/widgets/homepage/joblistwidget.dart';
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
        child: SingleChildScrollView(
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
                                  letterSpacing: 1),
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
                            Text(
                              "Designation",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontStyle: FontStyle.normal,
                                  color: ColorConstant.offwhite,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "Poppins"),
                            ),
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
                      CarouselSlider.builder(
                          itemCount: 7,
                          itemBuilder: (context, itemindex, pageViewIndex) {
                            return Container(
                              width: size.width,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 3, right: 3),
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                "Shftr",
                                textScaleFactor: 3,
                                textWidthBasis: TextWidthBasis.parent,
                                textAlign: TextAlign.justify,
                                softWrap: true,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    decorationStyle: TextDecorationStyle.wavy,
                                    fontFamily: "Pacifico",
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                            );
                          },
                          options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 3 / 1.5,
                            viewportFraction: 0.9,
                            enableInfiniteScroll: true,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5, right: 5),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey, width: 0.5))),
                        child: ListTile(
                          title: Text(
                            "Driver",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            "Tap here to change Job Category",
                            style: TextStyle(
                                color: Colors.black87,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w300,
                                fontSize: 12),
                          ),
                          trailing: Icon(
                            Icons.arrow_drop_down_circle_rounded,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Joblistwidget(size: size),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: size.width,
                        padding: EdgeInsets.only(left:8,right: 8,bottom: 40),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Shftr",style: TextStyle(
                              fontFamily: "Pacifico",
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey.shade500.withOpacity(0.8)
                            ),),
                            Text("Hollybrook,\nRochester,\nNY 14607",style: TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.grey.shade500.withOpacity(0.8),
                              fontWeight: FontWeight.w300,
                              fontSize: 13
                            ),)
                          ],
                        ),
                      )
                    ],
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


