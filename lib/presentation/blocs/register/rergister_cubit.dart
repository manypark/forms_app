import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'rergister_state.dart';

class RergisterCubit extends Cubit<RegisterState> {

  RergisterCubit() : super( const RegisterState() );

  void onSubmit() {
    
  }

  void username( String value ) {
    emit(
      state.copyWith(
        username: value,
      )
    );
  }
  void email( String value ) {
    emit(
      state.copyWith(
        email: value,
      )
    );
  }
  void password( String value ) {
    emit(
      state.copyWith(
        password: value,
      )
    );
  }
}
