import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shifter/features/shifter/presentation/pages/loginactivity/otpactivity.dart';
import 'package:shifter/features/shifter/presentation/pages/loginactivity/otpmailactivity.dart';
import 'package:shifter/features/shifter/presentation/provider/loginprovider/login_activity_provider.dart';
import 'package:shifter/features/shifter/presentation/widgets/loadingscreen.dart';
import 'package:shifter/features/shifter/presentation/widgets/planswidget/plan_widget.dart';
import 'package:shifter/utils/colorconstant.dart';
import 'package:shifter/utils/fontconstant.dart';
class VerifyActivity extends StatefulWidget {
  final String? displayId,
      ein,
      ssn,
      naice,
      dob,
      businessType,
      companyName,
      companyZipcode,
      companyCity,
      companyState,
      city,
      state,
      zipcode,
      fullName,
      email,
      phone,
      password,
      countryCode,
      activateDate,
      expiryDate,
      countryId,
      stateId,
      cityId;
  final int? packageId;
  const VerifyActivity({Key? key, required this.email, this.displayId, this.ein,
    this.ssn,
    this.naice,
    this.dob,
    this.businessType,
    this.companyName,
    this.companyZipcode,
    this.companyCity,
    this.companyState,
    this.city,
    this.state,
    this.zipcode,
    this.fullName,
    this.phone,
    this.password,
    this.countryCode,
    this.activateDate,
    this.expiryDate,
    this.countryId,
    this.stateId,
    this.cityId,
    this.packageId}) : super(key: key);

  @override
  _VerifyActivityState createState() => _VerifyActivityState();
}

