import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shifter/features/shifter/presentation/pages/homepage/userhomepage.dart';
import 'package:shifter/features/shifter/presentation/provider/businessprovider/businessprovider.dart';
import 'package:shifter/features/shifter/presentation/provider/loginprovider/login_activity_provider.dart';
import 'package:shifter/features/shifter/presentation/widgets/bottom_navigation.dart';
import 'package:shifter/features/shifter/presentation/widgets/selectbusinesstype/naicecategory.dart';
import 'package:shifter/utils/colorconstant.dart';

class RegisterBusiness extends StatefulWidget {
  static const String Tag = "-/registerBusiness";

  const RegisterBusiness({Key? key}) : super(key: key);

  @override
  _RegisterBusinessState createState() => _RegisterBusinessState();
}

 GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
 GlobalKey<FormState> _registerbusiness = GlobalKey<FormState>();

TextEditingController _naiceController = TextEditingController();
TextEditingController _businessNameController = TextEditingController();
TextEditingController _businessEINController = TextEditingController();
TextEditingController _businessAddressController = TextEditingController();
TextEditingController _businessZipCodeController = TextEditingController();
TextEditingController _businessCityController = TextEditingController();
TextEditingController _businessStateController = TextEditingController();

FocusNode _naiceFocus = FocusNode();
FocusNode _businessNameFocus = FocusNode();
FocusNode _businessEINFocus = FocusNode();
FocusNode _businessAddressFocus = FocusNode();
FocusNode _businessZipCodeFocus = FocusNode();
FocusNode _businessCityFocus = FocusNode();
FocusNode _businessStateFocus = FocusNode();

class _RegisterBusinessState extends State<RegisterBusiness> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final business = Provider.of<BusinessProvider>(context);
    _businessCityController.text = business.companycity;
    _businessStateController.text = business.companystate;
    if (business.selected != null) {
      _naiceController.text =
          '${business.selected!.code}  ${business.selected!.NAICE}';
    }
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  "Let\'s get your business registered",
                  style:
                      TextStyle(fontFamily: "Poppins", color: Colors.black87),
                ),
                Text(
                  'Tell us your business details',
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
                  key: _registerbusiness,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _naiceController,
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
                                    padding:
                                        EdgeInsets.only(top: size.height * 0.3),
                                    height: size.height,
                                    width: size.width,
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
                          }else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _businessNameController,
                        focusNode: _businessNameFocus,
                        keyboardType: TextInputType.name,
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
                            FocusScope.of(context)
                                .requestFocus(_businessNameFocus);
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
                        controller: _businessEINController,
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
                            FocusScope.of(context)
                                .requestFocus(_businessEINFocus);
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
                      TextFormField(
                        focusNode: _businessZipCodeFocus,
                        controller: _businessZipCodeController,
                        keyboardType: TextInputType.text,
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
                            Provider.of<BusinessProvider>(context, listen: false)
                                .getCityFromZip(value,context)
                                .then((value) {
                            });
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
                          }  else if(value.length != 5){
                            return "Enter valid zipcode";
                          }else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                          controller: _businessAddressController,
                          focusNode: _businessAddressFocus,
                          keyboardType: TextInputType.streetAddress,
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
                              labelText: _businessAddressFocus.hasFocus
                                  ? "Enter your business address"
                                  : "Business address"),
                          onTap: () {
                            setState(() {
                              FocusScope.of(context).unfocus();
                              FocusScope.of(context)
                                  .requestFocus(_businessAddressFocus);
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
                        controller: _businessCityController,
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
                            FocusScope.of(context)
                                .requestFocus(_businessCityFocus);
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
                        controller: _businessStateController,
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
                      /* SizedBox(
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
                      validator: (value){
                        if(value == null || value.trim().isEmpty){
                          return "Please select your date of birth";
                        }else{
                          return null;
                        }
                      },
                    ),*/
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
                      Navigator.of(context).pushNamed(NavScreen.Tag);
                    },
                    child: Text(
                      'Next',
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
        ));
  }
}
