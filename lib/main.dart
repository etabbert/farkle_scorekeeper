import 'package:farkle_scorekeeper/custom_theme.dart';
import 'package:farkle_scorekeeper/presentation/main_view.dart';
import 'package:farkle_scorekeeper/services/page_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((value) => runApp(const RegisterServices()));
}

class RegisterServices extends StatelessWidget {
  const RegisterServices({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ListenableProvider<PageController>(
        create: (_) => PageController(),
        dispose: (_, pageController) => pageController.dispose(),
      ),
      ChangeNotifierProxyProvider<PageController, PageService>(
        create: (context) => PageService(
          pageController: Provider.of<PageController>(context, listen: false),
        ),
        update: (_, pageController, previousService) =>
            previousService ?? PageService(pageController: pageController),
      ),
    ], child: const MainApp());
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farkle Scorekeeper',
      theme: CustomTheme.themeData,
      home: const Scaffold(body: MainView()),
    );
  }
}
