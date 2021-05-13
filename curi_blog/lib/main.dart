import 'package:curi_blog/views/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'state_manager/provider/logger_provider.dart';

void main() {
  runApp(ProviderScope(observers: [Logger()], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'C.U.R.I Blog',
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}
