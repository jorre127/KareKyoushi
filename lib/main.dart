import 'package:flutter/material.dart';
import 'package:kare_kyoushi/app.dart';
import 'package:kare_kyoushi/di/environments.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/main_common.dart';
import 'package:kare_kyoushi/util/env/flavor_config.dart';
import 'package:kare_kyoushi/util/inspector/database_inspector.dart';
import 'package:kare_kyoushi/util/inspector/local_storage_inspector.dart';
import 'package:kare_kyoushi/util/inspector/niddler.dart';

Future<void> main() async {
  await wrapMain(() async {
    await initNiddler();
    const values = FlavorValues(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      logNetworkInfo: true,
      showFullErrorMessages: true,
    );
    FlavorConfig(
      flavor: Flavor.dev,
      name: 'DEV',
      color: Colors.red,
      values: values,
    );
    // ignore: avoid_print
    print('Starting app from main.dart');
    await configureDependencies(Environments.dev);
    await addDatabaseInspector();
    await initAllStorageInspectors();

    runApp(const MyApp());
  });
}
