import 'package:flutter/material.dart';
import 'package:flutter_noteapp/di/provider_setup.dart';
import 'package:flutter_noteapp/presentation/notes/notes_view.dart';
import 'package:flutter_noteapp/ui/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final providers = await getProviders();

  runApp(MultiProvider(
    providers: providers,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        backgroundColor: darkGray,
        canvasColor: darkGray,
        floatingActionButtonTheme: Theme.of(context)
            .floatingActionButtonTheme
            .copyWith(backgroundColor: lightBlue, foregroundColor: darkGray),
        appBarTheme:
            Theme.of(context).appBarTheme.copyWith(backgroundColor: darkGray),
      ),
      home: const NotesView(),
    );
  }
}
