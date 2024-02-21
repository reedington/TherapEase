import 'package:therapease/utils/utils.dart';

// import 'model.dart';

class ApiRequest extends NetworkService {
  static final ApiRequest instance = ApiRequest._init();

  ApiRequest._init();

  Future<bool> validateEmail({required String email}) async {
    var path = 'validate_email/$email';
    var request = await postRequestHandler(path);
    await LocalStorage.instance.setEmail(email);
    return request.data['email_valid'];
  }
}
