import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/app_events.dart';
import 'package:ulearning/pages/sign_in/sign_in.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearning/pages/welcome/welcome.dart';

import 'app_blocs.dart';
import 'app_states.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WelcomeBloc(),
          ),
          BlocProvider(
            create: (context) => AppBlocs(),
          ),
        ],
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                elevation:  0.0,
                backgroundColor: Colors.white,
              ),
              primarySwatch: Colors.blue,
            ),
            home: const Welcome(),
            routes: {
              "myHomePage": (context) => MyHomePage(),
              "signin": (context) => SignIn(),
            },
          ),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Home Page"),
      ),
      body: Center(
        child: BlocBuilder<AppBlocs, AppStates>(builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                "${BlocProvider.of<AppBlocs>(context).state.counter}",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          );
        }),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: 'HeroTag1',
            onPressed: () =>
                BlocProvider.of<AppBlocs>(context).add(Increment()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: 'HeroTag2',
            onPressed: () =>
                BlocProvider.of<AppBlocs>(context).add(Decrement()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
