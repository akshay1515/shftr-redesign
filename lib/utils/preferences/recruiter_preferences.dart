import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'package:shifter/features/shifter/presentation/models/recruiter/recruiter.dart';

class RecruiterPreferences {
  Future<bool> saveRecruiter(Recruiter recruiter) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("id", recruiter.id ?? "");
    prefs.setString("displayId", recruiter.displayId ?? "");
    prefs.setString("fcmToken", recruiter.fcmToken ?? "");
    prefs.setString("ein", recruiter.ein ?? "");
    prefs.setString("ssn", recruiter.ssn ?? "");
    prefs.setString("userHandle", recruiter.userHandle ?? "");
    prefs.setString("userPrivateKey", recruiter.userPrivateKey ?? "");
    prefs.setString("businessType", recruiter.businessType ?? "");
    prefs.setString("companyName", recruiter.companyName ?? "");
    prefs.setString("companyTagline", recruiter.companyTagline ?? "");
    prefs.setString("companyDescription", recruiter.companyDescription ?? "");
    prefs.setString("companyZipcode", recruiter.companyZipcode ?? "");
    prefs.setString("companyCity", recruiter.companyCity ?? "");
    prefs.setString("companyState", recruiter.companyZipcode ?? "");
    prefs.setString("companyFounded", recruiter.companyFounded ?? "");
    prefs.setString("companySize", recruiter.companySize ?? "");
    prefs.setString("companyLogo", recruiter.companyLogo ?? "");
    prefs.setString("city", recruiter.city ?? "");
    prefs.setString("state", recruiter.state ?? "");
    prefs.setString("zipCode", recruiter.zipCode ?? "");
    prefs.setString("name", recruiter.name ?? "");
    prefs.setString("designation", recruiter.designation ?? "");
    prefs.setString("loginVia", recruiter.loginVia ?? "");
    prefs.setString("email", recruiter.email ?? "");
    prefs.setString("phoneNumber", recruiter.phoneNumber ?? "");
    prefs.setString("password", recruiter.password ?? "");
    prefs.setString("countryCode", recruiter.countryCode ?? "");
    prefs.setString("profileImage", recruiter.profileImage ?? "");
    prefs.setString("packageId", recruiter.packageId ?? "");
    prefs.setString("activateDate", recruiter.activateDate ?? "");
    prefs.setString("expireDate", recruiter.expireDate ?? "");
    prefs.setString("rateOne", recruiter.rateOne ?? "");
    prefs.setString("rateTwo", recruiter.rateTwo ?? "");
    prefs.setString("rateThree", recruiter.rateThree ?? "");
    prefs.setString("rateFour", recruiter.rateFour ?? "");
    prefs.setString("rateFive", recruiter.rateFive ?? "");
    prefs.setString("accountName", recruiter.accountName ?? "");
    prefs.setString("accountNumber", recruiter.accountNumber ?? "");
    prefs.setString("routingNumber", recruiter.routingNumber ?? "");
    prefs.setString("countryId", recruiter.countryId ?? "");
    prefs.setString("stateId", recruiter.stateId ?? "");
    prefs.setString("cityId", recruiter.cityId ?? "");

