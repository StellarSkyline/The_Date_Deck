class LoginState{
  final bool isLoading;

  LoginState({
    this.isLoading = false,
  });

  LoginState copyWith({
    bool? isLoading,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}