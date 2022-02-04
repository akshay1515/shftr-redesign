import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:provider/provider.dart';
import 'package:shifter/features/shifter/presentation/models/recruiter/packages.dart';
import 'package:shifter/features/shifter/presentation/models/recruiter/features.dart';
import 'package:shifter/features/shifter/presentation/models/recruiter/recruiter.dart';
import 'package:shifter/features/shifter/presentation/pages/loginactivity/otpactivity.dart';
import 'package:shifter/features/shifter/presentation/pages/loginactivity/otpmailactivity.dart';
import 'package:shifter/features/shifter/presentation/provider/loginprovider/login_activity_provider.dart';
import 'package:shifter/features/shifter/presentation/provider/recruiterprovider/recruiter_provider.dart';
import 'package:shifter/features/shifter/presentation/provider/signupprovider/signup_provider.dart';
import 'package:shifter/features/shifter/presentation/services/recruiter/package_service.dart';
import 'package:shifter/features/shifter/presentation/services/recruiter/features_service.dart';
import 'package:shifter/features/shifter/presentation/widgets/bottom_navigation.dart';
import 'package:shifter/features/shifter/presentation/widgets/loadingscreen.dart';
import 'package:shifter/utils/colorconstant.dart';
import 'package:shifter/utils/fontconstant.dart';
import 'package:shifter/utils/preferences/recruiter_preferences.dart';

import '../show-error-dialog.dart';

class PlanWidget extends StatefulWidget {
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

  PlanWidget(
      {Key? key,
       this.displayId,
       this.ein,
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
       this.email,
       this.phone,
       this.password,
       this.countryCode,
       this.activateDate,
       this.expiryDate,
       this.countryId,
       this.stateId,
       this.cityId,
       this.packageId})
      : super(key: key);

  @override
  State<PlanWidget> createState() => _PlanWidgetState();
}

class _PlanWidgetState extends State<PlanWidget> {
  late Future<List<Package>> futurePackage;
  late Future<List<Feature>> futureFeatureGrowth;
  late Future<List<Feature>> futureFeatureOnDemand;
  late Future<List<Feature>> futureFeatureLaunch;

  bool changeBorderColor = false;
  bool switchedButton = false;
  bool isLoading = false;

  TextEditingController OTPController = TextEditingController();
  TextEditingController emailOTPController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool replaceContainer = false;


  // bool useGlassMorphism = false;
  //bool useBackgroundImage = false;
  OutlineInputBorder? border;

  @override
  void dispose() {
    OTPController.dispose();
    emailOTPController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );

