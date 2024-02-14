import 'package:flutter/material.dart';
import 'package:kare_kyoushi/app.dart';
import 'package:kare_kyoushi/di/environments.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/main_common.dart';
import 'package:kare_kyoushi/util/env/flavor_config.dart';

Future<void> main() async {
  await wrapMain(() async {
    const values = FlavorValues(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      logNetworkInfo: false,
      showFullErrorMessages: true,
    );
    FlavorConfig(
      flavor: Flavor.beta,
      name: 'BETA',
      color: Colors.blue,
      values: values,
    );
    await configureDependencies(Environments.prod);
    runApp(const MyApp());
  });
}
