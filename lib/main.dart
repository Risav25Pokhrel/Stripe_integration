import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_integration/stripe_working/core.dart';
import '.env';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = publishablekey;
  await Stripe.instance.applySettings();
  runApp(const stripeApp());
}

class stripeApp extends StatelessWidget {
  const stripeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Stripe",
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: Color.fromARGB(255, 5, 29, 49),
            secondary: Colors.black26,
          ),
          primaryColor: Colors.white),
      home: const Core(),
    );
  }
}
