import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/rergister_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: BlocProvider(
        create: (context) => RergisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              FlutterLogo(
                size: 100,
              ),
              SizedBox(
                height: 30,
              ),
              _RegisterForm(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {

  const _RegisterForm();

  @override
  Widget build(BuildContext context) {

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    final registerCubit = context.watch<RergisterCubit>();

    final userName = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    return Form(
        child: Column(
          children: [

            //Input Nombre
            CustomTextFormField(
              label       : 'Nombre de usuario',
              onChanged   : registerCubit.username,
              errorMessage: userName.errorMessage,
            ),

            const SizedBox(height: 30,),

            //Input correo
            CustomTextFormField(
                label       : 'Correo electrónico',
                onChanged   : registerCubit.email,
                errorMessage: email.errorMessage,
            ),

            const SizedBox(height: 30, ),

            //Input contraseña
            CustomTextFormField(
              label       : 'Contraseña',
              obscureText : true,
              onChanged   : registerCubit.password,
              errorMessage: password.errorMessage,
            ),

            const SizedBox(height: 30,),

            FilledButton.tonalIcon(
              icon: const Icon(Icons.save),
              label: const Text('Crear usuario'),
              onPressed: () {
                registerCubit.onSubmit();
              },
            ),
          ],
        ));
  }
}
