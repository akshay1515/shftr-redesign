import 'dart:async';
import 'dart:convert' as convert;
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shifter/features/shifter/presentation/models/recruiter/recruiter.dart';


class RecruiterProvider with ChangeNotifier {
  Recruiter? _recruiter = new Recruiter();

  Recruiter? get recruiter => _recruiter;

  void setRecruiter(Recruiter? recruiter) {
    _recruiter = recruiter;
    notifyListeners();
  }
}



