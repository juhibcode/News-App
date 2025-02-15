import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/constants/palette.dart';
import 'package:news_app/core/service_locator.dart';
import 'package:news_app/features/show_news/presentation/news_cubit/news_cubit.dart';
import 'package:news_app/features/show_news/presentation/pages/home_page.dart';
import 'package:news_app/features/show_news/presentation/pages/news_view_page.dart';
import 'features/show_news/presentation/news_cubit/news_cubit.dart';
void main() {

  WidgetsFlutterBinding.ensureInitialized();
  setUpServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context){
            return NewsCubit();
          })
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'News App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            colorScheme: const ColorScheme.light().copyWith(
              secondary: Palette.deepBlue,
            ),
            fontFamily: 'Poppins',
          ),
          home: const HomePage(),
        ),
    );
  }
}

