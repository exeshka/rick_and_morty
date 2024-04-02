import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/features/data/repositories/person_repository_impl.dart';
import 'package:rick_and_morty/features/domain/entities/person_entity.dart';
import 'package:rick_and_morty/features/presentation/bloc/bloc/person_bloc.dart';
import 'package:rick_and_morty/features/presentation/pages/home_screen.dart';
import 'package:rick_and_morty/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initializeContainer();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent));

    return BlocProvider(
      create: (context) => sl.get<PersonBloc>(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.dark(),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
