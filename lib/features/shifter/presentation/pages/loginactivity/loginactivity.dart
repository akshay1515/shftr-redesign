import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:shifter/features/shifter/presentation/pages/loginactivity/otpactivity.dart';
import 'package:shifter/features/shifter/presentation/provider/loginprovider/login_activity_provider.dart';
import 'package:shifter/features/shifter/presentation/provider/selectionprovider/selection_activity_provider.dart';
import 'package:shifter/features/shifter/presentation/widgets/bottom_navigation.dart';
import 'package:shifter/features/shifter/presentation/widgets/countrybottomsheet.dart';
import 'package:shifter/features/shifter/presentation/widgets/loadingscreen.dart';
import 'package:shifter/features/shifter/presentation/widgets/loginwidget/countrylist.dart';
import 'package:shifter/features/shifter/presentation/widgets/show-error-dialog.dart';
import 'package:shifter/utils/colorconstant.dart';

class LoginActivity extends StatefulWidget {
  static const String Tag = '-/loginactivity';

  LoginActivity({Key? key}) : super(key: key);

  @override
  _LoginActivityState createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GlobalKey<FormFieldState> _formKey = GlobalKey<FormFieldState>();
  bool isLoading = false;
  String? _verificationId;
  bool showOtpScreen = false;
  int? forceResendingToken;
  TextEditingController _countryController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController OTPController = TextEditingController();

  FocusNode _countryfocus = FocusNode();
  FocusNode _loginFocus = FocusNode();

  bool clickedSendOTP = false;

  @override
  void initState() {
    Provider.of<LoginProvider>(context, listen: false)
        .getCountry()
        .then((value) {
      setState(() {
        isLoading = true;
      });
    });
  }

  void verifyPhoneNumber()async{
    if(_formKey.currentState!.validate())
    {
      setState(() {
        clickedSendOTP = true;
      });
      PhoneVerificationCompleted verificationCompleted = (PhoneAuthCredential phoneAuthCredential) async {

        User? user;
        bool error=false;
        try{
          user=(await firebaseAuth.signInWithCredential(phoneAuthCredential)).user!;
        } catch (e){
          print("Failed to sign in ");
          error=true;
        }
        if(!error&&user!=null){
          String id=user.uid;
          //here you can store user data in backend
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NavScreen(
            //
          )));
        }
      };

