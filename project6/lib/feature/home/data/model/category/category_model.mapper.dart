// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'category_model.dart';

class CategoryModelMapper extends ClassMapperBase<CategoryModel> {
  CategoryModelMapper._();

  static CategoryModelMapper? _instance;
  static CategoryModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CategoryModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CategoryModel';

  static String? _$categoryId(CategoryModel v) => v.categoryId;
  static const Field<CategoryModel, String> _f$categoryId =
      Field('categoryId', _$categoryId, opt: true);
  static String _$categoryName(CategoryModel v) => v.categoryName;
  static const Field<CategoryModel, String> _f$categoryName =
      Field('categoryName', _$categoryName);
  static IconData _$categoryIcon(CategoryModel v) => v.categoryIcon;
  static const Field<CategoryModel, IconData> _f$categoryIcon =
      Field('categoryIcon', _$categoryIcon);
  static Color _$categoryColor(CategoryModel v) => v.categoryColor;
  static const Field<CategoryModel, Color> _f$categoryColor =
      Field('categoryColor', _$categoryColor);

  @override
  final MappableFields<CategoryModel> fields = const {
    #categoryId: _f$categoryId,
    #categoryName: _f$categoryName,
    #categoryIcon: _f$categoryIcon,
    #categoryColor: _f$categoryColor,
  };

  static CategoryModel _instantiate(DecodingData data) {
    return CategoryModel(
        categoryId: data.dec(_f$categoryId),
        categoryName: data.dec(_f$categoryName),
        categoryIcon: data.dec(_f$categoryIcon),
        categoryColor: data.dec(_f$categoryColor));
  }

  @override
  final Function instantiate = _instantiate;

  static CategoryModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CategoryModel>(map);
  }

  static CategoryModel fromJson(String json) {
    return ensureInitialized().decodeJson<CategoryModel>(json);
  }
}

mixin CategoryModelMappable {
  String toJson() {
    return CategoryModelMapper.ensureInitialized()
        .encodeJson<CategoryModel>(this as CategoryModel);
  }

  Map<String, dynamic> toMap() {
    return CategoryModelMapper.ensureInitialized()
        .encodeMap<CategoryModel>(this as CategoryModel);
  }

  CategoryModelCopyWith<CategoryModel, CategoryModel, CategoryModel>
      get copyWith => _CategoryModelCopyWithImpl<CategoryModel, CategoryModel>(
          this as CategoryModel, $identity, $identity);
  @override
  String toString() {
    return CategoryModelMapper.ensureInitialized()
        .stringifyValue(this as CategoryModel);
  }

  @override
  bool operator ==(Object other) {
    return CategoryModelMapper.ensureInitialized()
        .equalsValue(this as CategoryModel, other);
  }

  @override
  int get hashCode {
    return CategoryModelMapper.ensureInitialized()
        .hashValue(this as CategoryModel);
  }
}

extension CategoryModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CategoryModel, $Out> {
  CategoryModelCopyWith<$R, CategoryModel, $Out> get $asCategoryModel =>
      $base.as((v, t, t2) => _CategoryModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CategoryModelCopyWith<$R, $In extends CategoryModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? categoryId,
      String? categoryName,
      IconData? categoryIcon,
      Color? categoryColor});
  CategoryModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CategoryModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CategoryModel, $Out>
    implements CategoryModelCopyWith<$R, CategoryModel, $Out> {
  _CategoryModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CategoryModel> $mapper =
      CategoryModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? categoryId = $none,
          String? categoryName,
          IconData? categoryIcon,
          Color? categoryColor}) =>
      $apply(FieldCopyWithData({
        if (categoryId != $none) #categoryId: categoryId,
        if (categoryName != null) #categoryName: categoryName,
        if (categoryIcon != null) #categoryIcon: categoryIcon,
        if (categoryColor != null) #categoryColor: categoryColor
      }));
  @override
  CategoryModel $make(CopyWithData data) => CategoryModel(
      categoryId: data.get(#categoryId, or: $value.categoryId),
      categoryName: data.get(#categoryName, or: $value.categoryName),
      categoryIcon: data.get(#categoryIcon, or: $value.categoryIcon),
      categoryColor: data.get(#categoryColor, or: $value.categoryColor));

  @override
  CategoryModelCopyWith<$R2, CategoryModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CategoryModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
