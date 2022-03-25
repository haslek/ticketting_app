
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ticketting_app/pages.dart';

import '../providers/app_state_manager.dart';
import '../screens/screens.dart';

class AppRouter extends RouterDelegate with ChangeNotifier,
    PopNavigatorRouterDelegateMixin{

  @override
  final GlobalKey<NavigatorState> navigatorKey;
  AppRouter({
    required this.appStateManager,
  }):
        navigatorKey = GlobalKey<NavigatorState>(){
    appStateManager.addListener(notifyListeners);
  }
  final AppStateManager appStateManager;

  @override
  Widget build(BuildContext context) {

    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePop,
      pages: [
        if (!appStateManager.isInitialized) SplashScreen.page(),
        if (appStateManager.isInitialized)
          Home.page(),
        if(appStateManager.referenceValid && appStateManager.pushToScan)
          ScanScreen.page(),
      ],
    );
  }

  bool _handlePop(Route<dynamic> route,result){
    if(!route.didPop(result)) {
      return false;
    }
    if(route.settings.name == AppPages.scanPath){
      appStateManager.pushToScan = false;
    }
    if(route.settings.name == AppPages.home){
      appStateManager.referenceValid = false;
      SystemNavigator.pop();
    }
    return true;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    appStateManager.removeListener(notifyListeners);
    super.dispose();
  }




  @override
  Future<void> setNewRoutePath(configuration)async {
    // return null;
  }
}