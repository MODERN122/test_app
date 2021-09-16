import 'package:test_app/models/profile.dart';
import 'package:test_app/services/api/i_rest_service.dart';
import 'package:test_app/services/api/network_service.dart';
import 'package:test_app/services/storage/storage.dart';

class UserRepository {
  final IRestService _restService = NetworkServiceFactory.getInstance();

  UserRepository();

  Future<Profile> getProfile() async {
    ApiResponse result = await _restService.getProfile();
    var profile = Profile.fromJson(result.result);
    return profile;
  }
}
