import 'package:customer_laundry_app/core/common/styles/colors.dart';
import 'package:customer_laundry_app/core/common/theme/font.dart';
import 'package:customer_laundry_app/core/widgets/custom_text_field.dart';
import 'package:customer_laundry_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:customer_laundry_app/features/auth/presentation/pages/register_page.dart';
import 'package:customer_laundry_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              Container(
                alignment: Alignment.center,
                // color: Colors.amber,
                width: double.infinity,
                child: Container(
                  child: SvgPicture.asset(
                    'assets/images/img_login.svg',
                    // color: Colors.blue,
                    semanticsLabel: 'My SVG Picture',
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text(
                'Selamat Datang!',
                style: semiBoldText24,
              ),
              const SizedBox(height: 25),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return CustomTextField(
                    label: 'Email',
                    hintText: 'Masukkan email',
                    controller: context.read<AuthBloc>().emailLoginController,
                    textInputType: TextInputType.emailAddress,
                  );
                },
              ),
              const SizedBox(height: 16),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  final authBloc = context.read<AuthBloc>();
                  bool isPasswordHidden = state is PasswordVisibilityToggled
                      ? state.isPasswordHide
                      : authBloc.isPasswordHide;

                  return CustomTextField(
                    label: 'Kata Sandi',
                    hintText: 'Masukkan kata sandi',
                    controller: authBloc.passwordLoginController,
                    isPassword: true,
                    isPasswordHide: isPasswordHidden,
                    onPressedIconPassword: authBloc.onTogglePasswordVisibility,
                    // validator: validatorPassword,
                  );
                },
              ),
              const SizedBox(height: 25),
              InkWell(
                onTap: () {
                  // context.read<AuthBloc>().add(
                  //       LoginRequestedEvent(
                  //         email: context
                  //             .read<AuthBloc>()
                  //             .emailLoginController
                  //             .text,
                  //         password: context
                  //             .read<AuthBloc>()
                  //             .passwordLoginController
                  //             .text,
                  //       ),
                  //     );
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kColorScheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      }
                    },
                    builder: (context, state) {
                      return state is LoginLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              'Masuk',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
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
            Text(
              'Belum punya akun?',
              style: regularText12,
            ),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                );
              },
              child: Text(
                'Daftar',
                style: boldText12.copyWith(
                  color: Colors.lightBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
