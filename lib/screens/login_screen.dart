import 'package:genshin_restaurant_app/data/dummy_data.dart';
import 'package:genshin_restaurant_app/screens/main_screen.dart';
import 'package:genshin_restaurant_app/state/auth_controller.dart';
import 'package:genshin_restaurant_app/widgets/login_brand_header.dart';
import 'package:genshin_restaurant_app/widgets/login_form_card.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
  static const String _bgImageUrl =
      'https://images.weserv.nl/?url=wallpapercave.com/wp/wp9660709.jpg';
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: DummyUser.email);
  final _passwordController = TextEditingController(text: DummyUser.password);
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    await Future.delayed(Duration(milliseconds: 600));

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (email == DummyUser.email && password == DummyUser.password) {
      await AuthController.instance.login();
      if (!mounted) return;
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => MainScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Wrong Email and/or Password. Try Again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            LoginScreen._bgImageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Container(color: const Color(0xFF1E1B2E)),
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.45),
                  Colors.black.withValues(alpha: 0.80),
                ],
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(24, 16, 24, 28),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  LoginBrandHeader(),
                  SizedBox(height: 36),
                  LoginFormCard(
                    formKey: _formKey,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    isLoading: _isLoading,
                    onSubmit: _login,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
