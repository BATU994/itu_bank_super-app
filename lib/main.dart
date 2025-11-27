import 'package:bank_application/src/features/auth/presentation/pages/register/number_insert.dart';
import 'package:bank_application/src/features/card_func/data/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/features/home/home_screen.dart';
import 'src/features/transfers/transfers_screen.dart';
import 'src/features/cards/cards_screen.dart';
import 'src/features/payments/payments_screen.dart';
import 'src/features/profile/profile_screen.dart';
import 'l10n/app_localizations.dart';
import 'src/core/providers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<TransactionModel>('transactions');

  runApp(const ProviderScope(child: BankDemoApp()));
}

class BankDemoApp extends ConsumerWidget {
  const BankDemoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeCode = ref.watch(localeProvider);
    final textTheme = GoogleFonts.interTextTheme(ThemeData.light().textTheme);
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.cyan,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.cyan,
      ),
      themeMode: ThemeMode.system,
      locale: Locale(localeCode),
      supportedLocales: const [Locale('en'), Locale('ru'), Locale('kk')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: MainNavShell(),
    );
  }
}

class SplashScreenChooser extends StatefulWidget {
  const SplashScreenChooser({super.key});
  @override
  State<SplashScreenChooser> createState() => _SplashScreenChooserState();
}

class _SplashScreenChooserState extends State<SplashScreenChooser> {
  Future<bool> _init() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('loggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _init(),
      builder: (context, snap) {
        if (!snap.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snap.data!) {
          return const MainNavShell();
        } else {
          return const MainNavShell();
        }
      },
    );
  }
}

class MainNavShell extends StatefulWidget {
  const MainNavShell({super.key});
  @override
  State<MainNavShell> createState() => _MainNavShellState();
}

class _MainNavShellState extends State<MainNavShell> {
  int _selected = 0;
  final _pages = const [
    HomeScreen(),
    TransfersScreen(),
    CardsScreen(),
    PaymentsScreen(),
    ProfileScreen(),
    InvestingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: IndexedStack(index: _selected, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selected,
        onTap: (i) => setState(() => _selected = i),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: l10n.account,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.transform),
            label: l10n.transfers,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.credit_card),
            label: l10n.cards,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.payment),
            label: l10n.payments,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: l10n.profile,
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.monetization_on_outlined),
            label: l10n.investing,
          ),
        ],
      ),
    );
  }
}
