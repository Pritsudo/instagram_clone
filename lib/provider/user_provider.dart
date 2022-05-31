import 'package:flutter/cupertino.dart';
import 'package:instagram_flutter/resources/auth_methods.dart';
import '../model/user.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethod _authMethod = AuthMethod();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _authMethod.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
