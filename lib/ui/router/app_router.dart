import 'package:fantastico_app/ui/app/widgets/scaffold_with_nav_bar.dart';
import 'package:fantastico_app/ui/home/home_screen.dart';
import 'package:fantastico_app/ui/product_brand/product_brand_screen.dart';
import 'package:fantastico_app/ui/product_detail/product_detail_screen.dart';
import 'package:fantastico_app/ui/product_week/product_week_screen.dart';
import 'package:fantastico_app/ui/scanner/scanner_screen.dart';
import 'package:fantastico_app/ui/search/search_screen.dart';
import 'package:fantastico_app/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final _productRouter = GoRoute(
  path: 'product/:id',
  builder: (BuildContext context, GoRouterState state) {
    return ProductDetailProvider(
      hashedId: state.pathParameters['id'],
    );
  },
);

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  routes: <RouteBase>[
    GoRoute(
      path: '/splash',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashProvider();
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavBar(
          navigationShell: navigationShell,
        );
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeProvider(),
              routes: <RouteBase>[
                GoRoute(
                  path: 'week',
                  builder: (BuildContext context, GoRouterState state) {
                    final name =
                        state.uri.queryParameters['name'] ?? 'Esta semana';
                    final weekNumber =
                        int.parse(state.uri.queryParameters['number'] ?? '0');
                    return ProductWeekProvider(
                      weekNumber: weekNumber,
                      description: name,
                    );
                  },
                  routes: <RouteBase>[
                    _productRouter,
                  ],
                ),
                GoRoute(
                  path: 'brand',
                  builder: (BuildContext context, GoRouterState state) {
                    final name =
                        state.uri.queryParameters['name'] ?? 'Sin marca';
                    final brandId =
                        int.parse(state.uri.queryParameters['brand_id'] ?? '0');
                    return ProductBrandProvider(
                      brandId: brandId,
                      description: name,
                    );
                  },
                  routes: <RouteBase>[
                    _productRouter,
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/scanner',
              builder: (context, state) {
                return const ScannerScreen();
              },
              routes: <RouteBase>[
                _productRouter,
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/search',
              builder: (context, state) => const SearchProvider(),
              routes: <RouteBase>[
                _productRouter,
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
