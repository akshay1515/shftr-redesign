import 'package:flutter/material.dart';
import 'package:shifter/features/shifter/presentation/widgets/custom_btn.dart';
import 'package:shifter/features/shifter/presentation/widgets/custom_input.dart';
import 'package:shifter/utils/colorconstant.dart';

class UpdatePersonalActivity extends StatefulWidget {
  static const String Tag = "-/updatepersonalinfo";

  const UpdatePersonalActivity({Key? key}) : super(key: key);

  @override
  _UpdatePersonalActivityState createState() => _UpdatePersonalActivityState();
}

class _UpdatePersonalActivityState extends State<UpdatePersonalActivity> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 300,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2.9,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/img_home_back.png'),
                            fit: BoxFit.fill)),
                  ),
                  Positioned(
                    top: 100.0,
                    left: MediaQuery.of(context).size.width / 2.5,
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border:
                                  Border.all(color: Colors.white, width: 2.0),
                              image: DecorationImage(
                                image: AssetImage("assets/images/logo.png"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 159.0,
                    left: MediaQuery.of(context).size.width / 1.8,
                    child: GestureDetector(
                      onTap: () {
                        //Navigator.of(context).pushNamed(LocationActivity.Tag);
                      },
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Color(0xFF0c9ea9),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 15.0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 180,
                    left: 100,
                    right: 100,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "User",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "User Role",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                CustomInput(
                  labelText: "Your Name",
                ),
                CustomInput(
                  labelText: "Role",
                ),
                CustomInput(
                  labelText: "Email Address",
                ),
                CustomInput(
                  labelText: "Mobile",
                ),
                SizedBox(height: 10.0,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    child: Text(
                      'SAVE',
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        primary: ColorConstant.primary,
                        minimumSize: Size(size.width, 45)),
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}
