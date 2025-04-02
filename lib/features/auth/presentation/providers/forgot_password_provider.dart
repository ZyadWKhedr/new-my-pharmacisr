import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_my_pharmacist/features/auth/domain/use_cases/forgot_password_usecase.dart';
import 'package:new_my_pharmacist/features/auth/presentation/providers/auth_provider.dart';

// ForgotPasswordUseCase Provider
final forgotPasswordUseCaseProvider = Provider<ForgotPasswordUseCase>((ref) {
  final authRepository = ref.read(authServiceProvider).authRepository;
  return ForgotPasswordUseCase(authRepository);
});
