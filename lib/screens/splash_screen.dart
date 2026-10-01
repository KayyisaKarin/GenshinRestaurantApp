import 'package:flutter/material.dart';
import 'package:genshin_restaurant_app/screens/login_screen.dart';
import 'package:genshin_restaurant_app/screens/main_screen.dart';
import 'package:genshin_restaurant_app/state/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Wrapped with wsrv.nl proxy to bypass host protection
  static const String _bgImageUrl =
      'https://images.weserv.nl/?url=wallpapercave.com/wp/wp9498634.jpg';
      

  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    await AuthController.instance.loadPersistedSession();
    await Future.delayed(const Duration(milliseconds: 2200));

    if (!mounted) return;
    final isLoggedIn = AuthController.instance.value;

    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => isLoggedIn ? const MainScreen() : const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            _bgImageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color:  Color(0xFF1E1B2E),
            ),
          ),

          Container(
            color: Colors.black.withValues(alpha: 0.75),
          ),

          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.soup_kitchen,
                  size: 80,
                  color: Colors.amber,
                ),
                SizedBox(height: 16),
                Text(
                  'Genshin Restaurant',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 24),
                CircularProgressIndicator(color: Colors.amber),
              ],
            ),
          ),
        ],
      ),
    );
  }
}