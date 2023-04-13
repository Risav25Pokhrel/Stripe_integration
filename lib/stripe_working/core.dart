import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_integration/data_from_server/payment_init.dart';

class Core extends StatefulWidget {
  const Core({super.key});

  @override
  State<Core> createState() => _CoreState();
}

class _CoreState extends State<Core> {
  @override
  void initState() {
    initPaymentSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Stripe-Make my payment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text("Card Form", style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 10),
            CardFormField(
                controller:
                    CardFormEditController()), //for manually using own backend
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        await Stripe.instance.presentPaymentSheet();
                      } catch (e) {
                        debugPrint(e.toString());
                      }
                    },
                    child: const Text("Pay"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  initPaymentSheet() async {
    try {
      final paymentDetail = await initpayment();
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
        customFlow: true,
        merchantDisplayName: 'Flutter Stripe Store Demo',
        paymentIntentClientSecret: paymentDetail['client_secret'],
        customerEphemeralKeySecret: paymentDetail['ephemeralKey'],
        customerId: paymentDetail['customer'],
        googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: 'US', currencyCode: 'USD'),
      ));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
