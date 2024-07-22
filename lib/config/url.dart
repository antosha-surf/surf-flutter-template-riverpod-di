/// Backend Api Urls.
enum ApiUrl {
  /// Dev url.
  dev('https://example.com/'),

  /// Prod url.
  prod('https://example.com/');

  /// Url value.
  final String value;

  const ApiUrl(this.value);
}
