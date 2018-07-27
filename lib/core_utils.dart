library tekartik_utils.core_utils;

///
/// reutnr the defaultValue if value is null
///
T nonNull<T>(T value, T defaultValue) {
  return value == null ? defaultValue : value;
}
