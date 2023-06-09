part of 'rergister_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterState extends Equatable {

  final FormStatus formStatus;
  final UserName username;
  final String email;
  final Password password;
  final bool isValid;

  const RegisterState({
    this.formStatus = FormStatus.invalid,
    this.username   = const UserName.pure(),
    this.email      = '',
    this.password   = const Password.pure(),
    this.isValid    = false
  });

  RegisterState copyWith({
    FormStatus? formStatus,
    UserName? username,
    bool? isValid,
    String? email,
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
