library string_enum;

abstract class StringEnum {
  String name;
  StringEnum();

  StringEnum.withName(this.name);
  
  @override
  String toString() => name;

  @override
  int get hashCode {
    return name.hashCode;
  }

  @override
  operator ==(var other) {
    if (other is StringEnum) {
      return name == other.name;
    }
    return super == (other);
  }
  
  String get value => name;
}
