import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shifter/features/shifter/presentation/pages/signupactivity/verify_activity.dart';

import 'package:shifter/features/shifter/presentation/pages/user-category/usercategory.dart';
import 'package:shifter/features/shifter/presentation/provider/businessprovider/businessprovider.dart';
import 'package:shifter/features/shifter/presentation/provider/loginprovider/login_activity_provider.dart';
import 'package:shifter/features/shifter/presentation/provider/selectionprovider/selection_activity_provider.dart';
import 'package:shifter/features/shifter/presentation/widgets/countrybottomsheet.dart';
import 'package:shifter/features/shifter/presentation/widgets/loadingscreen.dart';
import 'package:shifter/features/shifter/presentation/widgets/planswidget/plan_widget.dart';
import 'package:shifter/features/shifter/presentation/widgets/selectbusinesstype/naicecategory.dart';
import 'package:shifter/utils/colorconstant.dart';
import 'package:shifter/utils/consants.dart';
import 'package:shifter/utils/preferences/recruiter_preferences.dart';

class NewUserDetails extends StatefulWidget {
  static const Tag = "-/newuserscreen";

  NewUserDetails({Key? key}) : super(key: key);

  @override
  State<NewUserDetails> createState() => _NewUserDetailsState();
}

bool _isLoading = false;

class _NewUserDetailsState extends State<NewUserDetails> {
  final _currentDate = DateTime.now();

  String _displayId = "0";
  String _expireDate = "";
  String _activateDate = "";


   String _countryId = "0";
  String _stateId = "0";
  String _cityId = "0";
  bool recruiterIsVerified = false;

  // String _packageId = "3";
  DateTime? _selectedDate;
  int _currentStep = 0;
  var _businessType = [
    "Select business type",
    "Corporation",
    "LLC",
    "Partnership",
    "Sole Proprietorship",
  ];
  String _currentBusinessType = 'Select business type';

  GlobalKey<FormState> formKey = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PageController _pageViewController = PageController(
    initialPage: 0,
  );

  TextEditingController _countryController = TextEditingController();
  TextEditingController _userDobController = TextEditingController();
  TextEditingController _userFullNameController = TextEditingController();
  TextEditingController _userZipcodeController = TextEditingController();
  TextEditingController _userCityController = TextEditingController();
  TextEditingController _userPhoneNumberController = TextEditingController();
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _userSSNController = TextEditingController();
  TextEditingController _userCountryCodeController = TextEditingController();
  TextEditingController _userStateController = TextEditingController();
  TextEditingController _userPasswordController = TextEditingController();
  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _companyZipCodeController = TextEditingController();
  TextEditingController _companyNAICEController = TextEditingController();
  TextEditingController _companyEINController = TextEditingController();
  TextEditingController _companyCityController = TextEditingController();
  TextEditingController _companyStateController = TextEditingController();

  FocusNode _naiceFocus = FocusNode();
  FocusNode _businessNameFocus = FocusNode();
  FocusNode _businessEINFocus = FocusNode();
  FocusNode _businessAddressFocus = FocusNode();
  FocusNode _businessZipCodeFocus = FocusNode();
  FocusNode _businessCityFocus = FocusNode();
  FocusNode _businessStateFocus = FocusNode();

  FocusNode _ssnFocus = FocusNode();
  FocusNode _fullnameFocus = FocusNode();
  FocusNode _zipCodeFocus = FocusNode();
  FocusNode _cityFocus = FocusNode();
  FocusNode _stateFocus = FocusNode();
  FocusNode _dobFocus = FocusNode();
  FocusNode _numberFocus = FocusNode();
  FocusNode _countryFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();

  @override
  void dispose() {
    _countryController.dispose();
    _userSSNController.dispose();
    _userFullNameController.dispose();
    _userZipcodeController.dispose();
    _userCityController.dispose();
    _userPhoneNumberController.dispose();
    _userEmailController.dispose();
    _companyEINController.dispose();
    _userCountryCodeController.dispose();
    _userPasswordController.dispose();
    _companyNameController.dispose();
    _companyZipCodeController.dispose();
    _userStateController.dispose();
    _companyNAICEController.dispose();
    _pageViewController.dispose();
    super.dispose();
  }

