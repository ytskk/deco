import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final teamMembersProvider =
    FutureProvider.autoDispose.family<List<UserModel>, String>((
  ref,
  organizationName,
) async {
  final authorRepository = ref.watch(authorRepositoryProvider);

  return authorRepository.getOrganizationMembers(
    organizationName: organizationName,
  );
});

class TeamMembers extends StatelessWidget {
  const TeamMembers({
    super.key,
    required this.organizationName,
  });

  final String organizationName;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.labelMedium!.bold;

    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              8,
              24,
              8,
              8,
            ),
            child: Text(
              'Team Members',
              style: titleStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final teamMembers =
                    ref.watch(teamMembersProvider(organizationName));

                return teamMembers.when(
                  data: (List<UserModel> data) {
                    return Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: data.map((UserModel user) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AccountAvatar(
                              url: user.profileImage,
                              accountName: user.username,
                              onTap: () {
                                context.pushNamed(
                                  PathNames.username,
                                  params: {
                                    PathNames.username: user.username,
                                  },
                                );
                              },
                            ),
                          ],
                        );
                      }).toList(),
                    );
                  },
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  },
                  error: (Object error, StackTrace? stackTrace) {
                    return const Center(
                      child: Text('Error'),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
