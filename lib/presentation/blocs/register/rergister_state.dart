part of 'rergister_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterState extends Equatable {

  final FormStatus formStatus;
  final UserName username;
  final Email email;
  final Password password;
  final bool isValid;

  const RegisterState({
    this.formStatus = FormStatus.invalid,
    this.username   = const UserName.pure(),
    this.email      = const Email.pure(),
    this.password   = const Password.pure(),
    this.isValid    = false
  });

  RegisterState copyWith({
    FormStatus? formStatus,
    UserName? username,
    bool? isValid,
    Email? email,
    Password? password,
  }) => RegisterState(
    formStatus: formStatus?? this.formStatus,
    username  : username  ?? this.username,
    email     : email     ?? this.email,
    password  : password  ?? this.password ,
    isValid   : isValid   ?? this.isValid 
  );

  @override
  List<Object> get props => [ formStatus, username, email, password, isValid ];
}
