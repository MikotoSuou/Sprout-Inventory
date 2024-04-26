
extension StringExt on String? {

  bool get isValidUrl => (this == null) ? false : Uri.parse(this!).host.isNotEmpty;

}