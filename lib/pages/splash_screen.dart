import 'package:flutter/material.dart';
import 'package:news_appgetx/main.dart';
import 'package:news_appgetx/pages/home_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  static const Duration splashDuration = Duration(seconds: 3);

  Future<void> _Next() async {
    await Future<void>.delayed(splashDuration);
    // Mounted itu adalah kondisi dimmana widget masih berada di dalam widget tree ,
    // atau dengan kata lain widegt
    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (context) => HomePageScreen()),
    );
  }

  // IniState itu adalah sesuatu yang pertama kali dijalankan
  // ketika page dibuka atau diakses. Dan cuma dijalankan sekali saja.

  @override
  void initState() {
    super.initState();
    _Next();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainApp.beige.withValues(alpha: 0.1),
      // safeArea itu dipake kalau misalnya di page nya gapake app bar
      // jadi biar UI nya ga keganggu sama status bar, navigator bar, ata notch di hp
      body: SafeArea(
        child: Center(
          // ClipRect itu untuk ngasih border radius ke image,
          // jadi gambarnya bisa jadi bulat atau rounded gitu
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              'assets/images/logo.png',
              width: 160,
              height: 160,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    color: MainApp.beige.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Icon(
                    Icons.newspaper_rounded,
                    size: 65,
                    color: MainApp.beige,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
