class Helper {
  static String getHostUrl(String url) {
    Uri uri = Uri.parse(url);
    return uri.host;
  }
}
