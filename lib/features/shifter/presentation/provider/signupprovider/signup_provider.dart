import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shifter/features/shifter/presentation/models/recruiter/recruiter.dart';
import 'package:shifter/utils/preferences/recruiter_preferences.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class SignUpProvider with ChangeNotifier {
  Status _registeredInStatus = Status.NotRegistered;
  Status get registeredInStatus => _registeredInStatus;
  String urlRegister = "https://demo.shifterteam.host/v1/addRecruiter.php";
  String urlLogin = "https://demo.shifterteam.host/v1/getRecruiter.php";

  Status _loggedInStatus = Status.NotLoggedIn;
  Status get loggedInStatus => _loggedInStatus;


  Future<Map<String,dynamic>> login(String id) async{
    var result;
    final Map<String, dynamic> loginData = {
      "id": id,
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    Response response = await post(
     Uri.parse(urlLogin),
      body: json.encode(loginData),
      headers: {'Content-Type': 'application/json'},
    );

    if(response.statusCode == 200){
      final Map<String, dynamic> responseData = json.decode(response.body);
      var userData = responseData['recruiter'];

      Recruiter authRecruiter = Recruiter.fromJson(userData);

      Preferences().saveRecruiter(authRecruiter);

      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      result = {
        'status': true,
        'message': 'Successful',
        'user': authRecruiter
      };
    }else{
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  Future<dynamic> register(
      String? displayId,
      String? ein,
      String? ssn,
      String? fcmToken,
      String? naice,
      String? dob,
      String? businessType,
      String? companyName,
      String? companyZipcode,
      String? companyState,
      String? companyCity,
      String? city,
      String? state,
      String? zipCode,
      String? name,
      String? email,
      String? phoneNumber,
      String? password,
      String? countryCode,
      int? packageId,
      String? activateDate,
      String? expireDate,
      String? countryId,
      String? stateId,
      String? cityId) async {
    final Map<String, dynamic> registrationData = {
      "display_id": displayId,
      "fcm_token": fcmToken,
      "ein": ein,
      "ssn": ssn,
      "naice": naice,
      "dob": dob,
      "business_type": businessType,
      "company_name": companyName,
      "company_zipcode": companyZipcode,
      "company_city": companyCity,
      "company_state": companyState,
      "city": city,
      "state": state,
      "zip_code": zipCode,
      "name": name,
      "email": email,
      "phone_number": phoneNumber,
      "password": password,
      "country_code": countryCode,
      "package_id": packageId,
      "activate_date": activateDate,
      "expire_date": expireDate,
      "country_id": countryId,
      "state_id": stateId,
      "city_id": cityId,
    };

    _registeredInStatus = Status.Registering;
    notifyListeners();

    return await post(Uri.parse(urlRegister),
            body: json.encode(registrationData),
            headers: {'Content-Type': 'application/json'})
        .then(onValue)
        .catchError(onError);
  }

  static Future<FutureOr> onValue(Response response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      print(response.body);
      var userData = responseData['data'];

      Recruiter authRecruiter = Recruiter.fromJson(userData);

      Preferences().saveRecruiter(authRecruiter);
      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': authRecruiter
      };
    } else {
      print(response.body);
      result = {
        'status': false,
        'message': 'Registration failed',
        'data': responseData
      };
    }

    return result;
  }

  static onError(error) {
    print("the error is $error.detail");
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }


}
