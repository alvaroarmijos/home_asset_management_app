/// Abstract class of home validator.
abstract class HomeValidator {
  /// validates the name of the property
  static String? nameValidation(String? name) {
    if (name == null || name.isEmpty) return 'Enter a name';
    return null;
  }

  /// validates the address of the property
  static String? addressValidation(String? address) {
    if (address == null || address.isEmpty) return 'Enter an address';
    return null;
  }
}
