import '../models/user.dart';
import '../services/user_api_service.dart';

class UserRepository {
  final UserApiService _apiService;

  UserRepository(this._apiService);

  Future<List<User>> getUsers() {
    return _apiService.fetchUsers();
  }
}