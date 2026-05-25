import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/services/auth_service.dart';
import 'register_screen.dart';
import '../home/main_navigation_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool obscurePassword = true;

  Future<void> login() async {

    if (!formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {

      final response = await AuthService().login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      debugPrint(response.toString());

      /// SAVE TOKEN
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString(
        'token',
        response['token'],
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Success'),
        ),
      );

      /// NAVIGATE TO HOME
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const MainNavigationScreen(),
        ),
      );

    } on DioException catch (e) {

      debugPrint(e.toString());

      String message = 'Login Failed';

      if (e.response != null) {

        message = e.response?.data['message']
            ?? 'Server Error';

      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );

    } catch (e) {

      debugPrint(e.toString());

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );

    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }

  }

  @override
  void dispose() {

    emailController.dispose();
    passwordController.dispose();

    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Vowly Login'),
        centerTitle: true,
      ),

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(20),

          child: Form(

            key: formKey,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [

                const SizedBox(height: 40),

                const Icon(
                  Icons.favorite,
                  size: 80,
                ),

                const SizedBox(height: 20),

                const Text(
                  'Welcome to Vowly',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Find your perfect wedding vendor',
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 40),

                /// EMAIL
                TextFormField(
                  controller: emailController,

                  keyboardType: TextInputType.emailAddress,

                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),

                  validator: (value) {

                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }

                    return null;

                  },
                ),

                const SizedBox(height: 20),

                /// PASSWORD
                TextFormField(
                  controller: passwordController,

                  obscureText: obscurePassword,

                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),

                    prefixIcon: const Icon(Icons.lock),

                    suffixIcon: IconButton(

                      onPressed: () {

                        setState(() {
                          obscurePassword = !obscurePassword;
                        });

                      },

                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),

                  validator: (value) {

                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }

                    if (value.length < 6) {
                      return 'Minimum 6 characters';
                    }

                    return null;

                  },
                ),

                const SizedBox(height: 30),

                /// BUTTON
                SizedBox(

                  height: 55,

                  child: ElevatedButton(

                    onPressed: isLoading
                        ? null
                        : login,

                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                  ),
                ),

                const SizedBox(height: 20),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Don\'t have an account? Register',
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}