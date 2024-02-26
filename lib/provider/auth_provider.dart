import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walletapp/provider/repository/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthState extends Equatable {
  final User? user;
  final bool isLoading;
  final String? errorMessage;

  const AuthState({this.user, this.isLoading = false, this.errorMessage});

  bool get isAuthenticated => user != null;

  AuthState copyWith({
    User? user,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [user, isLoading, errorMessage];
  factory AuthState.initial() => const AuthState(isLoading: false);
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  final FirebaseAuthRepo authRepo;
  AuthStateNotifier(this.authRepo) : super(AuthState.initial());

  Future<void> loginUser(String email, String password) async {
    state = state.copyWith(isLoading: true);
    try {
      final userCredential =
          await authRepo.loginUserWithFirebase(email, password);
      state = state.copyWith(isLoading: false, user: userCredential.user);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      rethrow;
    }
  }

  Future<void> signOut() async {
    authRepo.signOutUser();
    state = AuthState.initial();
  }

  Future<void> signUp(String name, String email, String password) async {
    state = state.copyWith(isLoading: true);
    try {
      final userCredential =
          await authRepo.signupUserWithFirebase(name, email, password);
      state = state.copyWith(isLoading: false, user: userCredential.user);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      rethrow;
    }
  }

  Future<void> loginWithGoogle() async {
    state = state.copyWith(isLoading: true);
    try {
      final userCredential = await authRepo.loginWithGoogle();
      state = state.copyWith(isLoading: false, user: userCredential.user);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      rethrow;
    }
  }
}

final authProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier(FirebaseAuthRepo());
});
