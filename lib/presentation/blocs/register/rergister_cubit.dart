import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import 'package:forms_app/infrastructure/inputs/inputs.dart';
part 'rergister_state.dart';

class RergisterCubit extends Cubit<RegisterState> {

  RergisterCubit() : super( const RegisterState() );

  void onSubmit() {

    emit(
      state.copyWith(
        formStatus: FormStatus.validating,
        username  : UserName.dirty( state.username.value ),
        password  : Password.dirty( state.username.value ),
        email     : Email.dirty( state.email.value ),
        isValid   : Formz.validate([state.username, state.password]),
      )
    );

    print('name: ${state.username.value}');
    print('email: ${state.email.value}');
    print('pass: ${state.password.value}');
  }

  void username( String value ) {

    final userName = UserName.dirty(value);

    emit(
      state.copyWith(
        username: userName,
        isValid : Formz.validate([userName, state.password, state.email])
      )
    );
  }

  void email( String value ) {

    final email = Email.dirty(value);

    emit(
      state.copyWith(
        email   : email,
        isValid : Formz.validate([ email, state.password, state.username])
      )
    );
  }

  void password( String value ) {

    final password = Password.dirty(value);

    emit(
      state.copyWith(
        password: password,
        isValid : Formz.validate([password, state.username, state.email])
      )
    );
  }

}
