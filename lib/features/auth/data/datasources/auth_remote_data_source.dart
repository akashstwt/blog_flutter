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
  }) {
    // TODO: implement signupWithEmailPasswoed
    throw UnimplementedError();
  }
}
