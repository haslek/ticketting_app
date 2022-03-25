import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:ticketting_app/providers/app_state_manager.dart';

import 'navigation/router.dart';

List<SingleChildWidget> providers = [
];
class TicketApp extends StatefulWidget {
  const TicketApp({Key? key}) : super(key: key);

  @override
  State<TicketApp> createState() => _TicketAppState();
}

class _TicketAppState extends State<TicketApp> {
  final _appStateManager = AppStateManager();
  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter(
        appStateManager: _appStateManager
    );
    providers.add(ChangeNotifierProvider(create: (context)=>_appStateManager));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: providers,
      child: Consumer<AppStateManager>(
        builder: (context,manager,_){
          return MaterialApp(
            home: Router(
              routerDelegate: _appRouter,
              backButtonDispatcher: RootBackButtonDispatcher(),
            ),
          );
        },
      ),
    );
  }
}