class _VerifyActivityState extends State<VerifyActivity> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool changeBorderColor = false;
  bool switchedButton = false;
  bool otpScaffold = false;
  bool isLoading = false;
  bool verifyLoader = false;
  bool sendLoader = false;
  String? _verificationId ;
  String? fcmToken;
  int? forceResendingToken;

  TextEditingController OTPController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailOTPController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    //OTPController.dispose();
    emailOTPController.dispose();
    mobileController.dispose();
    super.dispose();
  }
  @override
  void initState() {

    super.initState();
  }

  void verifyPhoneNumber()async{

      PhoneVerificationCompleted verificationCompleted = (PhoneAuthCredential phoneAuthCredential) async {

        User? user;
        bool error=false;
        try{
          user=(await firebaseAuth.signInWithCredential(phoneAuthCredential)).user!;
          fcmToken=user.uid;
          print("Fcm Token: $fcmToken");
        } catch (e){
          print("Failed to sign in ");
          error=true;
        }
        if(!error&&user!=null){
          fcmToken=user.uid;
          print("Fcm Token: $fcmToken");
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
        setState(() {
          otpScaffold = true;
        });
        //print("Verification ID: $_verificationId");
      };
      PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (String verificationId) {
        _verificationId = verificationId;
      };
      try {
        print(widget.countryCode.toString() + widget.phone.toString());
        await firebaseAuth.verifyPhoneNumber(
            phoneNumber: widget.countryCode.toString() + widget.phone.toString(),
            timeout: const Duration(seconds: 5),
            forceResendingToken: forceResendingToken!=null?forceResendingToken:null,
            verificationCompleted: verificationCompleted,
            verificationFailed: verificationFailed,
            codeSent: codeSent,
            codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
       // showOtpScreen=true;
      } catch (e) {
        showMessage("Failed to Verify Phone Number");
       // showOtpScreen=false;
      }
      // setState(() {
      //   clickedSendOTP = false;
      // });

  }

  void signInWithPhoneNumber() async {
    bool error=false;
    User? user;
    AuthCredential credential;
    // setState(() {
    //   clickedSendOTP=true;
    // });
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
    if(!error&&user!=null){
       fcmToken =user.uid;
       print("Fcm Token: $fcmToken");
      //here you can store user data in backend
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NavScreen(
      //   //
      // )));
    }
    // setState(() {
    //   clickedSendOTP=false;
    // });
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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final country = Provider.of<LoginProvider>(context).selectedCountry;
    return Scaffold(
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
                color: Colors.black,
              )),
        ),
      ),
      body: isLoading ? LoadingScreen()
          :
      otpScaffold ?
      Padding(
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
                                text: "${country!.cCode} ${widget.phone}",
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
                          onChanged: (String value) {},
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
                      onPressed: () async{
                        setState(() {
                          verifyLoader = true;
                        });
                        signInWithPhoneNumber();
                        final SharedPreferences prefs = await SharedPreferences.getInstance();
                        String packageId = prefs.getString("packageId") ?? "0" ;

                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context) {
                              return Center(
                                child: Container(
                                  child: PlanWidget(
                                      displayId: "0",
                                      ein: widget.ein,
                                      ssn: widget.ssn,
                                      fcmToken: fcmToken,
                                      naice: widget.naice,
                                      dob: widget.dob,
                                      businessType:widget.businessType,
                                      companyName:widget.companyName,
                                      companyZipcode:widget.companyZipcode,
                                      companyCity:widget.companyCity,
                                      companyState:widget.companyState,
                                      city: widget.city,
                                      state:widget.state,
                                      zipcode:widget.zipcode,
                                      fullName:widget.fullName,
                                      email:widget.email,
                                      phone:widget.phone,
                                      password:widget.password,
                                      countryCode:widget.countryCode,
                                      packageId:
                                      int.parse(packageId),
                                      activateDate: widget.activateDate,
                                      expiryDate: widget.expiryDate,
                                      countryId:widget.countryId,
                                      stateId: widget.stateId,
                                      cityId: widget.cityId),
                                ),
                              );
                            });

                      },
                      child: verifyLoader ? Center(child: CircularProgressIndicator(color: Colors.white,),) : Text(
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
      ) :
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Verify",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    "How would you like to verify your account?",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: FontConstant.Tagline_text,
                        fontFamily: 'Poppins'),
                  ),
                ],),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 55),
                      side: BorderSide(width: 2.0, color: !changeBorderColor ? Colors.black : Colors.orange,),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      primary: Colors.white,
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.phone,
                            size: 18.0,
                            color: Colors.black,
                          ),
                          SizedBox(width: 15.0,),
                          const Text(
                            'Phone',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        changeBorderColor = true;
                      });

                    },
                  ),
                  SizedBox(width: 10.0,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 55),
                      side: BorderSide(width: 2.0, color: !changeBorderColor ?  Colors.orange :  Colors.black,),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      primary: Colors.white,
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.email,
                            size: 18.0,
                            color: Colors.black,
                          ),
                          SizedBox(width: 15.0,),
                          const Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'halter',
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        changeBorderColor = false;
                        //switchedButton = true;
                      });

                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0,),
            changeBorderColor ?
            Center(
              child: Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(
                            text: "OTP code will be sent to ",
                            style: TextStyle(fontSize: 12)),
                        TextSpan(
                            text: "${country!.cCode} ${widget.phone}",

                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600)),
                      ],
                      style: TextStyle(
                          color: Colors.black87, fontFamily: "Poppins"))
              ),
            )
                :
            Center(
              child: Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(
                            text: "OTP code will be sent to ",
                            style: TextStyle(fontSize: 12)),
                        TextSpan(
                          // text: "${country!.cCode} ${widget.mobile}",
                            text: " ${widget.email}",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600)),
                      ],
                      style: TextStyle(
                          color: Colors.black87, fontFamily: "Poppins"))
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    sendLoader = true;
                  });
                  if(changeBorderColor){
                    verifyPhoneNumber();
                    // Navigator.pushReplacement(context, PageTransition(
                    //     child: OTPActivity(displayId: "0",
                    //         ein: widget.ein,
                    //         ssn: widget.ssn,
                    //         naice: widget.naice,
                    //         dob: widget.dob,
                    //         businessType:widget.businessType,
                    //         companyName:widget.companyName,
                    //         companyZipcode:widget.companyZipcode,
                    //         companyCity:widget.companyCity,
                    //         companyState:widget.companyState,
                    //         city: widget.city,
                    //         state:widget.state,
                    //         zipcode:widget.zipcode,
                    //         fullName:widget.fullName,
                    //         email:widget.email,
                    //         phone:widget.phone,
                    //         password:widget.password,
                    //         countryCode:widget.countryCode,
                    //         packageId: widget.packageId,
                    //         activateDate: widget.activateDate,
                    //         expiryDate: widget.expiryDate,
                    //         countryId:widget.countryId,
                    //         stateId: widget.stateId,
                    //         verificationId: _verificationId,
                    //         cityId: widget.cityId), type: PageTransitionType.fade));


                  } else{

                  }

                  // if(changeBorderColor) {
                  //
                  // }else{
                  //
                  //   Navigator.of(context).pushNamed(
                  //       OTPActivity.Tag, arguments: {"mobile": widget.email});
                  // }
                  //Navigator.of(context).pushNamed(NewUserDetails.Tag,arguments: {"mobile" : OTPController.text});
                },
                child: sendLoader ? Center(child: CircularProgressIndicator(color: Colors.white,)) : Text(
                  'Send',
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
        ),
      )
    );
  }
}
