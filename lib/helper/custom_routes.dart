import 'package:flutter/material.dart';
// single pageRoute
class CustomeRoutes<T> extends MaterialPageRoute<T>{
  CustomeRoutes({
    WidgetBuilder builder, 
    RouteSettings settings,
  });

  @override
  Widget buildTransitions(
    BuildContext context, 
    Animation<double> animation, 
    Animation<double> secondaryAnimation, 
    Widget child
    ) {
    if(settings.isInitialRoute) {
      return child;
    }
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

// single for all AppTheme
class CustomPageTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context, 
    Animation<double> animation, 
    Animation<double> secondaryAnimation, 
    Widget child) {
    if(route.settings.isInitialRoute) {
      return child;
    }
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}