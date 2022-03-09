import 'package:shared_preferences/shared_preferences.dart';
import 'package:shifter/features/shifter/presentation/models/recruiter/packages.dart';
import 'package:shifter/features/shifter/presentation/models/recruiter/features.dart';
import 'dart:async';

import 'package:shifter/features/shifter/presentation/models/recruiter/recruiter.dart';

class Preferences {
  // Future<bool> savePlan(PlanFeatures planFeatures) async{
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   //
  //   // prefs.setString("planId", planFeatures.id ?? "");
  //   // prefs.setString("feature", planFeatures.feature ?? "");
  //   // prefs.setString("packageId", planFeatures.packageId ?? "");
  //   // prefs.setString("status", planFeatures.status ?? "");
  //   return prefs.commit();
  // }
  //
  // Future<PlanFeatures> getPlan() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   String planId = prefs.getString("planId") ?? "";
  //   String feature = prefs.getString("feature") ?? "";
  //   String packageId = prefs.getString("packageId") ?? "";
  //   String status = prefs.getString("status") ?? "";
  //   //
  //   // return PlanFeatures(
  //   //     id: planId,
  //   //     feature: feature,
  //   //     packageId: packageId,
  //   //     status: status
  //   // );
  //
  //
  // }

  void removePlan() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("planId");
    prefs.remove("feature");
    prefs.remove("status");
    prefs.remove("packageId");
  }

  Future<bool> savePackage(Package packages) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("packageID", packages.id ?? "0");
    prefs.setString("packageName", packages.packageName ?? "");
    prefs.setString("shortDescription", packages.shortDescription ?? "");
    prefs.setString("adminFee", packages.adminFee ?? "");
    return prefs.commit();
  }

  Future<bool> savePackageId(String packageId) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("packageId", packageId);
    return prefs.commit();
  }
  //
  //  getPackageId() async{
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String packageId = prefs.getString("packageId") ?? "" ;
  //   return packageId;
  // }

  Future<bool> saveController( String displayId,
      String ein,
      String ssn,
      String naice,
      String dob,
      String businessType,
      String companyName,
      String companyZipcode,
      String companyState,
      String companyCity,
      String city,
      String state,
      String zipCode,
      String name,
      String email,
      String phoneNumber,
      String password,
      String countryCode,
      int packageId,
      String activateDate,
      String expireDate,
      String countryId,
      String stateId,
      String cityId)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Ein", ein);
    prefs.setString("Ssn", ssn);
    prefs.setString("Naice", naice);
    prefs.setString("DOB", dob);
    prefs.setString("BusinessType", businessType);
    prefs.setString("CompanyName", companyName);
    prefs.setString("CompanyZipcode", companyZipcode);
    prefs.setString("CompanyState", companyState);
    prefs.setString("CompanyCity", companyCity);
    prefs.setString("City", city);
    prefs.setString("State", state);
    prefs.setString("ZipCode", zipCode);
    prefs.setString("Name", name);
    prefs.setString("Email", email);
    prefs.setString("Phone", phoneNumber);
    prefs.setString("Password", password);
    prefs.setString("CountryCode", countryCode);
    prefs.setInt("PackageId", packageId);
    prefs.setString("ActivateDate", activateDate);
    prefs.setString("ExpireDate", expireDate);
    prefs.setString("CountryId", countryId);
    prefs.setString("StateId", stateId);
    prefs.setString("CityId", cityId);

    return prefs.commit();
  }

  Future<Recruiter> getController() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String ein = prefs.getString("Ein") ?? "" ;
    String ssn = prefs.getString("Ssn") ?? "" ;
    String naice = prefs.getString("Naice") ?? "" ;
    String dob = prefs.getString("DOB") ?? "" ;
    String businessType = prefs.getString("BusinessType") ?? "" ;
    String companyName = prefs.getString("CompanyName") ?? "" ;
    String companyZipcode = prefs.getString("CompanyZipcode") ?? "" ;
    String companyState = prefs.getString("CompanyState") ?? "" ;
    String companyCity = prefs.getString("CompanyCity") ?? "" ;
    String city = prefs.getString("City") ?? "" ;
    String state = prefs.getString("State") ?? "" ;
    String zipCode = prefs.getString("ZipCode") ?? "" ;
    String name = prefs.getString("Name") ?? "" ;
    String email = prefs.getString("Email") ?? "" ;
    String phoneNumber = prefs.getString("Phone") ?? "" ;
    String password = prefs.getString("Password") ?? "" ;
    String countryCode = prefs.getString("CountryCode") ?? "" ;
    int packageId = prefs.getInt("PackageId") ?? 0 ;
    String activateDate = prefs.getString("ActivateDate") ?? "" ;
    String expireDate = prefs.getString("ExpireDate") ?? "" ;
    String countryId = prefs.getString("CountryId") ?? "" ;
    String stateId = prefs.getString("StateId") ?? "" ;
    String cityId = prefs.getString("CityId") ?? "" ;


 return   Recruiter(
      ein: ein,
      ssn: ssn,
      dob: dob,
      naice: naice,
      businessType: businessType,
      companyName: companyName,
      companyZipcode: companyZipcode,
      companyState: companyState,
      companyCity: companyCity,
      city: city,
      state: state,
      zipCode: zipCode,
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
      countryCode: countryCode,
      activateDate: activateDate,
      expireDate: expireDate,
      countryId: countryId,
      stateId: stateId,
      cityId: cityId,
    );

  }
  Future<Package> getPackage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String packageId = prefs.getString("packageID") ?? "";
    String packageName = prefs.getString("packageName") ?? "";
    String shortDescription = prefs.getString("shortDescription") ?? "";
    String adminFee = prefs.getString("adminFee") ?? "";

    return Package(
      id: packageId,
      packageName: packageName,
      shortDescription: shortDescription,
      adminFee: adminFee
    );

  }


  void removeController() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("Ein")  ;
    prefs.getString("Ssn");
     prefs.getString("Naice")  ;
  prefs.getString("DOB") ;
    prefs.getString("BusinessType") ;
    prefs.getString("CompanyName");
    prefs.getString("CompanyZipcode");
    prefs.getString("CompanyState") ;
  prefs.getString("CompanyCity") ;
    prefs.getString("City") ;
    prefs.getString("State")  ;
    prefs.getString("ZipCode");
   prefs.getString("Name") ;
  prefs.getString("Email")  ;
    prefs.getString("Phone")  ;
   prefs.getString("Password")  ;
     prefs.getString("CountryCode") ;
   prefs.getInt("PackageId") ;
    prefs.getString("ActivateDate") ;
   prefs.getString("ExpireDate");
    prefs.getString("CountryId") ;
   prefs.getString("StateId") ;
    prefs.getString("CityId");

  }

  void removePackage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("packageId");
    prefs.remove("packageName");
    prefs.remove("shortDescription");
    prefs.remove("adminFee");
  }

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