    futurePackage = PackageService.fetchPackage();
    futureFeatureGrowth = FeaturesService.getFeatures("3");
    futureFeatureOnDemand = FeaturesService.getFeatures("4");
    futureFeatureLaunch = FeaturesService.getFeatures("5");
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    SignUpProvider auth = Provider.of<SignUpProvider>(context);
    final size = MediaQuery.of(context).size;
    final country = Provider.of<LoginProvider>(context).selectedCountry;
    return !replaceContainer
        ? Material(
            color: Colors.transparent,
            child: FutureBuilder<dynamic>(
                future: Future.wait([
                  futurePackage,
                  futureFeatureGrowth,
                  futureFeatureOnDemand,
                  futureFeatureLaunch
                ]),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: PageView.builder(
                        controller: PageController(
                          viewportFraction: 0.9,
                          initialPage: 0,
                        ),
                        itemCount: snapshot.data![0].length,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                    blurRadius: 4,
                                    offset: Offset(4, 0), // Shadow position
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 230,
                                    decoration: BoxDecoration(
                                        color: index == 0
                                            ? Colors.deepOrange.shade800
                                            : index == 1
                                                ? Colors.blue.shade800
                                                : Colors.black.withOpacity(0.9),
                                        // color: index % 2 == 0 ? Colors.cyan : Colors.deepOrange,
                                        // color: Colors.black.withOpacity(0.9),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0),
                                        )),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, top: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "\$",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Poppins'),
                                              ),
                                              Text(
                                                "${snapshot.data![0][index].adminFee}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 32.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Poppins'),
                                              ),
                                              Text(
                                                "/month",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 22.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Poppins'),
                                              ),
                                              Text(
                                                "Shift",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 42.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Pacifico'),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.0,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12.0, right: 5.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${snapshot.data![0][index].packageName}",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 22.0,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'Poppins'),
                                              ),
                                              SizedBox(
                                                height: 8.0,
                                              ),
                                              Text(
                                                "${snapshot.data![0][index].shortDescription}",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Poppins'),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 5.0),
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: snapshot
                                                      .data![0][index].id ==
                                                  "3"
                                              ? snapshot.data![1].length
                                              : snapshot.data![0][index].id ==
                                                      "4"
                                                  ? snapshot.data![2].length
                                                  : snapshot.data![0][index]
                                                              .id ==
                                                          "5"
                                                      ? snapshot.data![3].length
                                                      : snapshot
                                                          .data![1].length,
                                          itemBuilder: (BuildContext context,
                                              int indices) {
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor:
                                                      Colors.deepOrange,
                                                  radius: 6.0,
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      1.4,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      snapshot.data![0][index]
                                                                  .id ==
                                                              "3"
                                                          ? "${snapshot.data![1][indices].feature}"
                                                          : snapshot
                                                                      .data![0][
                                                                          index]
                                                                      .id ==
                                                                  "4"
                                                              ? "${snapshot.data![3][indices].feature}"
                                                              : "${snapshot.data![2][indices].feature}",
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14.0),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            );
                                          },
                                        )),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          print(
                                              "Selected index: ${snapshot.data![0][index].id.toString()}");
                                          Preferences().savePackageId(snapshot
                                              .data![0][index].id
                                              .toString());
                                          setState(() {
                                            replaceContainer = true;
                                          });
                                          // showDialogPayment();
                                        },
                                        child: Text(
                                          'SUBSCRIBE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w600),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            minimumSize: Size(200, 55),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8),
                                            primary:
                                                Colors.black.withOpacity(0.8)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    print("${snapshot.error.toString()}");
                    LoadingScreen();
                  }
                  return LoadingScreen();
                }),
          )
    :  Scaffold(
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
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
            image: const DecorationImage(
              image: ExactAssetImage('assets/images/img_home_back.png'),
              fit: BoxFit.cover,
            )),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              CreditCardWidget(
                glassmorphismConfig: Glassmorphism.defaultConfig(),
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                isHolderNameVisible: true,
                // cardBgColor: Colors.red,
                backgroundImage: 'assets/images/card_bg.png',
                isSwipeGestureEnabled: true,
                onCreditCardWidgetChange:
                    (CreditCardBrand creditCardBrand) {},
                customCardTypeIcons: <CustomCardTypeIcon>[
                  CustomCardTypeIcon(
                    cardType: CardType.mastercard,
                    cardImage: Image.asset(
                      'assets/images/mastercard.png',
                      height: 48,
                      width: 48,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      CreditCardForm(
                        formKey: formKey,
                        obscureCvv: true,
                        obscureNumber: true,
                        cardNumber: cardNumber,
                        cvvCode: cvvCode,
                        isHolderNameVisible: true,
                        isCardNumberVisible: true,
                        isExpiryDateVisible: true,
                        cardHolderName: cardHolderName,
                        expiryDate: expiryDate,
                        themeColor: Colors.blue,
                        textColor: Colors.white,
                        cardNumberDecoration: InputDecoration(
                          labelText: 'Number',
                          hintText: 'XXXX XXXX XXXX XXXX',
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle:
                          const TextStyle(color: Colors.white),
                          focusedBorder: border,
                          enabledBorder: border,
                        ),
                        expiryDateDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle:
                          const TextStyle(color: Colors.white),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'Expired Date',
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle:
                          const TextStyle(color: Colors.white),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'CVV',
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle:
                          const TextStyle(color: Colors.white),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'Card Holder',
                        ),
                        onCreditCardModelChange: onCreditCardModelChange,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 15.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(
                                MediaQuery.of(context).size.width, 55),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            primary: Colors.black,
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(12),
                            child: const Text(
                              'Confirm',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'halter',
                                fontSize: 14,
                                package: 'flutter_credit_card',
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print('valid!');
                              print(widget.ssn);
                              auth.register(
                                  widget.displayId,
                                  widget.ein,
                                  widget.ssn,
                                  widget.naice,
                                  widget.dob,
                                  widget.businessType,
                                  widget.companyName,
                                  widget.companyZipcode,
                                  widget.companyState,
                                  widget.companyCity,
                                  widget.city, widget.state,
                                  widget.zipcode,
                                  widget.fullName,
                                  widget.email,
                                  widget.phone,
                                  widget.password,
                                  widget.countryCode,
                                  widget.packageId,
                                  widget.activateDate,
                                  widget.expiryDate,
                                  widget.countryId,
                                  widget.stateId,
                                  widget.cityId)
                                  .then((response) {
                                if (response['status']) {
                                  Recruiter recruiter = response['data'];
                                  Provider.of<RecruiterProvider>(context,
                                      listen: false)
                                      .setRecruiter(recruiter);
                                  Navigator.of(context)
                                      .pushReplacementNamed(
                                      NavScreen.Tag);
                                } else {
                                  showErrorMessage(
                                      context: context,
                                      title: "Registration Failed",
                                      body: response.toString(),
                                      type: messageType.Error,
                                      buttonFunction: () {
                                        Navigator.of(context).pop();
                                      });
                                }
                              });
                            } else {
                              print('invalid!');
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



}
