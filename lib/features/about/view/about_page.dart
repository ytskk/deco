import 'package:dev_community/constants/constants.dart';
import 'package:dev_community/features/about/about.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.aboutAppBarTitle,
          style: theme.textTheme.titleLarge!.bold,
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 44),
          child: Column(
            children: [
              CardAlternative(
                child: SvgPicture.asset(
                  AppIcons.decoLogo,
                  width: 120,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                AppStrings.aboutAppFullName,
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final currentVersion = ref.watch(currentVersionProvider);

                  return AppVersionInfo(versionInfo: currentVersion);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppVersionInfo extends StatelessWidget {
  const AppVersionInfo({
    super.key,
    required this.versionInfo,
  });

  final AppChangelogModel versionInfo;

  @override
  Widget build(BuildContext context) {
    return TableGroup(
      title: AppStrings.aboutAppVersion,
      children: [
        TableGroupRow(
          onTap: () {
            context.pushNamed(PathNames.changelog);
          },
          title: VersionButton(
            version: versionInfo,
          ),
        ),
      ],
    );
    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     const Padding(
    //       padding: EdgeInsets.symmetric(horizontal: 8),
    //       child: Text(
    //         'Version',
    //       ),
    //     ),
    // VersionButton(
    //       version: versionInfo,
    //       onTap: () {
    //         Navigator.of(context).push(
    //           CupertinoPageRoute(
    //             builder: (BuildContext context) {
    //               return const ChangelogPage();
    //             },
    //           ),
    //         );
    //       },
    //     ),
    //   ],
    // );
  }
}
