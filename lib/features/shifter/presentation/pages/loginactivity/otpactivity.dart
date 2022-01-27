import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:shifter/features/shifter/presentation/pages/signupactivity/newuserdetails.dart';
import 'package:shifter/features/shifter/presentation/provider/loginprovider/login_activity_provider.dart';
import 'package:shifter/features/shifter/presentation/widgets/bottom_navigation.dart';
import 'package:shifter/utils/colorconstant.dart';

class OTPActivity extends StatelessWidget {
  static const Tag = "-/otpscreen";
  final String mobileNumber;
  TextEditingController OTPController = TextEditingController();
  OTPActivity({Key? key, required this.mobileNumber}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final country = Provider.of<LoginProvider>(context).selectedCountry;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_rounded),
          color: Colors.black87,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height:10),
                  Text(
                    "Let\'s verify your account",
                    style: TextStyle(fontFamily: "Poppins", color: Colors.black87),
                  ),
                  SizedBox(
                      height:10),
                  Text(
                    'Enter OTP',
                    style: TextStyle(
                        color: Colors.black87,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text.rich(
                      TextSpan(
                      children: [
                        TextSpan(
                            text: "We have sent you on ",
                            style: TextStyle(fontSize: 13)),
                        TextSpan(
                            text: "${country!.cCode} $mobileNumber",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600)),
                      ],
                      style: TextStyle(
                          color: Colors.black87, fontFamily: "Poppins"))
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                      width: size.width,
                      child: Center(
                        child: PinCodeTextField(
                          pastedTextStyle: TextStyle(fontWeight: FontWeight.bold),
                          controller: OTPController,
                          textInputAction: TextInputAction.done,
                          enableActiveFill: true,
                          keyboardType: TextInputType.phone,
                          textStyle: TextStyle(color: Colors.grey.shade800,fontWeight: FontWeight.bold),
                          cursorColor: Colors.black54,
                          onChanged: (String Value) {},
                          enablePinAutofill: true,
                          appContext: context,
                          length: 6,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            fieldHeight: 40,
                            fieldWidth: 35,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(2),
                                bottomRight: Radius.circular(2),
                                topLeft: Radius.circular(2),
                                bottomLeft: Radius.circular(2),
                            ),
                            activeColor: ColorConstant.primary,
                            inactiveColor: Colors.grey.shade600,
                            inactiveFillColor: Colors.transparent,
                            activeFillColor: Colors.transparent,
                            selectedColor: ColorConstant.primary,
                            selectedFillColor: Colors.transparent,

                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Text(
                      'Please enter the OTP you have received on your registered number to verify your account.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: "Poppins",
                          fontSize: 10),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(NavScreen.Tag, arguments: {"id" : "2" });
                        //Navigator.of(context).pushNamed(NewUserDetails.Tag,arguments: {"mobile" : OTPController.text});
                      },
                      child: Text(
                        'Verify',
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
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 110),
                    child: Row(
                      children: [
                        Text(
                          "Didn't receive OTP? ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black87,
                              fontFamily: "Poppins",
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Resend',
                            style: TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.w700,
                                color: Colors.blue.shade300),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => {
                                Fluttertoast.showToast(
                                    msg:
                                    'Will resend the otp to your number')
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Image.asset(
                'assets/images/otpimage.png', height: 330, width: 300,),
              Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Shftr\'s ',
                            style: TextStyle(
                                fontSize: 13, color: Colors.black87)),
                        TextSpan(
                            text: 'Terms and Conditions ',
                            style: TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w700,
                                color: Colors.blue.shade300),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => {
                                Fluttertoast.showToast(
                                    msg:
                                    'Will show shftr\'s terms and conditions')
                              }),
                        TextSpan(
                            text: '\n& ',
                            style: TextStyle(
                                fontSize: 13, color: Colors.black87)),
                        TextSpan(
                            text: 'Privacy Policy ',
                            style: TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w700,
                                color: Colors.blue.shade300),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => {
                                Fluttertoast.showToast(
                                    msg:
                                    'Will show shftr\'s privacy policy')
                              }),
                      ]))),
            ],
          ),
        ),
      ),
    );
  }
}
