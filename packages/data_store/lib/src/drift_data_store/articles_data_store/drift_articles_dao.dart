import 'package:data_store/data_store.dart';
import 'package:drift/drift.dart';

part 'drift_articles_dao.g.dart';

@DriftAccessor(
  tables: [
    Articles,
    Users,
    Organizations,
  ],
)
class DriftArticlesDao extends DatabaseAccessor<DriftDataStore>
    with _$DriftArticlesDaoMixin, ArticlesDataStoreInterface {
  DriftArticlesDao(DriftDataStore db) : super(db);

  @override
  Stream<List<Article>> allSavedArticles() {}
}
