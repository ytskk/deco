import 'dart:developer';
import 'dart:io';

import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: PathNames.articles,
  routes: [
    AppRoute(
      name: PathNames.preferences,
      path: PathNames.preferences,
      builder: (_) => const PreferencesPage(),
      routes: [
        AppRoute(
          name: PathNames.preferencesAppStyle,
          path: PathNames.preferencesAppStyle,
          builder: (_) => const AppStyleSelectionPage(),
        ),
        AppRoute(
          name: PathNames.preferencesComponents,
          path: PathNames.preferencesComponents,
          builder: (_) => const ComponentsPage(),
        ),
      ],
    ),
    AppRoute(
      path: PathNames.about,
      name: PathNames.about,
      builder: (_) => const AboutPage(),
    ),
    AppRoute(
      name: PathNames.tags,
      path: PathNames.tags,
      routes: [
        AppRoute(
          name: PathNames.tagsSelect,
          path: PathNames.tagsSelect,
          builder: (_) => const TagsSelectionPage(),
        ),
      ],
    ),
    // articles
    AppRoute(
      path: PathNames.articles,
      name: PathNames.articles,
      builder: (state) {
        return ArticlesPage(
          key: state.pageKey,
          // articleType: state.params[PathNames.articlesByType],
        );
      },
      routes: [
        AppRoute(
          path: ':${PathNames.username}',
          name: PathNames.username,
          builder: (s) {
            final username = s.params[PathNames.username];
            return AuthorPage(username: username!);
          },
          routes: [
            AppRoute(
              path: ':${PathNames.articleBySlug}',
              name: PathNames.articleBySlug,
              builder: (state) {
                log(
                  'articleBySlug: ${state.params[PathNames.username]}, ${state.params[PathNames.articleBySlug]}',
                  name: 'router::build',
                );
                return ArticleDetailsPage(
                  key: state.pageKey,
                  articleSlug: StringUtils.joinBy(
                    [
                      state.params[PathNames.username]!,
                      state.params[PathNames.articleBySlug]!,
                    ],
                    separator: '/',
                  ),
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
)

  /// Clown observer for showing the current location. 🤡
  ..addListener(
    () {
      log('location: ${router.location}', name: 'AppRouter');
    },
  );

class AppRoute extends GoRoute {
  AppRoute({
    required super.path,
    super.routes,
    super.name,
    super.redirect,
    Widget Function(GoRouterState s)? builder,
  }) : super(
          pageBuilder: (context, state) {
            if (kIsWeb || !Platform.isIOS || Platform.isMacOS) {
              return MaterialPage(
                child: builder!(state),
                name: name,
                fullscreenDialog: state.extra != null &&
                    state.extra is PathExtra &&
                    (state.extra as PathExtra).fullscreenDialog,
              );
            }

            return CupertinoPage(
              child: builder!(state),
              name: name,
              fullscreenDialog: state.extra != null &&
                  state.extra is PathExtra &&
                  (state.extra as PathExtra).fullscreenDialog,
            );
          },
        );
}

class PathExtra {
  PathExtra({
    this.fullscreenDialog = false,
  });

  final bool fullscreenDialog;
}

///
extension RouterHelper on BuildContext {
  /// Navigate to a named route onto the page stack.
  void pushNamedArticleByPath(
    String path, {
    Object? extra,
  }) {
    GoRouter.of(this).pushNamed(
      PathNames.articleBySlug,
      params: {
        'username': path.split('/')[1],
        'slug': path.split('/').last,
      },
      extra: extra,
    );
  }
}
