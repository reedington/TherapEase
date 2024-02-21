import 'package:firebase_auth/firebase_auth.dart';
import 'package:therapease/utils/utils.dart';

// import 'model.dart';

class AuthRequest extends NetworkService {
  static final AuthRequest instance = AuthRequest._init();

  AuthRequest._init();

  Future<void> login({
    required String email,
    required String password,
  }) async {
    // var path = 'auth/login';

    // var request = await postRequestHandler(
    //   path,
    //   data: {
    //     "email": email,
    //     "password": password,
    //   },
    // );
    // return User.fromJson(request.data['data']);
    await Future.delayed(2.seconds);
  }

  Future<String?> googleLogin() async {
    await FirebaseAuth.instance.signOut();
    var user = await FirebaseAuth.instance.signInWithProvider(
      GoogleAuthProvider(),
    );
    return (user.credential?.accessToken);
  }

  Future<void> sendCodeToBE({required String id}) async {
    // var path = 'auth/login';

    // var request = await postRequestHandler(
    //   path,
    //   data: {
    //     "email": email,
    //     "password": password,
    //   },
    // );
    // return User.fromJson(request.data['data']);
    await Future.delayed(2.seconds);
  }
}
