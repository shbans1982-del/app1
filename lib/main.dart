import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Wanso/Settings/theme.dart';
import 'package:Wanso/AdvancedPage.dart';
import 'package:Wanso/BeginnerPage.dart';
import 'package:Wanso/IntermediatePage.dart';
import 'package:Wanso/Settings/SettingsPage.dart';
import 'package:Wanso/Settings/OnboardingScreen.dart'; // <-- import onboarding

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;
  String selectedLanguage = "English";
  bool showOnboarding = false; // <-- flag for first-run

  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
  }

  Future<void> _checkFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    final seen = prefs.getBool('hasSeenWalkthrough') ?? false;
    setState(() {
      showOnboarding = !seen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: selectedLanguage == "English"
          ? "Your Learning Journey"
          : "Votre Voyage d'Apprentissage",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: Ntheme.lightTheme,
      darkTheme: Ntheme.darkTheme,
      initialRoute:
          showOnboarding ? '/onboarding' : '/home', // <-- dynamic start
      routes: {
        '/onboarding': (context) => OnboardingScreen(onFinish: () {
              // mark walkthrough seen and go home
              SharedPreferences.getInstance().then(
                (prefs) => prefs.setBool('hasSeenWalkthrough', true),
              );
              Navigator.pushReplacementNamed(context, '/home');
            }),
        '/home': (context) => const HomePage(),
        '/beginner': (context) => const BeginnerPage(),
        '/advanced': (context) => const AdvancedPage(),
        '/intermediate': (context) => const IntermediatePage(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _logoTapCount = 0;

  void _handleLogoTap() {
    _logoTapCount++;
    if (_logoTapCount >= 5) {
      _logoTapCount = 0;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Easter Egg Found!"),
            content: const Text(
                "🎉 Congratulations! You've discovered a hidden feature in our app!, Find the other hidden features"),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Awesome")),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> levels = [
      'Beginner',
      'Intermediate Level',
      'Advanced Level'
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
        leading: GestureDetector(
          onTap: _handleLogoTap,
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Image.asset('assets/images/logo.png', height: 60),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepPurpleAccent, Colors.purpleAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header Section
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Welcome to Your Learning Journey (Wiy i dze laam)",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Explore exciting topics and start building your knowledge!",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                              image: AssetImage(
                                  'assets/images/banner_education2.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                ),
                // Level Selection Area
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView.builder(
                        itemCount: levels.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 60),
                              elevation: 5,
                              backgroundColor: Colors.blue[100]!,
                              shadowColor: Colors.grey.withOpacity(0.5),
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () {
                              if (index == 0) {
                                Navigator.pushNamed(context, '/beginner');
                              } else if (index == 1) {
                                Navigator.pushNamed(context, '/intermediate');
                              } else if (index == 2) {
                                Navigator.pushNamed(context, '/advanced');
                              }
                            },
                            child: Text(levels[index],
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
