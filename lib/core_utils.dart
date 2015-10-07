library tekartik_utils.core_utils;

///
/// reutnr the defaultValue if value is null
///
dynamic nonNull(dynamic value, dynamic defaultValue) {
  return value == null ? defaultValue : value;
}
