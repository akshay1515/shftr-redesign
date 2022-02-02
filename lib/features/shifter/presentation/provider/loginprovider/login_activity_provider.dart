import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shifter/features/shifter/presentation/widgets/show-error-dialog.dart';

class LoginProvider with ChangeNotifier {
  String _cityname = '';

  String get cityname => _cityname;

  String _companycity = '';

  String get companycity => _companycity;

  String _userstate ='';

  String get userstate => _userstate;

  List<CountryModel> _countryList = [];

  List<CountryModel> _filteredCountryList = [];

  List<CountryModel> get countryList {
    if (_filteredCountryList.isEmpty) {
      _countryList.sort((object, object1) {
        var adata = object.cName;
        var bdata = object1.cName;
        return adata.compareTo(bdata);
      });
      return _countryList;
    } else {
      _filteredCountryList.sort((object, object1) {
        var adata = object.cName;
        var bdata = object1.cName;
        return adata.compareTo(bdata);
      });
      return _filteredCountryList;
    }
  }

  CountryModel? _selectedCountry;

  CountryModel? get selectedCountry {
    return _selectedCountry;
  }

  CountryModel getInitialTitle() {
    return _countryList.firstWhere((element) =>
        element.cCode == "+1" && element.cName == "United States of America");
  }

  Future sendOTPMobile() async{
    final String url = "https://demo.shifterteam.host/v1/getVerifyEmailMobileForOTP.php";
    try {

    }on TimeoutException {
      rethrow;
    } catch (e) {
      print(e.toString());
    }
  }


  Future<List<CountryModel>> getCountry() async {
    List<CountryModel> cModel = [];

    final String url = "https://restcountries.com/v2/all";

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 30));

      if (response.statusCode == 200) {
        List decoded = jsonDecode(response.body) as List;

        //print(decoded[0]);

        decoded.forEach((element) {
          if (element["callingCodes"].isNotEmpty) {
            cModel.add(CountryModel(
                cName: element['name'],
                cFlag: element['flags']['png'],
                cCode: "+${element['callingCodes'][0]}"));
          }
        });
        _countryList = cModel;
        //print(_countryList.length);

        if (_countryList.isNotEmpty) {
          _selectedCountry = getInitialTitle();
        }
        notifyListeners();
      }
    } on TimeoutException {
      rethrow;
    } catch (e) {
      print(e.toString());
    }
    return cModel;
  }

  CountryModel setCountry(CountryModel model) {
    _selectedCountry = model;
    notifyListeners();

    return model;
  }

  searchCountry(String search) {
    if (search.length > 2) {
      _filteredCountryList = _countryList
          .where((element) =>
              element.cName.toLowerCase().contains(search.toLowerCase()))
          .toList();
    } else {
      _filteredCountryList = _countryList;
    }
    notifyListeners();
  }

  Future getCityFromZip(String zipcode, BuildContext context) async {
    final String url =
        'https://maps.googleapis.com/maps/api/geocode/json?address=$zipcode&sensor=true&key=AIzaSyDM2ShuDIqQcqfmU_CpqfqnXDuUL1_lics';

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 30));

      if (response.statusCode == 200) {
        Navigator.of(context).pop();
        Map decoded = jsonDecode(response.body);
        if (decoded['results'].length > 0) {
          _cityname = decoded['results'][0]['formatted_address'];
          final _splitCity = _cityname.split(',');
          _cityname = _splitCity[0];
          final _stateMap = decoded['results'][0]['address_components'];
          for(int i = 0; i < _stateMap.length;i++){
          if(_stateMap[i]['types'].contains("administrative_area_level_1")){
            _userstate = decoded['results'][0]['address_components'][i]['long_name'];
          }
        }
        } else {
          showErrorMessage(
              context: context,
              title: "Error",
              body: 'This pincode doesn\'t exist',
              type: messageType.Error,
              buttonFunction: () {
                Navigator.of(context).pop();
              });
        }
      } else {}
      notifyListeners();
    } on TimeoutException {
      rethrow;
    } catch (error) {
      rethrow;
    }
  }

  Future<Map?> getNAICECategory() async {
    String url =
        'https://api.shifterteam.host/shifterfunctions/sillaMoney/get_new_naice.php';

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 30));

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body) as Map;

        return decodedData;
      }
      notifyListeners();
    } on TimeoutException {
      rethrow;
    } catch (error) {
      rethrow;
    }
  }
}

class CountryModel {
  final String cName;
  final String cFlag;
  final String cCode;

  CountryModel({required this.cName, required this.cFlag, required this.cCode});
}
