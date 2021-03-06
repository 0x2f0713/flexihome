import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flexihome/models/Email.dart';
import 'package:flexihome/models/Password.dart';
import 'package:flexihome/repositories/AuthenticationRepository.dart';
import 'package:formz/formz.dart';

part 'signup_cubit.dart';

enum ConfirmPasswordValidationError { invalid }

class SignUpState extends Equatable {
  const SignUpState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    // this.confirmedPassword = const ConfirmedPassword.pure(),
    this.status = FormzStatus.pure,
  });

  final Email email;
  final Password password;
  // final ConfirmedPassword confirmedPassword;
  final FormzStatus status;

  @override
  List<Object> get props => [email, password, status];

  SignUpState copyWith({
    Email? email,
    Password? password,
    // ConfirmedPassword? confirmedPassword,
    FormzStatus? status,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      // confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      status: status ?? this.status,
    );
  }
}
