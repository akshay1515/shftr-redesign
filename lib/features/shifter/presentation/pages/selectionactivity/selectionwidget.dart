import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shifter/features/shifter/presentation/pages/loginactivity/loginactivity.dart';
import 'package:shifter/features/shifter/presentation/pages/signupactivity/newuserdetails.dart';
import 'package:shifter/features/shifter/presentation/provider/selectionprovider/selection_activity_provider.dart';
import 'package:shifter/utils/colorconstant.dart';
import 'package:shifter/utils/consants.dart';

class SelectionWidget extends StatefulWidget {
  const SelectionWidget({Key? key}) : super(key: key);

  @override
  _SelectionWidgetState createState() => _SelectionWidgetState();
}

class _SelectionWidgetState extends State<SelectionWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final selection = Provider.of<SelectionProvider>(context);

    return Container(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            '${selection.screenSelection} as',
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600),
          ),
          Text(
            'Choose any one option to ${selection.screenSelection} into SHFTR as',
            style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 150,
            child: GridView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              children: [
                InkWell(
                  onTap: () {
                    Provider.of<SelectionProvider>(context, listen: false)
                        .selectUserType(Constants.shifter);
                  },
                  child: Card(
                    color: selection.userSelection == Constants.shifter
                        ? ColorConstant.primary
                        : ColorConstant.offwhite,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        selection.userSelection == Constants.shifter
                            ? ImageIcon(
                                AssetImage('assets/images/myicons/shifter.png'),
                                size: 50,
                              )
                            : Image.asset(
                                'assets/images/myicons/shifter.png',
                                height: 50,
                                width: 50,
                              ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          Constants.shifter,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppoins",
                              fontSize: 17),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Provider.of<SelectionProvider>(context, listen: false)
                        .selectUserType(Constants.employer);
                  },
                  child: Card(
                    color: selection.userSelection == Constants.employer
                        ? ColorConstant.primary
                        : ColorConstant.offwhite,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        selection.userSelection == Constants.employer
                            ? ImageIcon(
                                AssetImage(
                                    'assets/images/myicons/employer.png'),
                                size: 50,
                              )
                            : Image.asset(
                                'assets/images/myicons/employer.png',
                                height: 50,
                                width: 50,
                              ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(Constants.employer,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Poppoins",
                                fontSize: 17)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: 'This feature will be Avaliable soon',
                        toastLength: Toast.LENGTH_SHORT);
                  },
                  child: Card(
                    color: selection.userSelection == Constants.shifterPro
                        ? ColorConstant.primary
                        : ColorConstant.offwhite,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                        ),
                        Column(
                          children: [
                            selection.userSelection == Constants.shifterPro
                                ? ImageIcon(
                                    AssetImage(
                                        'assets/images/myicons/shifterpro.png'),
                                    size: 50,
                                  )
                                : Image.asset(
                                    'assets/images/myicons/shifterpro.png',
                                    height: 50,
                                    width: 50,
                                  ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(Constants.shifterPro,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Poppoins",
                                    fontSize: 17)),
                          ],
                        ),
                        Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                              Colors.yellow,
                              Colors.amber,
                              Colors.orange.shade300,
                              Colors.red.shade300
                            ])),
                            child: Text(
                              "Coming Soon",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context,rootNavigator: true).pop();
                if (selection.screenSelection == Constants.login) {
                  if (selection.userSelection == Constants.shifter ||
                      selection.userSelection == Constants.employer) {

                    Navigator.of(context).pushNamed(LoginActivity.Tag);


                  } else {
                    Fluttertoast.showToast(
                        msg: "Please make a valid selection");
                  }
                }
                else {
                  if (selection.userSelection == Constants.shifter) {
                    Navigator.of(context).pushNamed(NewUserDetails.Tag);
                  } else if(selection.userSelection == Constants.employer){
                    Navigator.of(context).pushNamed(NewUserDetails.Tag);
                  } else {
                    Fluttertoast.showToast(
                        msg: "Please make a valid selection");
                  }
                }
              },
              child: Text(
                'Continue',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  primary: ColorConstant.primary),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
