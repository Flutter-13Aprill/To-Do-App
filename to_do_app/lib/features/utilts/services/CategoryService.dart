import 'package:to_do_app/core/models/categories/categories_model.dart';
import 'package:to_do_app/core/repo/supabase.dart';

class CategoryService {
  List<Category>? _cachedCategories;

  Future<List<Category>> getCategories() async {
    if (_cachedCategories != null) return _cachedCategories!;
    
    final categoriesData = await SupabaseConnect.getCategories();

    if (categoriesData is List) {
      _cachedCategories =
          categoriesData.map((e) => Category.fromMap(e)).toList();
    } else {
      _cachedCategories = [];
    }

    return _cachedCategories!;
  }

  void clearCache() {
    _cachedCategories = null;
  }
}
