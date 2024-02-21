import 'package:therapease/utils/utils.dart';

import 'model.dart';

class UsersRequest extends NetworkService {
  static final UsersRequest instance = UsersRequest._init();

  UsersRequest._init();

  Future<String?> createUser({
    required CreateUser user,
  }) async {
    var path = 'users';

    user.email = LocalStorage.instance.getEmail();
    // 
    user.password = '123aawwss@32';
    Map<String, dynamic> data = user.toJson();
     await postRequestHandler(
      path,
      data: data,
    );
    return null;
  }
}
