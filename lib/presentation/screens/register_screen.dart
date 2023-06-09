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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RergisterCubit>();

    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Nombre de usuario',
              onChanged: (value) {
                registerCubit.username(value);
                _formKey.currentState!.validate();
              },
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo requerido';
                if (value.trim().isEmpty) return 'Campo requerido';
                if (value.length <= 6) return 'Más de 6 letras';
                return null;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextFormField(
                label: 'Correo electrónico',
                onChanged: (value) {
                  registerCubit.email(value);
                  _formKey.currentState!.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Campo requerido';
                  if (value.trim().isEmpty) return 'Campo requerido';
                  if (!emailRegExp.hasMatch(value)) return 'No es un correo valido';
                  return null;
                }),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
                label: 'Contraseña',
                obscureText: true,
                onChanged: (value) {
                  registerCubit.password(value);
                  _formKey.currentState!.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Campo requerido';
                  if (value.trim().isEmpty) return 'Campo requerido';
                  if (value.length <= 6) return 'Más de 6 letras';
                  return null;
                }),
            const SizedBox(
              height: 20,
            ),
            FilledButton.tonalIcon(
              icon: const Icon(Icons.save),
              label: const Text('Crear usuario'),
              onPressed: () {
                // final valid = _formKey.currentState!.validate();
                // if (!valid) return;

                registerCubit.onSubmit();
              },
            ),
          ],
        ));
  }
}
