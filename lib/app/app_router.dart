import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:linkvault/features/add_link/presentation/add_link_page.dart';
import 'package:linkvault/features/collections/presentation/add_collection_page.dart';
import 'package:linkvault/features/collections/presentation/collection_details_page.dart';
import 'package:linkvault/features/collections/presentation/collections_page.dart';
import 'package:linkvault/features/feed/presentation/feed_page.dart';
import 'package:linkvault/features/link_details/presentation/link_details_page.dart';
import 'package:linkvault/features/onboarding/presentation/onboarding_page.dart';
import 'package:linkvault/features/profile/presentation/profile_page.dart';
import 'package:linkvault/features/settings/presentation/settings_page.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'feed',
      pageBuilder: (context, state) => _buildSlidePage(state, const FeedPage()),
    ),
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      pageBuilder: (context, state) =>
          _buildSlidePage(state, const OnboardingPage()),
    ),
    GoRoute(
      path: '/add',
      name: 'add-link',
      pageBuilder: (context, state) {
        final id = int.tryParse(state.uri.queryParameters['id'] ?? '');
        final collectionId = int.tryParse(
          state.uri.queryParameters['collectionId'] ?? '',
        );
        return _buildSlidePage(
          state,
          AddLinkPage(linkId: id, collectionId: collectionId),
        );
      },
    ),
    GoRoute(
      path: '/collections',
      name: 'collections',
      pageBuilder: (context, state) =>
          _buildSlidePage(state, const CollectionsPage()),
    ),
    GoRoute(
      path: '/collections/add',
      name: 'add-collection',
      pageBuilder: (context, state) {
        final id = int.tryParse(state.uri.queryParameters['id'] ?? '');
        return _buildSlidePage(state, AddCollectionPage(collectionId: id));
      },
    ),
    GoRoute(
      path: '/collections/view',
      name: 'collection-details',
      pageBuilder: (context, state) {
        final id = int.tryParse(state.uri.queryParameters['id'] ?? '');
        if (id == null) {
          return _buildSlidePage(state, const CollectionsPage());
        }

        return _buildSlidePage(state, CollectionDetailsPage(collectionId: id));
      },
    ),
    GoRoute(
      path: '/details',
      name: 'link-details',
      pageBuilder: (context, state) {
        final id = int.tryParse(state.uri.queryParameters['id'] ?? '');
        final collectionId = int.tryParse(
          state.uri.queryParameters['collectionId'] ?? '',
        );

        return _buildSlidePage(
          state,
          LinkDetailsPage(linkId: id, collectionId: collectionId),
        );
      },
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      pageBuilder: (context, state) =>
          _buildSlidePage(state, const ProfilePage()),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      pageBuilder: (context, state) =>
          _buildSlidePage(state, const SettingsPage()),
    ),
  ],
);

CustomTransitionPage<void> _buildSlidePage(GoRouterState state, Widget child) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 280),
    reverseTransitionDuration: const Duration(milliseconds: 240),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.easeInCubic,
      );

      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(curvedAnimation),
        child: child,
      );
    },
  );
}
