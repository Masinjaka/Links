import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:linkvault/app/primary_navigation_shell.dart';
import 'package:linkvault/app/widgets/animated_navigation_branch_container.dart';
import 'package:linkvault/features/add_link/presentation/add_link_page.dart';
import 'package:linkvault/features/collections/presentation/add_collection_page.dart';
import 'package:linkvault/features/collections/presentation/collection_details_page.dart';
import 'package:linkvault/features/collections/presentation/collections_page.dart';
import 'package:linkvault/features/feed/presentation/feed_page.dart';
import 'package:linkvault/features/link_details/presentation/link_details_page.dart';
import 'package:linkvault/features/onboarding/presentation/onboarding_page.dart';
import 'package:linkvault/features/profile/presentation/profile_page.dart';
import 'package:linkvault/features/settings/presentation/settings_page.dart';
import 'package:linkvault/features/splash/presentation/splash_page.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const SplashPage(),
    ),
    StatefulShellRoute(
      builder: (context, state, navigationShell) {
        return PrimaryNavigationShell(navigationShell: navigationShell);
      },
      navigatorContainerBuilder: (context, navigationShell, children) {
        return AnimatedNavigationBranchContainer(
          currentIndex: navigationShell.currentIndex,
          children: children,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              name: 'feed',
              builder: (context, state) => const FeedPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/collections',
              name: 'collections',
              builder: (context, state) => const CollectionsPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              name: 'settings',
              builder: (context, state) => const SettingsPage(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: '/add',
      name: 'add-link',
      builder: (context, state) {
        final id = int.tryParse(state.uri.queryParameters['id'] ?? '');
        final collectionId = int.tryParse(
          state.uri.queryParameters['collectionId'] ?? '',
        );
        return AddLinkPage(
          linkId: id,
          collectionId: collectionId,
          initialUrl: state.uri.queryParameters['sharedUrl'],
        );
      },
    ),
    GoRoute(
      path: '/collections/add',
      name: 'add-collection',
      builder: (context, state) {
        final id = int.tryParse(state.uri.queryParameters['id'] ?? '');
        return AddCollectionPage(collectionId: id);
      },
    ),
    GoRoute(
      path: '/collections/view',
      name: 'collection-details',
      builder: (context, state) {
        final id = int.tryParse(state.uri.queryParameters['id'] ?? '');
        if (id == null) {
          return const CollectionsPage();
        }

        return CollectionDetailsPage(collectionId: id);
      },
    ),
    GoRoute(
      path: '/details',
      name: 'link-details',
      builder: (context, state) {
        final id = int.tryParse(state.uri.queryParameters['id'] ?? '');
        final collectionId = int.tryParse(
          state.uri.queryParameters['collectionId'] ?? '',
        );

        return LinkDetailsPage(linkId: id, collectionId: collectionId);
      },
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (context, state) => const ProfilePage(),
    ),
  ],
);
