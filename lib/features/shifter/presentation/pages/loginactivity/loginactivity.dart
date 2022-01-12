import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shifter/features/shifter/presentation/pages/loginactivity/otpactivity.dart';
import 'package:shifter/features/shifter/presentation/provider/loginprovider/login_activity_provider.dart';
import 'package:shifter/features/shifter/presentation/provider/selectionprovider/selection_activity_provider.dart';
import 'package:shifter/features/shifter/presentation/widgets/countrybottomsheet.dart';
import 'package:shifter/features/shifter/presentation/widgets/loadingscreen.dart';
import 'package:shifter/features/shifter/presentation/widgets/loginwidget/countrylist.dart';
import 'package:shifter/utils/colorconstant.dart';

class LoginActivity extends StatefulWidget {
  static const String Tag = '-/loginactivity';

  LoginActivity({Key? key}) : super(key: key);

  @override
  _LoginActivityState createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  GlobalKey<FormFieldState> _loginkey = GlobalKey<FormFieldState>();
  bool isLoading = false;
  TextEditingController _countryController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();

  FocusNode _countryfocus = FocusNode();
  FocusNode _loginFocus = FocusNode();

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final userRole = Provider.of<SelectionProvider>(context);
    if (isLoading) {
      _countryController.text =
          "${Provider.of<LoginProvider>(context, listen: false).selectedCountry!.cCode}";
    }
    return isLoading
        ? Scaffold(
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
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                            fontFamily: "Poppins", color: Colors.black87),
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
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                          ],
                          style: TextStyle(
                              color: Colors.black87, fontFamily: "Poppins"))),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.26,
                            child: TextFormField(
                              readOnly: true,
                              autofocus: false,
                              controller: _countryController,
                              focusNode: _countryfocus,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.only(left: 8, right: 8),
                                labelStyle: TextStyle(
                                    color: _countryfocus.hasFocus
                                        ? Colors.grey
                                        : Colors.grey),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade700,
                                      style: BorderStyle.solid,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 6),
                                  child: Image.network(
                                    Provider.of<LoginProvider>(context)
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
                                  borderRadius: BorderRadius.circular(8),
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
                          SizedBox(width: 10),
                          SizedBox(
                            width: size.width * 0.67,
                            child: TextFormField(
                              controller: _mobileController,
                              key: _loginkey,
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
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.amber.shade700,
                                        style: BorderStyle.solid,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  labelText: _loginFocus.hasFocus
                                      ? "Mobile Number"
                                      : "Enter your mobile number registered with us"),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10)
                              ],
                              validator: (value){
                                if(value!.isNotEmpty){
                                  if(value.length != 10){
                                    return "Enter valid mobile number";
                                  }else {
                                    return null;
                                  }
                                }else{
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
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
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
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            if(_loginkey.currentState!.validate()){
                              Navigator.of(context).pushNamed(OTPActivity.Tag,arguments: {"mobile" : _mobileController.text});
                            }
                          },
                          child: Text(
                            'Send OTP',
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
                          ])))
                ],
              ),
            ))
        : LoadingScreen();
  }

}


