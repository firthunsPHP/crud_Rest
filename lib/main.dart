import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validacion_app/screens/screens.dart';

import 'services/products_service.dart';

// mateApp + tabul
void main() => runApp(AppState());
/***  La clase AppState estará en un primer niuvel a la hora de ejecución del mismo
 * detectando cualquier cambio introducido o no por el usuario*/
class AppState extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
            ChangeNotifierProvider(create: ( _ ) => ProductsService())
        ],
    child: MyApp() ,
    );// MultiProvider
  }
}




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Products App',
      initialRoute:  'login',
      routes:{
        'login': (_) => LoginScreen(),
        'home': (_) => HomeScreen(),
        'product': (_) => ProductScreeen(),
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme:  AppBarTheme(
          elevation: 0,
          color: Colors.indigo
        ),
        floatingActionButtonTheme:  FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
          elevation: 0
        )
      ),

    );
  }
}
