import 'package:customer_laundry_app/core/common/styles/colors.dart';
import 'package:customer_laundry_app/core/common/theme/font.dart';
import 'package:customer_laundry_app/core/widgets/custom_text_field.dart';
import 'package:customer_laundry_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:customer_laundry_app/features/auth/presentation/pages/login_page.dart';
import 'package:customer_laundry_app/features/bottom_nav_bar/pages/bottom_nav_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        reverse: true,
        padding: const EdgeInsets.all(20.0),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const BottomNavBarPage()),
              );
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              Text(
                'Daftar',
                style: semiBoldText36.copyWith(
                  color: kColorScheme.primary,
                ),
              ),
              const SizedBox(height: 25),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return CustomTextField(
                    label: 'Nama',
                    hintText: 'Masukkan nama',
                    controller: context.read<AuthBloc>().nameController,
                  );
                },
              ),
              const SizedBox(height: 16),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return CustomTextField(
                    label: 'Email',
                    hintText: 'Masukkan email',
                    controller: context.read<AuthBloc>().emailController,
                    textInputType: TextInputType.emailAddress,
                  );
                },
              ),
              const SizedBox(height: 16),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return CustomTextField(
                    label: 'Kata Sandi',
                    hintText: 'Masukkan kata sandi',
                    controller: context.read<AuthBloc>().passwordController,
                    isPassword: true,
                  );
                },
              ),
              const SizedBox(height: 16),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return CustomTextField(
                    label: 'Konfirmasi Kata Sandi',
                    hintText: 'Masukkan ulang kata sandi',
                    controller:
                        context.read<AuthBloc>().confirmPasswordController,
                    isPassword: true,
                  );
                },
              ),
              const SizedBox(height: 25),
              InkWell(
                onTap: () {
                  context.read<AuthBloc>().add(
                        RegisterRequestedEvent(
                          username:
                              context.read<AuthBloc>().nameController.text,
                          email: context.read<AuthBloc>().emailController.text,
                          password:
                              context.read<AuthBloc>().passwordController.text,
                        ),
                      );
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return state is RegisterLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              'Daftar',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 33),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sudah punya akun?',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text(
                'Masuk',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