      PhoneVerificationFailed verificationFailed = (FirebaseAuthException authException) {
        print("Failed to send OTP");
        showMessage(authException.message!);
      };
      PhoneCodeSent codeSent = (String? verificationId, [int? forceResendingToken]) async {
        print("Sent OTP");
        this.forceResendingToken=forceResendingToken;
        _verificationId = verificationId;
      };
      PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (String verificationId) {
        _verificationId = verificationId;
      };
      try {
        await firebaseAuth.verifyPhoneNumber(
            phoneNumber: _countryController.text + _mobileController.text,
            timeout: const Duration(seconds: 5),
            forceResendingToken: forceResendingToken!=null?forceResendingToken:null,
            verificationCompleted: verificationCompleted,
            verificationFailed: verificationFailed,
            codeSent: codeSent,
            codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
        showOtpScreen=true;
      } catch (e) {
        showMessage("Failed to Verify Phone Number");
        showOtpScreen=false;
      }
      setState(() {
        clickedSendOTP = false;
      });
    }
  }
  void signInWithPhoneNumber() async {
    bool error=false;
    User? user;
    AuthCredential credential;
    setState(() {
      clickedSendOTP=true;
    });
    try {
      credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: OTPController.text,
      );
      user = (await firebaseAuth.signInWithCredential(credential)).user!;
    } catch (e) {
      showMessage("Failed to sign in: " );
      error=true;
    }
    if(!error&&user!=null&&user.uid!=null){
      String id=user.uid;
      //here you can store user data in backend
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NavScreen(
        //
      )));
    }
    setState(() {
      clickedSendOTP=false;
    });
  }

  void showMessage(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext builderContext) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(errorMessage),
            actions: [
              TextButton(
                child: Text("Ok"),
                onPressed: () async {
                  Navigator.of(builderContext).pop();
                },
              )
            ],
          );
        }).then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  otpScreen() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  "Let\'s verify your account",
                  style:
                      TextStyle(fontFamily: "Poppins", color: Colors.black87),
                ),
                SizedBox(height: 10),
                Text(
                  'Enter OTP',
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text.rich(TextSpan(
                    children: [
                      TextSpan(
                          text: "We have sent you on ",
                          style: TextStyle(fontSize: 13)),
                      TextSpan(
                          text:
                              "${_countryController.text} ${_mobileController.text}",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                    ],
                    style: TextStyle(
                        color: Colors.black87, fontFamily: "Poppins"))),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: PinCodeTextField(
                        pastedTextStyle: TextStyle(fontWeight: FontWeight.bold),
                        controller: OTPController,
                        textInputAction: TextInputAction.done,
                        enableActiveFill: true,
                        keyboardType: TextInputType.phone,
                        textStyle: TextStyle(
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.bold),
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
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      signInWithPhoneNumber();
                      //Navigator.of(context).pus hNamed(NavScreen.Tag);
                      //Navigator.of(context).pushNamed(NewUserDetails.Tag,arguments: {"mobile" : OTPController.text});
                    },
                    child: clickedSendOTP ? Center(
                      child: CircularProgressIndicator(color: Colors.white,),
                    ):  Text(
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
                      // minimumSize: Size(size.width, 45)
                    ),
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
              'assets/images/otpimage.png',
              height: 330,
              width: 300,
            ),
            Container(
                margin: EdgeInsets.only(bottom: 20),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Shftr\'s ',
                          style:
                              TextStyle(fontSize: 13, color: Colors.black87)),
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
                          style:
                              TextStyle(fontSize: 13, color: Colors.black87)),
                      TextSpan(
                          text: 'Privacy Policy ',
                          style: TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w700,
                              color: Colors.blue.shade300),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => {
                                  Fluttertoast.showToast(
                                      msg: 'Will show shftr\'s privacy policy')
                                }),
                    ]))),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final userRole = Provider.of<SelectionProvider>(context);
    if (isLoading) {
      _countryController.text =
          "${Provider.of<LoginProvider>(context, listen: false).selectedCountry!.cCode}";
    }
    return isLoading ?
      Scaffold(
            resizeToAvoidBottomInset: false,
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
            body: Stack(
              children: [
                showOtpScreen
                    ? otpScreen()
                    : Padding(
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
                                    height: 10,
                                  ),
                                  Text(
                                    'Let\'s login to start an awesome journey with us',
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: Colors.black87),
                                  ),
                                  Text(
                                    'Provide your mobile number',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text.rich(TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "You are about to login as ",
                                            style: TextStyle(fontSize: 13)),
                                        TextSpan(
                                            text: "${userRole.userSelection}",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontFamily: "Poppins"))),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: size.width / 4,
                                        child: TextFormField(
                                          readOnly: true,
                                          autofocus: false,
                                          controller: _countryController,
                                          focusNode: _countryfocus,
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding: EdgeInsets.only(
                                                left: 8, right: 8),
                                            labelStyle: TextStyle(
                                                color: _countryfocus.hasFocus
                                                    ? Colors.grey
                                                    : Colors.grey),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade700,
                                                  style: BorderStyle.solid,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            prefixIcon: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0, right: 6),
                                              child: Image.network(
                                                Provider.of<LoginProvider>(
                                                        context)
                                                    .selectedCountry!
                                                    .cFlag,
                                                height: 20,
                                                width: 30,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  style: BorderStyle.solid,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(10)
                                          ],
                                          onTap: () {
                                            showCountryList(context);
                                            setState(() {
                                              if (_loginFocus.hasFocus) {
                                                _loginFocus.unfocus();
                                              }
                                              FocusScope.of(context)
                                                  .requestFocus(_countryfocus);
                                            });
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      SizedBox(
                                        width: size.width / 1.48,
                                        child: TextFormField(
                                          controller: _mobileController,
                                          key: _formKey,
                                          autofocus: false,
                                          focusNode: _loginFocus,
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle: TextStyle(
                                                  color: _loginFocus.hasFocus
                                                      ? Colors.amber.shade700
                                                      : Colors.grey),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey.shade700,
                                                    style: BorderStyle.solid,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.amber.shade700,
                                                    style: BorderStyle.solid,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              labelText: _loginFocus.hasFocus
                                                  ? "Mobile Number"
                                                  : "Enter your registered number"),
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(10)
                                          ],
                                          validator: (value) {
                                            if (value!.isNotEmpty) {
                                              if (value.length == 10 ||
                                                  value.length == 9) {
                                                return null;
                                              } else {
                                                return "Enter valid mobile number";
                                              }
                                            } else {
                                              return "Mobile number is required";
                                            }
                                          },
                                          onTap: () {
                                            setState(() {
                                              FocusScope.of(context)
                                                  .requestFocus(_loginFocus);
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14.0),
                                    child: Text(
                                      'We will be sending you One Time Verification code to verify your account with us',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontFamily: "Poppins",
                                          fontSize: 10),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: ElevatedButton(
                                      onPressed: ()=>verifyPhoneNumber(),

                                      child:Stack(
                                        children: [
                                          clickedSendOTP ? Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          ):Text(
                                            'Send OTP',
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          primary: ColorConstant.primary,
                                          minimumSize: Size(size.width, 45)),
                                    ),
                                  )
                                ],
                              ),
                              Image.asset('assets/images/loginimage.png'),
                              Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: 'Shftr\'s ',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black87)),
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
                                                fontSize: 13,
                                                color: Colors.black87)),
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
                                      ])))
                            ],
                          ),
                        ),
                      ),
              ],
            ))
       : LoadingScreen();
  }
}
