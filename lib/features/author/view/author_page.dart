import 'dart:developer';
import 'dart:math' as math;

import 'package:dev_community/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Uses two info providers because of the way the API works.
///
/// For organizations and users URL path are the same: https://dev.to/username
///
/// It forces to check if the user exists by provided [username] if not, then
/// check if the organization exists, else throw an error.
final authorInfoProvider = FutureProvider.autoDispose
    .family<AuthorInfoModel, String>((ref, username) async {
  final authorRepository = ref.watch(authorRepositoryProvider);

  final author = await authorRepository.getAuthorByUsername(username);

  return author;
});

class AuthorPage extends StatelessWidget {
  const AuthorPage({
    super.key,
    required this.username,
  });

  final String username;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final authorInfo = ref.watch(authorInfoProvider(username));

        return authorInfo.when(
          data: (authorInfo) {
            return Scaffold(
              body: NestedScrollView(
                headerSliverBuilder: (
                  BuildContext context,
                  bool innerBoxIsScrolled,
                ) {
                  return [
                    AuthorSliverAppbar(
                      author: authorInfo,
                    ),
                  ];
                },
                body: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: AuthorInfoView(author: authorInfo),
                      ),
                    ),
                    if (authorInfo.isOrganization)
                      TeamMembers(
                        organizationName: authorInfo.username,
                      ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 4,
                      ),
                      sliver: AuthorArticlesList(
                        authorName: authorInfo.username,
                        isOrganization: authorInfo.isOrganization,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          loading: () => const Scaffold(
            body: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
          error: (error, stackTrace) {
            return Scaffold(
              body: Center(
                child: Text(error.toString()),
              ),
            );
          },
        );
        // final userInfo = ref.watch(userInfoProvider(username));

        // return Scaffold(
        //   appBar: AppBar(),
        //   body: userInfo.when(
        //     data: (data) {
        //       return UserInfoView(user: data);
        //     },
        //     loading: () {
        //       return const Center(
        //         key: Key('author_page_loading'),
        //         child: CircularProgressIndicator.adaptive(),
        //       );
        //     },
        //
        //     /// If the user is not found, we try to find an organization.
        //     ///
        //     /// If the organization is not found, we show an error message.
        //     ///
        //     /// TODO: optimize. simplify.
        //     error: (Object error, _) {
        //       if (error is FormatException) {
        //         final organizationInfo =
        //             ref.watch(organizationInfoProvider(username));
        //
        //         return organizationInfo.when(
        //           data: (OrganizationModel data) {
        //             return OrganizationInfoView(organization: data);
        //           },
        //           error: (Object error, _) {
        //             return const Center(
        //               child: Text('Organization not found'),
        //             );
        //           },
        //           loading: () {
        //             return const Center(
        //               key: Key('author_page_loading'),
        //               child: CircularProgressIndicator.adaptive(),
        //             );
        //           },
        //         );
        //       }
        //
        //       return Center(
        //         child: Text('Error: $error'),
        //       );
        //     },
        //   ),
        // );
      },
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
