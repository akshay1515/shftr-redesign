import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:shifter/features/shifter/presentation/pages/loginactivity/otpactivity.dart';
import 'package:shifter/features/shifter/presentation/pages/loginactivity/otpmailactivity.dart';
import 'package:shifter/features/shifter/presentation/provider/loginprovider/login_activity_provider.dart';
import 'package:shifter/features/shifter/presentation/widgets/loadingscreen.dart';
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
  bool changeBorderColor = false;
  bool switchedButton = false;
  bool isLoading = false;

  TextEditingController OTPController = TextEditingController();
  TextEditingController emailOTPController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    OTPController.dispose();
    emailOTPController.dispose();
    super.dispose();
  }
  @override
  void initState() {

    super.initState();
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
                  if(changeBorderColor){
                    Navigator.pushReplacement(context, PageTransition(
                        child: OTPActivity(displayId: "0",
                            ein: widget.ein,
                            ssn: widget.ssn,
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
                            packageId: widget.packageId,
                            activateDate: widget.activateDate,
                            expiryDate: widget.expiryDate,
                            countryId:widget.countryId,
                            stateId: widget.stateId,
                            cityId: widget.cityId), type: PageTransitionType.fade));


                  } else{
                    Navigator.pushReplacement(context, PageTransition(
                        child: OTPMailActivity(displayId: "0",
                            ein: widget.ein,
                            ssn: widget.ssn,
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
                            packageId: widget.packageId,
                            activateDate: widget.activateDate,
                            expiryDate: widget.expiryDate,
                            countryId:widget.countryId,
                            stateId: widget.stateId,
                            cityId: widget.cityId), type: PageTransitionType.fade));
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
                child: Text(
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
      ),
    );
  }
}
