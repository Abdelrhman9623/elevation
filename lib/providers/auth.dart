import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// my ex message
import '../models/http_ex.dart';
 
class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  Timer _authTimer;

  bool get isAuth {
    return token != null; 
  }

  String get token {
    if(_expiryDate != null && 
       _expiryDate.isAfter(DateTime.now()) &&  
       _token != null ) {
      return _token;
    }
    return null;
  } 
  // TO GET USERSID FOR MAKE AUTH IN PRODUCTS ANG ORDERS
  String get userId {
    return _userId;
  }
  // THIS IS LOGIC OF SIGNIN & SIGNUP
  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final baseUrl = 'https://mamchs.digital-mafia.com/api/v1/$urlSegment';
    try {
      final response = await http.post(
        baseUrl,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      ); // TO HANDLE ERRORS
        final responseData = json.decode(response.body);
        if (responseData['error'] != null) {
          throw HttpException(responseData['error']['message']);
        }
        
        _token = responseData['idToken'];
        _userId = responseData['localId'];
        _expiryDate = DateTime.now().add(
          Duration(
            seconds: int.parse(responseData['expiresIn'])
          ));
          // ACTIVET AUTO LOGOUT 
          _autoLogout();
        notifyListeners();
        // to keep user login 
        final prefs = await SharedPreferences.getInstance();
        final userData = json.encode({
          'token': _token,
          'userId': _userId,
          'expiryDate': _expiryDate.toIso8601String(),
        });
        prefs.setString('userData', userData);
      } catch (error) {
        throw error;
        // print(url);
      }
    }
  // SET SIGNUP 
  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'register');
  }
  // SET LOGIN
  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'login');
  }
  //  TO KEEP USERS LOGIN
  Future<bool> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('userData')) {
 	     return false;
    }
    final exUserData = json.decode(prefs.getString('userData')) as Map<String, Object>;
    final exDate = DateTime.parse(exUserData['expiryDate']);
    if (exDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = exUserData['token'];
    _userId = exUserData['userId'];
    _expiryDate = exDate;
    notifyListeners();
    _autoLogout();
    return true;
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer.cancel();
      _authTimer = null;
    }
    notifyListeners();
    // TO CLEAR DATA OF USERS THEY LOGIN
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
  // TO SET AUTO LOGOUT
  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer.cancel();
    }
    final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }

void showIfo(BuildContext ctx) {
  final deviceSize = MediaQuery.of(ctx).size;
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.0),
          topRight: Radius.circular(35.0)
        ),
      ),
      backgroundColor: Theme.of(ctx).accentColor,
      context: ctx,
      builder: (ctx) => Container(
        padding: EdgeInsets.all(30),
        height: deviceSize.height + 300,
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          child: Text('hello !!'),
        ),
      )
    );
  }
}