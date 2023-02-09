import 'package:bloc_flutter/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BreckingBad(
    appRouter: AppRouter(),
  ));
}

class BreckingBad extends StatelessWidget {
  const BreckingBad({
    Key? key,
    required this.appRouter,
  }) : super(key: key);
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
