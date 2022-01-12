import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shifter/features/shifter/presentation/pages/signupactivity/businessregister.dart';
import 'package:shifter/features/shifter/presentation/pages/user-category/usercategory.dart';
import 'package:shifter/features/shifter/presentation/provider/loginprovider/login_activity_provider.dart';
import 'package:shifter/features/shifter/presentation/provider/selectionprovider/selection_activity_provider.dart';
import 'package:shifter/features/shifter/presentation/widgets/countrybottomsheet.dart';
import 'package:shifter/features/shifter/presentation/widgets/loadingscreen.dart';
import 'package:shifter/utils/colorconstant.dart';
import 'package:shifter/utils/consants.dart';

class NewUserDetails extends StatefulWidget {
  static const Tag = "-/newuserscreen";

  NewUserDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<NewUserDetails> createState() => _NewUserDetailsState();
}

bool _isLoading = false;

class _NewUserDetailsState extends State<NewUserDetails> {
  final _currentDate = DateTime.now();
  DateTime? _selectedDate;

  GlobalKey<FormState> _signUpFormKey = GlobalKey();

  TextEditingController _countryController = TextEditingController();
  TextEditingController _userfirstNameController = TextEditingController();
  TextEditingController _userlastNameController = TextEditingController();
  TextEditingController _userAddressController = TextEditingController();
  TextEditingController _userZipcodeController = TextEditingController();
  TextEditingController _userCityController = TextEditingController();
  TextEditingController _userDobController = TextEditingController();
  TextEditingController _userphoneNumberController = TextEditingController();
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _userssnController = TextEditingController();

  FocusNode _ssnFocus = FocusNode();
  FocusNode _firstNameFocus = FocusNode();
  FocusNode _lastNameFocus = FocusNode();
  FocusNode _addressFocus = FocusNode();
  FocusNode _zipCodeFocus = FocusNode();
  FocusNode _cityFocus = FocusNode();
  FocusNode _dobFocus = FocusNode();
  FocusNode _numberFocus = FocusNode();
  FocusNode _countryFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final country = Provider.of<LoginProvider>(context);
    final size = MediaQuery.of(context).size;
    final selection = Provider.of<SelectionProvider>(context);
    _userCityController.text = country.cityname;

    if (country.selectedCountry != null) {
      setState(() {
        _countryController.text = country.selectedCountry!.cCode;
      });
    }
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
      body: _isLoading
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
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
                    Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _userssnController,
                            focusNode: _ssnFocus,
                            autofocus: true,
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
                                labelText:
                                    _ssnFocus.hasFocus ? "Enter SSN" : "SSN"),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(9)
                            ],
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
                            controller: _userfirstNameController,
                            focusNode: _firstNameFocus,
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                                isDense: true,
                                labelStyle: TextStyle(
                                    color: _firstNameFocus.hasFocus
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
                                labelText: _firstNameFocus.hasFocus
                                    ? "Enter your  First Name"
                                    : "First Name"),
                            onTap: () {
                              setState(() {
                                FocusScope.of(context).unfocus();
                                FocusScope.of(context)
                                    .requestFocus(_firstNameFocus);
                              });
                            },
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'First name is required';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: _userlastNameController,
                            focusNode: _lastNameFocus,
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                                isDense: true,
                                labelStyle: TextStyle(
                                    color: _lastNameFocus.hasFocus
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
                                labelText: _lastNameFocus.hasFocus
                                    ? "Enter your  Last Name"
                                    : "Last Name"),
                            onTap: () {
                              setState(() {
                                FocusScope.of(context).unfocus();
                                FocusScope.of(context)
                                    .requestFocus(_lastNameFocus);
                              });
                            },
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Last name is required';
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
                                width: size.width * 0.26,
                                child: TextFormField(
                                  readOnly: true,
                                  autofocus: false,
                                  controller: _countryController,
                                  style: TextStyle(color: Colors.black87),
                                  focusNode: _countryFocus,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding:
                                        EdgeInsets.only(left: 8, right: 8),
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
                                    FocusScope.of(context).unfocus();
                                    showCountryList(context);
                                    setState(() {
                                      if (_countryFocus.hasFocus) {
                                        _countryFocus.unfocus();
                                      }
                                      FocusScope.of(context)
                                          .requestFocus(_countryFocus);
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                width: size.width * 0.67,
                                child: TextFormField(
                                  controller: _userphoneNumberController,
                                  autofocus: false,
                                  focusNode: _numberFocus,
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
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10)
                                  ],
                                  validator: (value) {
                                    if (value!.isNotEmpty) {
                                      if (value.length != 10) {
                                        return "Enter valid mobile number";
                                      } else {
                                        return null;
                                      }
                                    } else {
                                      return "Mobile number is required";
                                    }
                                  },
                                  onTap: () {
                                    setState(() {
                                      FocusScope.of(context).unfocus();
                                      FocusScope.of(context)
                                          .requestFocus(_numberFocus);
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
                            focusNode: _emailFocus,
                            controller: _userEmailController,
                            keyboardType: TextInputType.emailAddress,
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
                                    ? "Enter your Email address"
                                    : "Email address"),
                            onTap: () {
                              setState(() {
                                FocusScope.of(context).unfocus();
                                FocusScope.of(context)
                                    .requestFocus(_emailFocus);
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
                          TextFormField(
                              controller: _userAddressController,
                              focusNode: _addressFocus,
                              keyboardType: TextInputType.streetAddress,
                              textCapitalization: TextCapitalization.sentences,
                              decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: TextStyle(
                                      color: _addressFocus.hasFocus
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
                                  labelText: _addressFocus.hasFocus
                                      ? "Enter your Address"
                                      : "Address"),
                              onTap: () {
                                setState(() {
                                  FocusScope.of(context).unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(_addressFocus);
                                });
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Residential address is required";
                                } else {
                                  return null;
                                }
                              }),
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: _userZipcodeController,
                            focusNode: _zipCodeFocus,
                            keyboardType: TextInputType.number,
                            onFieldSubmitted: (value) {},
                            onChanged: (value) {
                              if (value.length == 5) {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
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

                                Provider.of<LoginProvider>(context,
                                        listen: false)
                                    .getCityFromZip(value, context)
                                    .then((value) {
                                });
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
                                FocusScope.of(context)
                                    .requestFocus(_zipCodeFocus);
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
                                labelText: _cityFocus.hasFocus
                                    ? "Enter your City"
                                    : "City"),
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              Fluttertoast.showToast(
                                  msg: 'Please enter zipcode',
                                  backgroundColor:
                                      Colors.black.withOpacity(0.6),
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
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_signUpFormKey.currentState!.validate()) {
                            if (selection.userSelection == Constants.shifter) {
                              Navigator.of(context).pushNamed(UserCategory.Tag);
                            } else {
                              Navigator.of(context)
                                  .pushNamed(RegisterBusiness.Tag);
                            }
                          }
                        },
                        child: Text(
                          selection.userSelection == Constants.shifter
                              ? 'Sign Up'
                              : 'Next',
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
            )
          : LoadingScreen(),
    );
  }

  @override
  void initState() {
    Provider.of<LoginProvider>(context, listen: false)
        .getCountry()
        .then((value) {
      setState(() {
        _isLoading = true;
      });
    });
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
