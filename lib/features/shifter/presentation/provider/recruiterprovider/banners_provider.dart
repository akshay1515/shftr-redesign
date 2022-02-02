
import 'package:flutter/material.dart';
import 'package:shifter/features/shifter/presentation/models/recruiter/banners.dart';

class BannersProvider with ChangeNotifier{
  List<Banners> _bannersList = [];

  List<Banners> getPostList() {
    return _bannersList;
  }

}