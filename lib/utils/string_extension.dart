extension StringNullExtension on String? {
  int? toInteger() {
    if (this != null && this!.isNotEmpty) {
      try {
        int.tryParse(this!);
      } catch (e) {
        return null;
      }
    }
    return null;
  }
}

extension StringSubstring on String {
  String substringTail(int substringLength) {
    if (substringLength <= 0 || isEmpty) return '';

    if (length > substringLength) {
      return substring(length - substringLength);
    }

    return this;
  }

  String substringHead(int substringLength) {
    if (substringLength >= length) {
      return this;
    }
    if (substringLength <= 0 || isEmpty) {
      return '';
    }

    return substring(0, substringLength);
  }
}