  List<Step> getSteps() => [
        Step(
          state: _currentStep <= 0 ? StepState.editing : StepState.complete,
          isActive: _currentStep >= 0,
          title: Text(
            "Personal",
            style: TextStyle(fontSize: 10.0),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height/ 1.9,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _userSSNController,
                  focusNode: _ssnFocus,
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      isDense: true,
                      labelStyle: TextStyle(
                          color: _ssnFocus.hasFocus
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
                      labelText: _ssnFocus.hasFocus
                          ? "Enter Social Security Number"
                          : "SSN"),
                  inputFormatters: [LengthLimitingTextInputFormatter(9)],
                  onTap: () {
                    setState(() {
                      FocusScope.of(context).unfocus();
                      FocusScope.of(context).requestFocus(_ssnFocus);
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return "SSN is required";
                    } else if (value.length != 9) {
                      return "please enter valid SSN";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _userFullNameController,
                  focusNode: _fullnameFocus,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      isDense: true,
                      labelStyle: TextStyle(
                          color: _fullnameFocus.hasFocus
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
                      labelText: _fullnameFocus.hasFocus
                          ? "Enter your full name"
                          : "Full Name"),
                  onTap: () {
                    setState(() {
                      FocusScope.of(context).unfocus();
                      FocusScope.of(context).requestFocus(_fullnameFocus);
                    });
                  },
                  validator: (value) {
                    String pattern = r'^[a-z A-Z,.\-]+$';
                    RegExp regExp = new RegExp(pattern);
                    if (value == null || value.trim().isEmpty) {
                      return 'Your full name is required';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Please enter valid full name';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  focusNode: _emailFocus,
                  controller: _userEmailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      isDense: true,
                      labelStyle: TextStyle(
                          color: _emailFocus.hasFocus
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
                      labelText: _emailFocus.hasFocus
                          ? "Enter your email address"
                          : "Email address"),
                  onTap: () {
                    setState(() {
                      FocusScope.of(context).unfocus();
                      FocusScope.of(context).requestFocus(_emailFocus);
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Email address is required";
                    } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return 'Enter valid email address';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4.4,
                      child: TextFormField(
                        readOnly: true,
                        autofocus: false,
                        controller: _countryController,
                        style: TextStyle(color: Colors.black87),
                        focusNode: _countryFocus,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.only(left: 8, right: 8),
                          labelStyle: TextStyle(
                              color: _countryFocus.hasFocus
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
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 6),
                            child: Image.network(
                              Provider.of<LoginProvider>(context, listen: false)
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
                        inputFormatters: [LengthLimitingTextInputFormatter(10)],
                        onTap: () {
                          FocusScope.of(context).unfocus();

                          showCountryList(context);
                          setState(() {
                            if (_countryFocus.hasFocus) {
                              _countryFocus.unfocus();
                            }
                            FocusScope.of(context).requestFocus(_countryFocus);
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 8),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.47,
                      child: TextFormField(
                        controller: _userPhoneNumberController,
                        autofocus: false,
                        focusNode: _numberFocus,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            isDense: true,
                            labelStyle: TextStyle(
                                color: _numberFocus.hasFocus
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
                            labelText: _numberFocus.hasFocus
                                ? "Mobile Number"
                                : "Enter your mobile number registered with us"),
                        inputFormatters: [LengthLimitingTextInputFormatter(10)],
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            if (value.length == 10 || value.length == 9) {
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
                            FocusScope.of(context).unfocus();
                            FocusScope.of(context).requestFocus(_numberFocus);
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _userZipcodeController,
                  focusNode: _zipCodeFocus,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (value) {},
                  onChanged: (value) {
                    if (value.length == 5) {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              backgroundColor: Colors.white,
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Lottie.asset(
                                    'assets/loading/animations/loading.json',
                                    width: 200,
                                    height: 200,
                                  )
                                ],
                              ),
                            );
                          });

                      Provider.of<LoginProvider>(context, listen: false)
                          .getCityFromZip(value, context)
                          .then((value) {});
                    }
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      labelStyle: TextStyle(
                          color: _zipCodeFocus.hasFocus
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
                      labelText: _zipCodeFocus.hasFocus
                          ? "Enter your Zip Code"
                          : "Zip Code"),
                  onTap: () {
                    setState(() {
                      FocusScope.of(context).unfocus();
                      FocusScope.of(context).requestFocus(_zipCodeFocus);
                    });
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Zipcode is required ";
                    } else if (value.length != 5) {
                      return "Enter valid Zipcode";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _userCityController,
                  focusNode: _cityFocus,
                  readOnly: true,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      isDense: true,
                      labelStyle: TextStyle(
                          color: _cityFocus.hasFocus
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
                            color: Colors.grey.shade700,
                            style: BorderStyle.solid,
                            width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      labelText:
                          _cityFocus.hasFocus ? "Enter your City" : "City"),
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Fluttertoast.showToast(
                        msg: 'Please enter zipcode',
                        backgroundColor: Colors.black.withOpacity(0.6),
                        textColor: Colors.white70,
                        toastLength: Toast.LENGTH_SHORT);
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _userStateController,
                  focusNode: _stateFocus,
                  readOnly: true,
                  decoration: InputDecoration(
                      isDense: true,
                      labelStyle: TextStyle(
                          color: _stateFocus.hasFocus
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
                            color: Colors.grey.shade700,
                            style: BorderStyle.solid,
                            width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      labelText: _stateFocus.hasFocus
                          ? "Enter state your state is located at"
                          : "State"),
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Fluttertoast.showToast(
                        msg: 'Please enter zipcode',
                        backgroundColor: Colors.black.withOpacity(0.6),
                        textColor: Colors.white70,
                        toastLength: Toast.LENGTH_SHORT);
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _userDobController,
                  focusNode: _dobFocus,
                  readOnly: true,
                  decoration: InputDecoration(
                      isDense: true,
                      labelStyle: TextStyle(
                          color: _dobFocus.hasFocus
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
                      labelText: _dobFocus.hasFocus
                          ? "Select your Date of Birth"
                          : "Date of Birth"),
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    pickDate(context);
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please select your date of birth";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
        Step(
          state: _currentStep <= 1 ? StepState.editing : StepState.complete,
          isActive: _currentStep >= 1,
          title: Text(
            "Company",
            style: TextStyle(fontSize: 10.0),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            //height: MediaQuery.of(context).size.height/ 1.9,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _companyNAICEController,
                  focusNode: _naiceFocus,
                  autofocus: true,
                  readOnly: true,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                      isDense: true,
                      labelStyle: TextStyle(
                          color: _naiceFocus.hasFocus
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
                            color: Colors.grey.shade700,
                            style: BorderStyle.solid,
                            width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      labelText: !_naiceFocus.hasFocus
                          ? "Select your business category"
                          : "NAICE Code"),
                  onTap: () {
                    scaffoldKey.currentState!.showBottomSheet(
                        (context) => Container(
                              color: Colors.transparent,
                              padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.3),
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  child: NAICECategory()),
                            ),
                        backgroundColor: Colors.black38,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))));
                    setState(() {
                      FocusScope.of(context).unfocus();
                      FocusScope.of(context).requestFocus(_naiceFocus);
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return "please select your business type";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _companyNameController,
                  focusNode: _businessNameFocus,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      isDense: true,
                      labelStyle: TextStyle(
                          color: _businessNameFocus.hasFocus
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
                      labelText: !_businessNameFocus.hasFocus
                          ? "Enter your  business name"
                          : "Business Name"),
                  onTap: () {
                    setState(() {
                      FocusScope.of(context).unfocus();
                      FocusScope.of(context).requestFocus(_businessNameFocus);
                    });
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Business name is required';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _companyEINController,
                  focusNode: _businessEINFocus,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      isDense: true,
                      labelStyle: TextStyle(
                          color: _businessEINFocus.hasFocus
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
                      labelText: !_businessEINFocus.hasFocus
                          ? "Employer Identification Number "
                          : "EIN"),
                  onTap: () {
                    setState(() {
                      FocusScope.of(context).unfocus();
                      FocusScope.of(context).requestFocus(_businessEINFocus);
                    });
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Employer Identification Number is required';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                          isDense: true,
                          labelStyle: TextStyle(
                              color: _businessAddressFocus.hasFocus
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
                          hintText: "Select business type"),
                      isEmpty: _currentBusinessType == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _currentBusinessType,
                          isDense: true,
                          onChanged: (String? groupValue) {
                            setState(() {
                              _currentBusinessType = groupValue!;
                              state.didChange(groupValue);
                            });
                          },
                          items: _businessType.map((String item) {
                            return DropdownMenuItem<String>(
                                child: Text(
                                  item,
                                  style: TextStyle(color: Colors.grey),
                                ),
                                value: item.toString());
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  focusNode: _businessZipCodeFocus,
                  controller: _companyZipCodeController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    if (value.length == 5) {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              backgroundColor: Colors.white,
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Lottie.asset(
                                    'assets/loading/animations/loading.json',
                                    width: 200,
                                    height: 200,
                                  )
                                ],
                              ),
                            );
                          });
                      Provider.of<BusinessProvider>(context, listen: false)
                          .getCityFromZip(value, context)
                          .then((value) {});
                    }
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      labelStyle: TextStyle(
                          color: _businessZipCodeFocus.hasFocus
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
                      labelText: !_businessZipCodeFocus.hasFocus
                          ? "Enter your workplace zipcode"
                          : "Zipcode"),
                  onTap: () {
                    setState(() {
                      FocusScope.of(context).unfocus();
                      FocusScope.of(context)
                          .requestFocus(_businessZipCodeFocus);
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Zipcode is required";
                    } else if (value.length != 5) {
                      return "Enter valid zipcode";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _companyCityController,
                  focusNode: _businessCityFocus,
                  keyboardType: TextInputType.text,
                  readOnly: true,
                  onFieldSubmitted: (value) {},
                  decoration: InputDecoration(
                      isDense: true,
                      labelStyle: TextStyle(
                          color: _businessCityFocus.hasFocus
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
                      labelText: _businessCityFocus.hasFocus
                          ? "Enter your business city"
                          : "Business city"),
                  onTap: () {
                    setState(() {
                      FocusScope.of(context).unfocus();
                      FocusScope.of(context).requestFocus(_businessCityFocus);
                    });
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Zipcode is required ";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _companyStateController,
                  focusNode: _businessStateFocus,
                  readOnly: true,
                  decoration: InputDecoration(
                      isDense: true,
                      labelStyle: TextStyle(
                          color: _businessStateFocus.hasFocus
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
                            color: Colors.grey.shade700,
                            style: BorderStyle.solid,
                            width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      labelText: _businessStateFocus.hasFocus
                          ? "Enter state your business is located at"
                          : "State"),
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Fluttertoast.showToast(
                        msg: 'Please enter zipcode',
                        backgroundColor: Colors.black.withOpacity(0.6),
                        textColor: Colors.white70,
                        toastLength: Toast.LENGTH_SHORT);
                  },
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
        Step(
            state: StepState.complete,
            isActive: _currentStep >= 2,
            title: Text(
              "Confirm",
              style: TextStyle(fontSize: 10.0),
            ),
            content: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Full Name: ${_userFullNameController.text}"),
                  Text("SSN: ${_userSSNController.text}"),
                  Text("Country Code: ${_countryController.text}"),
                  Text("Phone Number: ${_userPhoneNumberController.text}"),
                  Text("Email: ${_userEmailController.text}"),
                  Text("Zipcode: ${_userZipcodeController.text}"),
                  Text("City: ${_userCityController.text}"),
                  Text("State: ${_userStateController.text}"),
                  Text("EIN: ${_companyEINController.text}"),
                  Text("D.O.B: ${_userDobController.text}"),
                  Text("NAICE CODE: ${_companyNAICEController.text}"),
                  Text("Business Type: $_currentBusinessType"),
                  Text("Company Name: ${_companyNameController.text}"),
                  Text("Company Zipcode: ${_companyZipCodeController.text}"),
                  Text("Company City: ${_companyCityController.text}"),
                  Text("Company State: ${_companyStateController.text}"),
                ],
              ),
            ))
      ];

  @override
  void initState() {
    Provider.of<LoginProvider>(context, listen: false)
        .getCountry()
        .then((value) {
      setState(() {
        _isLoading = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //dynamic getPackageId = Preferences().getPackageId();
    final country = Provider.of<LoginProvider>(context);
    _userStateController.text = country.userstate;
    final selection = Provider.of<SelectionProvider>(context);
    _userCityController.text = country.cityname;

    if (country.selectedCountry != null) {
      setState(() {
        _countryController.text = country.selectedCountry!.cCode;
      });
    }

    final business = Provider.of<BusinessProvider>(context);
    _companyCityController.text = business.companycity;
    _companyStateController.text = business.companystate;

    if (business.selected != null) {
      _companyNAICEController.text =
          '${business.selected!.code}  ${business.selected!.NAICE}';
    }

    return Scaffold(
        key: scaffoldKey,
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
        body: _isLoading
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Let\'s get you started",
                        style: TextStyle(
                            fontFamily: "Poppins", color: Colors.black87),
                      ),
                      Text(
                        'Tell us your details',
                        style: TextStyle(
                            color: Colors.black87,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: Theme(
                          data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                  primary: ColorConstant.primary),
                              backgroundColor: Colors.grey..withOpacity(0.2),
                              iconTheme: IconThemeData(size: 5.0)),
                          child: Stepper(
                            elevation: 0,
                            physics: BouncingScrollPhysics(),
                            type: StepperType.horizontal,
                            steps: getSteps(),
                            currentStep: _currentStep,
                            onStepContinue: () async{
                              final SharedPreferences prefs = await SharedPreferences.getInstance();
                              String packageId = prefs.getString("packageId") ?? "" ;
                              if (_currentStep < (getSteps().length - 1)) {
                                setState(() {
                                  _currentStep += 1;
                                });
                              } else {
                                print('Recruiter Details:');
                                // final form = _signUpFormKey.currentState;
                                // form!.save();

                                if (selection.userSelection ==
                                    Constants.shifter) {
                                  Navigator.of(context)
                                      .pushNamed(UserCategory.Tag);
                                } else {
                                  Navigator.push(context, PageTransition(
                                      child: VerifyActivity(
                                        displayId: _displayId,
                                        ein: _companyEINController.text,
                                        ssn: _userSSNController.text,
                                        naice: _companyNAICEController
                                            .text,
                                        dob: _userDobController.text,
                                        businessType:
                                        _currentBusinessType,
                                        companyName:
                                        _companyNameController.text,
                                        companyZipcode:
                                        _companyZipCodeController
                                            .text,
                                        companyCity:
                                        _companyCityController.text,
                                        companyState:
                                        _companyStateController
                                            .text,
                                        city: _userCityController.text,
                                        state:
                                        _userStateController.text,
                                        zipcode:
                                        _userZipcodeController.text,
                                        fullName:
                                        _userFullNameController
                                            .text,
                                        password:
                                        _userPasswordController
                                            .text,
                                        countryCode:
                                        _userCountryCodeController
                                            .text,
                                        packageId:
                                        int.parse(packageId),
                                        activateDate: _activateDate,
                                        expiryDate: _expireDate,
                                        countryId:
                                        _countryController.text,
                                        stateId: _stateId,
                                        cityId: _cityId,
                                        email: _userEmailController.text,
                                        phone: _userPhoneNumberController.text,), type: PageTransitionType.bottomToTop));
                                    // showDialog(
                                    //     context: context,
                                    //     barrierDismissible: true,
                                    //     builder: (BuildContext context) {
                                    //       return Center(
                                    //         child: Container(
                                    //           child: PlanWidget(
                                    //               displayId: _displayId,
                                    //               ein: _companyEINController.text,
                                    //               ssn: _userSSNController.text,
                                    //               naice: _companyNAICEController
                                    //                   .text,
                                    //               dob: _userDobController.text,
                                    //               businessType:
                                    //               _currentBusinessType,
                                    //               companyName:
                                    //               _companyNameController.text,
                                    //               companyZipcode:
                                    //               _companyZipCodeController
                                    //                   .text,
                                    //               companyCity:
                                    //               _companyCityController.text,
                                    //               companyState:
                                    //               _companyStateController
                                    //                   .text,
                                    //               city: _userCityController.text,
                                    //               state:
                                    //               _userStateController.text,
                                    //               zipcode:
                                    //               _userZipcodeController.text,
                                    //               fullName:
                                    //               _userFullNameController
                                    //                   .text,
                                    //               email:
                                    //               _userEmailController.text,
                                    //               phone:
                                    //               _userPhoneNumberController
                                    //                   .text,
                                    //               password:
                                    //               _userPasswordController
                                    //                   .text,
                                    //               countryCode:
                                    //               _userCountryCodeController
                                    //                   .text,
                                    //               packageId:
                                    //               int.parse(packageId),
                                    //               activateDate: _activateDate,
                                    //               expiryDate: _expireDate,
                                    //               countryId:
                                    //               _countryController.text,
                                    //               stateId: _stateId,
                                    //               cityId: _cityId),
                                    //         ),
                                    //       );
                                    //     });

                                  // showGeneralDialog(
                                  //     context: context,
                                  //     barrierDismissible: false,
                                  //     barrierLabel:
                                  //         MaterialLocalizations.of(context)
                                  //             .modalBarrierDismissLabel,
                                  //     barrierColor: Colors.transparent,
                                  //     transitionDuration:
                                  //         const Duration(milliseconds: 200),
                                  //     pageBuilder: (BuildContext buildContext,
                                  //         Animation animation,
                                  //         Animation secondaryAnimation) {
                                  //       return Padding(
                                  //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  //         child: PlanWidget(),
                                  //       );
                                  //     });

                                  //save and send to payment page

                                  // Preferences().saveController(
                                  //     _displayId,
                                  //     _companyEINController.text,
                                  //     _userSSNController.text,
                                  //     _companyNAICEController.text,
                                  //     _userDobController.text,
                                  //     _currentBusinessType,
                                  //     _companyNameController.text,
                                  //     _companyZipCodeController.text,
                                  //     _companyCityController.text,
                                  //     _companyStateController.text,
                                  //     _userCityController.text,
                                  //     _userStateController.text,
                                  //     _userZipcodeController.text,
                                  //     _userFullNameController.text,
                                  //     _userEmailController.text,
                                  //     _userPhoneNumberController.text,
                                  //     _userPasswordController.text,
                                  //     _userCountryCodeController.text,
                                  //     int.parse(getPackageId),
                                  //     _activateDate,
                                  //     _expireDate,
                                  //     _countryController.text,
                                  //     _stateId,
                                  //     _cityId);
                                  // auth
                                  //     .register(
                                  //         _displayId,
                                  //         _companyEINController.text,
                                  //         _userSSNController.text,
                                  //         _companyNAICEController.text,
                                  //         _userDobController.text,
                                  //         _currentBusinessType,
                                  //         _companyNameController.text,
                                  //         _companyZipCodeController.text,
                                  //         _companyCityController.text,
                                  //         _companyStateController.text,
                                  //         _userCityController.text,
                                  //         _userStateController.text,
                                  //         _userZipcodeController.text,
                                  //         _userFullNameController.text,
                                  //         _userEmailController.text,
                                  //         _userPhoneNumberController.text,
                                  //         _userPasswordController.text,
                                  //         _userCountryCodeController.text,
                                  //         int.parse(getPackageId),
                                  //         _activateDate,
                                  //         _expireDate,
                                  //         _countryController.text,
                                  //         _stateId,
                                  //         _cityId)
                                  //     .then((response) {
                                  //   if (response['status']) {
                                  //     Recruiter recruiter = response['data'];
                                  //     Provider.of<RecruiterProvider>(context,
                                  //             listen: false)
                                  //         .setRecruiter(recruiter);
                                  //     Navigator.of(context)
                                  //         .pushReplacementNamed(
                                  //             LoginActivity.Tag);
                                  //   } else {
                                  //     showErrorMessage(
                                  //         context: context,
                                  //         title: "Registration Failed",
                                  //         body: response.toString(),
                                  //         type: messageType.Error,
                                  //         buttonFunction: () {});
                                  //   }
                                  // });
                                }
                              }
                            },
                            onStepCancel: () {
                              if (_currentStep == 0) {
                                return;
                              }
                              setState(() {
                                _currentStep -= 1;
                              });
                            },
                            onStepTapped: (int index) {
                              setState(() {
                                _currentStep = index;
                              });
                            },
                            controlsBuilder: (context,
                                {onStepContinue, onStepCancel}) {
                              final isLastStep =
                                  _currentStep == getSteps().length - 1;
                              return Container(
                                child: Row(
                                  children: [
                                    if (_currentStep > 0)
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: onStepCancel,
                                          child: const Text('Back'),
                                        ),
                                      ),
                                    const SizedBox(
                                      width: 10,
                                    ),

                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: onStepContinue,
                                        child: Text(
                                            isLastStep ? 'Submit' : 'Next'),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : LoadingScreen());
  }

  void pickDate(BuildContext context) async {
    await showDatePicker(
        context: context,
        initialDate: _currentDate,
        firstDate: DateTime(1900),
        useRootNavigator: true,
        currentDate: _currentDate,
        helpText: 'Select your date of birth',
        lastDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: Colors.amber.shade600,
                  onPrimary: Colors.black87,
                  onSurface: Colors.black54,
                ),
                textButtonTheme: TextButtonThemeData(
                    style:
                        TextButton.styleFrom(primary: Colors.amber.shade800))),
            child: child!,
          );
        }).then((value) {
      setState(() {
        _userDobController.text = DateFormat('dd/MMM/yyyy').format(value!);
      });
    });
  }
}
