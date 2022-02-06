// To parse this JSON data, do
//
//     final recruiter = recruiterFromJson(jsonString);

import 'dart:convert';

Recruiter recruiterFromJson(String str) => Recruiter.fromJson(json.decode(str));

String recruiterToJson(Recruiter data) => json.encode(data.toJson());

class Recruiter {
  Recruiter({
     this.id,
     this.displayId,
    this.ssn,
     this.fcmToken,
     this.ein,
    this.naice,
    this.dob,
     this.userHandle,
     this.userPrivateKey,
     this.businessType,
     this.companyName,
     this.companyTagline,
     this.companyDescription,
     this.companyZipcode,
     this.companyFounded,
     this.companySize,
     this.companyLogo,
    this.companyCity,
    this.companyState,
     this.city,
     this.state,
     this.zipCode,
     this.name,
     this.designation,
     this.loginVia,
     this.email,
     this.phoneNumber,
     this.password,
     this.countryCode,
     this.profileImage,
     this.packageId,
     this.activateDate,
     this.expireDate,
     this.rateOne,
     this.rateTwo,
     this.rateThree,
     this.rateFour,
     this.rateFive,
     this.accountName,
     this.accountNumber,
     this.routingNumber,
     this.countryId,
     this.stateId,
     this.cityId,
  });

  final String? id;
  final String? displayId;
  final String? fcmToken;
  final String? ein;
  final String? naice;
  final String? dob;
  final String? userHandle;
  final String? userPrivateKey;
  final String? businessType;
  final String? companyName;
  final String? companyTagline;
  final String? companyDescription;
  final String? companyCity;
  final String? companyFounded;
  final String? companySize;
  final String? companyLogo;
  final String? companyZipcode;
  final String? companyState;
  final String? city;
  final String? state;
  final String? zipCode;
  final String? ssn;
  final String? name;
  final String? designation;
  final String? loginVia;
  final String? email;
  final String? phoneNumber;
  final String? password;
  final String? countryCode;
  final String? profileImage;
  final String? packageId;
  final String? activateDate;
  final String? expireDate;
  final String? rateOne;
  final String? rateTwo;
  final String? rateThree;
  final String? rateFour;
  final String? rateFive;
  final String? accountName;
  final String? accountNumber;
  final String? routingNumber;
  final String? countryId;
  final String? stateId;
  final String? cityId;


  factory Recruiter.fromJson(Map<String, dynamic> json) => Recruiter(
    id: json["id"],
    displayId: json["display_id"],
    fcmToken: json["fcm_token"],
    ein: json["ein"],
    naice: json["naice"],
    dob: json["dob"],
    userHandle: json["user_handle"],
    userPrivateKey: json["user_private_key"],
    businessType: json["busines_type"],
    companyName: json["company_name"],
    companyTagline: json["company_tagline"],
    companyDescription: json["company_description"],
    companyZipcode: json["company_zipcode"],
    companyCity: json["company_city"],
    companyState: json["company_state"],
    companyFounded: json["company_founded"],
    companySize: json["company_size"],
    companyLogo: json["company_logo"],
    city: json["city"],
    state: json["state"],
    zipCode: json["zip_code"],
    name: json["name"],
    ssn: json["ssn"],
    designation: json["designation"],
    loginVia: json["login_via"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    password: json["password"],
    countryCode: json["country_code"],
    profileImage: json["profile_image"],
    packageId: json["package_id"],
    activateDate: json["activate_date"],
    expireDate: json["expire_date"],
    rateOne: json["rate_one"],
    rateTwo: json["rate_two"],
    rateThree: json["rate_three"],
    rateFour: json["rate_four"],
    rateFive: json["rate_five"],
    accountName: json["account_name"],
    accountNumber: json["account_number"],
    routingNumber: json["routing_number"],
    countryId: json["country_id"],
    stateId: json["state_id"],
    cityId: json["city_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "display_id": displayId,
    "fcm_token": fcmToken,
    "ein": ein,
    "naice":naice,
    "dob": dob,
    "user_handle": userHandle,
    "user_private_key": userPrivateKey,
    "busines_type": businessType,
    "company_name": companyName,
    "company_tagline": companyTagline,
    "company_description": companyDescription,
    "company_zipcode": companyZipcode,
    "company_city": companyCity,
    "companyState": companyState,
    "company_founded": companyFounded,
    "company_size": companySize,
    "company_logo": companyLogo,
    "city": city,
    "state": state,
    "ssn":ssn,
    "zip_code": zipCode,
    "name": name,
    "designation": designation,
    "login_via": loginVia,
    "email": email,
    "phone_number": phoneNumber,
    "password": password,
    "country_code": countryCode,
    "profile_image": profileImage,
    "package_id": packageId,
    "activate_date": activateDate,
    "expire_date": expireDate,
    "rate_one": rateOne,
    "rate_two": rateTwo,
    "rate_three": rateThree,
    "rate_four": rateFour,
    "rate_five": rateFive,
    "account_name": accountName,
    "account_number": accountNumber,
    "routing_number": routingNumber,
    "country_id": countryId,
    "state_id": stateId,
    "city_id": cityId,
  };
}
