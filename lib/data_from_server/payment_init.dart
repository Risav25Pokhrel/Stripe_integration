import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '/.env';

Future<Map> initpayment() async {
  var body = {'amount': 1000, 'currency': "USD"};

  try {
    final response =
        await Dio().post("https://api.stripe.com/v1/payment_intents",
            queryParameters: body,
            options: Options(headers: {
              "Authorization":
                  "Bearer $secretkey",
            }));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw(response.statusCode.toString());
    }
  } catch (e) {
    debugPrint(e.toString());
    return {};
  }
}
