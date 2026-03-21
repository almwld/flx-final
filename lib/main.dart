import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'theme/app_theme.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/main_navigation.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/settings/change_password_screen.dart';
import 'screens/settings/blocked_users_screen.dart';
import 'screens/wallet/qr_payment_screen.dart';
import 'screens/wallet/currency_converter.dart';
import 'screens/categories/health_beauty_screen.dart';
import 'screens/categories/electronics_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await dotenv.load(fileName: ".env");
  
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flex Yemen',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/main': (context) => const MainNavigation(),
        '/settings': (context) => const SettingsScreen(),
        '/change_password': (context) => const ChangePasswordScreen(),
        '/blocked_users': (context) => const BlockedUsersScreen(),
        '/qr_payment': (context) => const QrPaymentScreen(),
        '/currency_converter': (context) => const CurrencyConverterScreen(),
        '/health_beauty': (context) => const HealthBeautyScreen(),
        '/electronics': (context) => const ElectronicsScreen(),
      },
    );
  }
}
