// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    ListPageRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: ListPage(),
      );
    },
    DetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<DetailPageRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: DetailPage(user: args.user),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          ListPageRoute.name,
          path: '/',
        ),
        RouteConfig(
          DetailPageRoute.name,
          path: '/detail/:user',
        ),
      ];
}

/// generated route for
/// [ListPage]
class ListPageRoute extends PageRouteInfo<void> {
  const ListPageRoute()
      : super(
          ListPageRoute.name,
          path: '/',
        );

  static const String name = 'ListPageRoute';
}

/// generated route for
/// [DetailPage]
class DetailPageRoute extends PageRouteInfo<DetailPageRouteArgs> {
  DetailPageRoute({required User user})
      : super(
          DetailPageRoute.name,
          path: '/detail/:user',
          args: DetailPageRouteArgs(user: user),
        );

  static const String name = 'DetailPageRoute';
}

class DetailPageRouteArgs {
  const DetailPageRouteArgs({required this.user});

  final User user;

  @override
  String toString() {
    return 'DetailPageRouteArgs{user: $user}';
  }
}
