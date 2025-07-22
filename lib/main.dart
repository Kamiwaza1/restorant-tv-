import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Android TV için yatay mod zorla
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  
  // Sistem UI'sini gizle (tam ekran)
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  
  // Sistem UI modunu gizle
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  
  runApp(const RestaurantTVApp());
}

class RestaurantTVApp extends StatelessWidget {
  const RestaurantTVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant TV',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
        // TV için büyük fontlar
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(fontSize: 24),
          bodyMedium: TextStyle(fontSize: 20),
        ),
      ),
      home: const TVHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TVHomePage extends StatefulWidget {
  const TVHomePage({super.key});

  @override
  State<TVHomePage> createState() => _TVHomePageState();
}

class _TVHomePageState extends State<TVHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1a1a1a),
              Color(0xFF000000),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'RESTORAN TV',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.orange,
                        letterSpacing: 2,
                      ),
                    ),
                    Text(
                      DateTime.now().toString().substring(0, 16),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Ana İçerik
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.restaurant,
                        size: 120,
                        color: Colors.orange,
                      ),
                      const SizedBox(height: 40),
                      Text(
                        'Hoş Geldiniz',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Restoran TV Uygulaması',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 60),
                      
                      // TV için navigation ipucu
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.tv,
                              color: Colors.orange,
                              size: 32,
                            ),
                            const SizedBox(width: 16),
                            Text(
                              'Android TV için optimize edilmiştir',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Footer
              Container(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'Uzaktan kumanda ile navigasyon yapabilirsiniz',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white54,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
