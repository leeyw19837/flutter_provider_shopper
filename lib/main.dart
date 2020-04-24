import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providershopper/common/theme.dart';
import 'package:providershopper/models/cart.dart';
import 'package:providershopper/models/catalog.dart';
import 'package:providershopper/screens/cart.dart';
import 'package:providershopper/screens/catalog.dart';
import 'package:providershopper/screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context)=>CatalogModal(),),
        ChangeNotifierProxyProvider<CatalogModal,CartModel>(
          create: (context)=>CartModel(),
          update: (context, catalog, cart){
            cart.catalog = catalog;
            return cart;
          },
        )
      ],
      child: MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => MyLogin(),
          '/catalog': (context) => MyCatalog(),
          '/cart': (context) => MyCart(),
        },
      ),
    );
  }
}

