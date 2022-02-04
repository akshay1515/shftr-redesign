import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:provider/provider.dart';
import 'package:shifter/features/shifter/presentation/models/recruiter/recruiter.dart';
import 'package:shifter/features/shifter/presentation/provider/signupprovider/signup_provider.dart';
import 'package:shifter/features/shifter/presentation/widgets/loadingscreen.dart';
import 'package:shifter/utils/preferences/recruiter_preferences.dart';


class CreditCardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreditCardPageState();
  }
}

class CreditCardPageState extends State<CreditCardPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  // bool useGlassMorphism = false;
  //bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Future<Recruiter> getController() => Preferences().getController();
    return  Scaffold(
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
      body: FutureBuilder(
        future: getController(),
        builder: (context, snapshot){
          switch (snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return LoadingScreen();
            default:
              if(snapshot.hasError){
                return Center(child: Text("Error: ${snapshot.error}"),);

              }else if(snapshot.hasData){
                return Container(
                  decoration: BoxDecoration(
                      image:
                      const DecorationImage(
                        image: ExactAssetImage('assets/images/img_home_back.png'),
                        fit: BoxFit.cover,
                      )
                  ),
                  child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 30,
                        ),
                        CreditCardWidget(
                          glassmorphismConfig:
                          Glassmorphism.defaultConfig() ,
                          cardNumber: cardNumber,
                          expiryDate: expiryDate,
                          cardHolderName: cardHolderName,
                          cvvCode: cvvCode,
                          showBackView: isCvvFocused,
                          obscureCardNumber: true,
                          obscureCardCvv: true,
                          isHolderNameVisible: true,
                          // cardBgColor: Colors.red,
                          backgroundImage:
                          'assets/images/card_bg.png',
                          isSwipeGestureEnabled: true,
                          onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
                          customCardTypeIcons: <CustomCardTypeIcon>[
                            CustomCardTypeIcon(
                              cardType: CardType.mastercard,
                              cardImage: Image.asset(
                                'assets/mastercard.png',
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
                                    labelStyle: const TextStyle(color: Colors.white),
                                    focusedBorder: border,
                                    enabledBorder: border,
                                  ),
                                  expiryDateDecoration: InputDecoration(
                                    hintStyle: const TextStyle(color: Colors.white),
                                    labelStyle: const TextStyle(color: Colors.white),
                                    focusedBorder: border,
                                    enabledBorder: border,
                                    labelText: 'Expired Date',
                                    hintText: 'XX/XX',
                                  ),
                                  cvvCodeDecoration: InputDecoration(
                                    hintStyle: const TextStyle(color: Colors.white),
                                    labelStyle: const TextStyle(color: Colors.white),
                                    focusedBorder: border,
                                    enabledBorder: border,
                                    labelText: 'CVV',
                                    hintText: 'XXX',
                                  ),
                                  cardHolderDecoration: InputDecoration(
                                    hintStyle: const TextStyle(color: Colors.white),
                                    labelStyle: const TextStyle(color: Colors.white),
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
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(200, 55),
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


                                    } else {
                                      print('invalid!');
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }else{
                Preferences().removeController();
              }
              return LoadingScreen();
          }
        },
      ),
    );
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
}