    return prefs.commit();
  }

  Future<Recruiter> getRecruiter() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String id = prefs.getString("id") ?? "";
    String displayId = prefs.getString("displayId") ?? "";
    String fcmToken = prefs.getString("fcmToken") ?? "";
    String ein = prefs.getString("ein") ?? "";
    String ssn = prefs.getString("ssn") ?? "";
    String userHandle = prefs.getString("userHandle") ?? "";
    String userPrivateKey = prefs.getString("userPrivateKey") ?? "";
    String businessType = prefs.getString("businessType") ?? "";
    String companyName = prefs.getString("companyName") ?? "";
    String companyTagline = prefs.getString("companyTagline") ?? "";
    String companyDescription = prefs.getString("companyDescription") ?? "";
    String companyZipcode = prefs.getString("companyLocation") ?? "";
    String companyState = prefs.getString("companyState") ?? "";
    String companyCity = prefs.getString("companyCity") ?? "";
    String companyFounded = prefs.getString("companyFounded") ?? "";
    String companySize = prefs.getString("companySize") ?? "";
    String companyLogo = prefs.getString("companyLogo") ?? "";
    String city = prefs.getString("city") ?? "";
    String state = prefs.getString("state") ?? "";
    String zipCode = prefs.getString("zipCode") ?? "";
    String name = prefs.getString("name") ?? "";
    String designation = prefs.getString("designation") ?? "";
    String loginVia = prefs.getString("loginVia") ?? "";
    String email = prefs.getString("email") ?? "";
    String phoneNumber = prefs.getString("phoneNumber") ?? "";
    String password = prefs.getString("password") ?? "";
    String countryCode = prefs.getString("countryCode") ?? "";
    String profileImage = prefs.getString("profileImage") ?? "";
    String packageId = prefs.getString("packageId") ?? "";
    String activateDate = prefs.getString("activateDate") ?? "";
    String expireDate = prefs.getString("expireDate") ?? "";
    String rateOne = prefs.getString("rateOne") ?? "";
    String rateTwo = prefs.getString("rateTwo") ?? "";
    String rateThree = prefs.getString("rateThree") ?? "";
    String rateFour = prefs.getString("rateFour") ?? "";
    String rateFive = prefs.getString("rateFive") ?? "";
    String accountName = prefs.getString("accountName") ?? "";
    String accountNumber = prefs.getString("accountNumber") ?? "";
    String routingNumber = prefs.getString("routingNumber") ?? "";
    String countryId = prefs.getString("countryId") ?? "";
    String stateId = prefs.getString("stateId") ?? "";
    String cityId = prefs.getString("cityId") ?? "";

    return Recruiter(
      id: id,
      displayId: displayId,
      fcmToken: fcmToken,
      ein: ein,
      ssn: ssn,
      userHandle: userHandle,
      userPrivateKey: userPrivateKey,
      businessType: businessType,
      companyName: companyName,
      companyTagline: companyTagline,
      companyDescription: companyDescription,
      companyZipcode: companyZipcode,
      companyState: companyState,
      companyCity: companyCity,
      companyFounded: companyFounded,
      companySize: companySize,
      companyLogo: companyLogo,
      city: city,
      state: state,
      zipCode: zipCode,
      name: name,
      designation: designation,
      loginVia: loginVia,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
      countryCode: countryCode,
      profileImage: profileImage,
      packageId: packageId,
      activateDate: activateDate,
      expireDate: expireDate,
      rateOne: rateOne,
      rateTwo: rateTwo,
      rateThree: rateThree,
      rateFour: rateFour,
      rateFive: rateFive,
      accountName: accountName,
      accountNumber: accountNumber,
      routingNumber: routingNumber,
      countryId: countryId,
      stateId: stateId,
      cityId: cityId,
    );
  }

  void removeRecruiter() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("id");
    prefs.remove("displayId");
    prefs.remove("fcmToken");
    prefs.remove("ein");
    prefs.remove("ssn");
    prefs.remove("userHandle");
    prefs.remove("userPrivateKey");
    prefs.remove("businesType");
    prefs.remove("companyName");
    prefs.remove("companyTagline");
    prefs.remove("companyDescription");
    prefs.remove("companyZipcode");
    prefs.remove("companyCity");
    prefs.remove("companyState");
    prefs.remove("companyFounded");
    prefs.remove("companySize");
    prefs.remove("companyLogo");
    prefs.remove("city");
    prefs.remove("state");
    prefs.remove("zipCode");
    prefs.remove("name");
    prefs.remove("designation");
    prefs.remove("loginVia");
    prefs.remove("email");
    prefs.remove("phoneNumber");
    prefs.remove("password");
    prefs.remove("countryCode");
    prefs.remove("profileImage");
    prefs.remove("packageId");
    prefs.remove("activateDate");
    prefs.remove("expireDate");
    prefs.remove("rateOne");
    prefs.remove("rateTwo");
    prefs.remove("rateThree");
    prefs.remove("rateFour");
    prefs.remove("rateFive");
    prefs.remove("accountName");
    prefs.remove("accountNumber");
    prefs.remove("routingNumber");
    prefs.remove("countryId");
    prefs.remove("stateId");
    prefs.remove("cityId");
  }

// Future<String> getToken(args) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   String token = prefs.getString("token");
//   return token;
// }
}
