import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_task/core/theme/app_colors.dart';
import 'package:market_app_task/features/auth/presentation/cubit/auth_cubit.dart';

import '../../../../core/di/injection_container.dart';
import '../../../products/presentation/pages/products_page.dart';
import '../widgets/custom_form_field.dart';

class SignInPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  SignInPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(sl()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SizedBox(height: constraints.maxHeight * 0.1),
                    Image.network(
                      "https://ik.imagekit.io/djfpoxcvl/products/646b7926147be/64a3f18763600generalimage.jpeg?ik-sdk-version=react-1.1.1",
                      height: 100,
                    ),
                    SizedBox(height: constraints.maxHeight * 0.1),
                    Text(
                      "Sign In",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.05),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomFormField(
                            controller: _emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                            },
                            hintText: 'Email',
                            isPassword: false,
                          ),
                          const SizedBox(height: 16.0),
                          CustomFormField(
                            controller: _passwordController,

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                            },
                            hintText: 'Password',
                            isPassword: true,
                          ),
                          const SizedBox(height: 16.0),
                          BlocListener<AuthCubit, AuthState>(
                            listener: (context, state) {
                              if (state is LoginSuccess) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const ProductsPage()));
                              }
                            },
                            child: BlocBuilder<AuthCubit, AuthState>(
                              builder: (context, state) {

                                var cubit = context.read<AuthCubit>();
                                return state is LoginLoading ?  const CircularProgressIndicator(color:  AppColors.primaryColor,) : ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      cubit.signIn(_emailController.text, _passwordController.text);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: const Color(0xFF00BF6D),
                                    foregroundColor: Colors.white,
                                    minimumSize:
                                        const Size(double.infinity, 48),
                                    shape: const StadiumBorder(),
                                  ),
                                  child: const Text("Sign in"),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color!
                                        .withOpacity(0.64),
                                  ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text.rich(
                              const TextSpan(
                                text: "Don’t have an account? ",
                                children: [
                                  TextSpan(
                                    text: "Sign Up",
                                    style: TextStyle(color: Color(0xFF00BF6D)),
                                  ),
                                ],
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color!
                                        .withOpacity(0.64),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
