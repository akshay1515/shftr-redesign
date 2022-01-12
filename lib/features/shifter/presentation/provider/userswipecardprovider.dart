import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum Jobstatus { accepted, rejected, saved }

class UserSwipeCardProvider with ChangeNotifier {
  List<String> _urlImages = [];

  List<String> get urlImages => _urlImages;

  Offset _position = Offset.zero;
  bool _isMoving = false;
  double _angle = 0;
  Size _screenSize = Size.zero;

  bool get isMoving => _isMoving;

  double get angle => _angle;

  Size get screenSize => _screenSize;

  Offset get position => _position;

  UserSwipeCardProvider() {
    resetJobs();
  }

  void startPosition(DragStartDetails details) {
    _isMoving = true;
    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;
    final x = _position.dx;
    _angle = 45 * x / _screenSize.width;
    notifyListeners();
  }

  void endPosition() {
    _isMoving = false;
    notifyListeners();

    final status = getStatus(flag: true);

    if (status != null) {
      if (status == Jobstatus.accepted) {
        Fluttertoast.showToast(msg: "You accepted this job");
      } else if (status == Jobstatus.rejected) {
        Fluttertoast.showToast(msg: "You rejected this job");
      } else {
        Fluttertoast.showToast(msg: "You saved this job");
      }
    }

    switch (status) {
      case Jobstatus.accepted:
        accepted();
        break;
      case Jobstatus.rejected:
        rejected();
        break;
      case Jobstatus.saved:
        saved();
        break;
      default:
        resetPosition();
    }
    resetPosition();
  }

  void resetPosition() {
    _isMoving = false;
    _position = Offset.zero;
    _angle = 0;

    notifyListeners();
  }

  void accepted() {
    _angle = 20;
    _position += Offset(2 * _screenSize.width, 0);
    _nextJob();

    notifyListeners();
  }

  void rejected() {
    _angle = -20;
    _position -= Offset(2 * _screenSize.width, 0);
    _nextJob();

    notifyListeners();
  }

  void saved() {
    _angle = 0;
    _position -= Offset(0, _screenSize.height);
    _nextJob();

    notifyListeners();
  }

  Future _nextJob() async {
    if (_urlImages.isEmpty) return;

    await Future.delayed(Duration(milliseconds: 200));
    _urlImages.removeLast();
    resetPosition();
  }

  void setScreenSize(Size size) {
    _screenSize = size;
  }

  Jobstatus? getStatus({bool flag = false}) {
    final x = _position.dx;
    final y = _position.dy;
    final forcesaved = x.abs() < 20;
    if (flag) {
      final delta = 100;

      if (x >= delta) {
        return Jobstatus.accepted;
      } else if (x <= -delta) {
        return Jobstatus.rejected;
      } else if (y <= -delta / 2 && forcesaved) {
        return Jobstatus.saved;
      }
    } else {
      final delta = 20;

      if (y <= -delta * 2 && forcesaved) {
        return Jobstatus.saved;
      } else if (x >= delta) {
        return Jobstatus.accepted;
      } else if (x <= -delta) {
        return Jobstatus.rejected;
      }
    }
  }

  double getStatusOpacity() {
    final delta = 100;
    final pos = max(_position.dx.abs(), _position.dy.abs());
    final opacity = pos/delta;

    return min(opacity,1);
  }

  void resetJobs() {
    _urlImages = [
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
      'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
      'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
      'https://images.unsplash.com/photo-1491349174775-aaafddd81942?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
    ].reversed.toList();
    notifyListeners();
  }
}
