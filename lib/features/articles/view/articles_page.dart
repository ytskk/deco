import 'package:dev_community/features/articles/articles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticlesPage extends ConsumerStatefulWidget {
  const ArticlesPage({
    super.key,
  });

  @override
  ConsumerState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends ConsumerState<ArticlesPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    final types = ref.read(articleTypesProvider);
    _tabController = TabController(
      length: types.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    /// Update the tab controller when the article types change.
    ref.listen(articleTypesProvider, (previous, next) {
      _tabController = TabController(
        length: next.length,
        vsync: this,
      );
    });

    return Scaffold(
      appBar: ArticlesListAppbar(
        tabController: _tabController,
        types: ref.watch(articleTypesProvider),
      ),
      body: TabBarView(
        controller: _tabController,
        children: ref.watch(articleTypesProvider).map((type) {
          return ArticlesList(
            key: Key(type),
            type: type,
          );
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }
}
