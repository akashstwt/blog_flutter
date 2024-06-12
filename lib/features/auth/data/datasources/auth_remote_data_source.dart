import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signupWithEmailPasswoed({
    required String name,
    required String email,
    required String password,
  });
  Future<String> loginWithEmailPasswoed({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<String> loginWithEmailPasswoed({
    required String email,
    required String password,
  }) {
    // TODO: implement loginWithEmailPasswoed
    throw UnimplementedError();
  }

  @override
  Future<String> signupWithEmailPasswoed({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {
          'name': name,
        },
      );
      if (response.user == null) {
        throw '';
      }
      return response.user!.id;
    } catch (e) {}
  }
}
