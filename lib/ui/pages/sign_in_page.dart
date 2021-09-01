import 'package:flutter/material.dart';
import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/custom_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30, left: defaultMargin),
        child: Text(
          'Sign In with your\nexisting account',
          style: titleTextStyle,
        ),
      );
    }

    Widget signUpBtn() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/sign-up');
        },
        child: Container(
          margin: EdgeInsets.only(top: 50, bottom: 70),
          alignment: Alignment.center,
          child: Text(
            'Don\'t have an account? Sign Up',
            style: subTitleTextStyle.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget inputEmail() {
        return CustomTextFormField(
          title: 'Email Address',
          hintText: 'fahmih@gmail.com',
          controller: emailController,
        );
      }

      Widget inputPassword() {
        return CustomTextFormField(
          title: 'Password',
          hintText: '*****',
          obscureText: true,
          controller: passwordController,
        );
      }

      Widget submitBtn() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/main', (route) => false);
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return CustomBtn(
              title: 'Sign In',
              onPressed: () {
                context.read<AuthCubit>().signIn(
                      email: emailController.text,
                      password: passwordController.text,
                    );
              },
            );
          },
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 30, left: 24, right: 24),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        width: 327,
        // height: 533,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          color: whiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            inputEmail(),
            inputPassword(),
            submitBtn(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: ListView(
          children: [
            title(),
            inputSection(),
            signUpBtn(),
          ],
        ),
      ),
    );
  }
}
