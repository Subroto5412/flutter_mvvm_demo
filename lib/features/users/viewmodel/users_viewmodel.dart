import 'package:flutter/foundation.dart';

import '../../../data/models/user.dart';
import '../../../data/repositories/user_repository.dart';

class UsersViewModel extends ChangeNotifier {
  final UserRepository _repository;

  UsersViewModel(this._repository);

  List<User> _users = [];

  bool _isLoading = false;

  String? _errorMessage;

  List<User> get users => List.unmodifiable(_users);

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  Future<void> loadUsers() async {
    if (_isLoading) return;

    _isLoading = true;
    _errorMessage = null;

    notifyListeners();

    try {
      _users = await _repository.getUsers();
    } catch (error) {
      _errorMessage = 'Users load করা যায়নি। আবার চেষ্টা করো।';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}