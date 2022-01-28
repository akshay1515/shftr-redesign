// To parse this JSON data, do
//
//     final recruiter = recruiterFromJson(jsonString?);

import 'dart:convert';

Recruiter recruiterFromJson(String str) => Recruiter.fromJson(json.decode(str));

String recruiterToJson(Recruiter data) => json.encode(data.toJson());

class Recruiter {
  Recruiter({
    this.id,
    this.displayId,
    this.fcmToken,
    this.ein,
    this.userHandle,
    this.userPrivateKey,
    this.businesType,
    this.companyName,
    this.companyTagline,
    this.companyDescription,
    this.companyLocation,
    this.companyFounded,
    this.companySize,
    this.companyLogo,
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
    // required this.countryInfo,
    // required this.stateInfo,
    // required this.cityInfo,
  });

  String? id;
  String? displayId;
  String? fcmToken;
  String? ein;
  String? userHandle;
  String? userPrivateKey;
  String? businesType;
  String? companyName;
  String? companyTagline;
  String? companyDescription;
  String? companyLocation;
  String? companyFounded;
  String? companySize;
  String? companyLogo;
  String? city;
  String? state;
  String? zipCode;
  String? name;
  String? designation;
  String? loginVia;
  String? email;
  String? phoneNumber;
  String? password;
  String? countryCode;
  String? profileImage;
  String? packageId;
  String? rateOne;
  String? rateTwo;
  String? rateThree;
  String? rateFour;
  String? rateFive;
  String? accountName;
  String? accountNumber;
  String? routingNumber;
  String? countryId;
  String? stateId;
  String? cityId;
  // CountryInfo countryInfo;
  // Info stateInfo;
  // Info cityInfo;

  factory Recruiter.fromJson(Map<String, dynamic> json) => Recruiter(
        id: json["id"],
        displayId: json["display_id"],
        fcmToken: json["fcm_token"],
        ein: json["ein"],
        userHandle: json["user_handle"],
        userPrivateKey: json["user_private_key"],
        businesType: json["busines_type"],
        companyName: json["company_name"],
        companyTagline: json["company_tagline"],
        companyDescription: json["company_description"],
        companyLocation: json["company_location"],
        companyFounded: json["company_founded"],
        companySize: json["company_size"],
        companyLogo: json["company_logo"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zip_code"],
        name: json["name"],
        designation: json["designation"],
        loginVia: json["login_via"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        password: json["password"],
        countryCode: json["country_code"],
        profileImage: json["profile_image"],
        packageId: json["package_id"],
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
        // countryInfo: CountryInfo.fromJson(json["country_info"]),
        // stateInfo: Info.fromJson(json["state_info"]),
        // cityInfo: Info.fromJson(json["city_info"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "display_id": displayId,
        "fcm_token": fcmToken,
        "ein": ein,
        "user_handle": userHandle,
        "user_private_key": userPrivateKey,
        "busines_type": businesType,
        "company_name": companyName,
        "company_tagline": companyTagline,
        "company_description": companyDescription,
        "company_location": companyLocation,
        "company_founded": companyFounded,
        "company_size": companySize,
        "company_logo": companyLogo,
        "city": city,
        "state": state,
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
        // "country_info": countryInfo.toJson(),
        // "state_info": stateInfo.toJson(),
        // "city_info": cityInfo.toJson(),
      };
}

class Info {
  Info({
    this.id,
    this.name,
    this.countryId,
    this.stateId,
    this.status,
    this.created,
  });

  String? id;
  String? name;
  String? countryId;
  String? stateId;
  String? status;
  String? created;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        id: json["id"],
        name: json["name"],
        countryId: json["country_id"],
        stateId: json["state_id"] == null ? null : json["state_id"],
        status: json["status"],
        created: json["created"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country_id": countryId,
        "state_id": stateId == null ? null : stateId,
        "status": status,
        "created": created,
      };
}

class CountryInfo {
  CountryInfo({
    this.id,
    this.sortname,
    this.name,
    this.phonecode,
    this.status,
    this.created,
    this.modified,
  });

  String? id;
  String? sortname;
  String? name;
  String? phonecode;
  String? status;
  String? created;
  String? modified;

  factory CountryInfo.fromJson(Map<String, dynamic> json) => CountryInfo(
        id: json["id"],
        sortname: json["sortname"],
        name: json["name"],
        phonecode: json["phonecode"],
        status: json["status"],
        created: json["created"],
        modified: json["modified"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sortname": sortname,
        "name": name,
        "phonecode": phonecode,
        "status": status,
        "created": created,
        "modified": modified,
      };
}
