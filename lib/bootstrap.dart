import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quan_nhau/app.dart';
import 'package:uuid/uuid.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap({required String name}) async {
  // await dotenv.load(fileName: name);
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
  );

  /// clear all the states in case of rebuilding.
  // await getIt.reset();

  Bloc.observer = const AppBlocObserver();

  // Add cross-flavor configuration here

  await Future.wait([
    initFirebase(),
    initHydratedBloc(),
    // DeviceInfo.getDeviceInfo(),
    // DependencyResolver.resolve(),
    configLoading(),
  ]);

  runApp(App(key: Key(const Uuid().v1())));
}

Future<void> initFirebase() async {
  // try {
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  //   FlutterError.onError = (errorDetails) {
  //     FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  //   };
  //   // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  //   PlatformDispatcher.instance.onError = (error, stack) {
  //     FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //     return true;
  //   };
  // } on Exception catch (_) {}
}

Future<void> initHydratedBloc() async {
  // HydratedBloc.storage = await HydratedStorage.build(
  //   storageDirectory: HydratedStorageDirectory(
  //     (await getTemporaryDirectory()).path,
  //   ),
  // );
}

Future<void> configLoading() async {
  // EasyLoading.instance.maskType = EasyLoadingMaskType.black;
}
