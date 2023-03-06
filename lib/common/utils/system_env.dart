abstract class SystemEnv {
  static bool isProd = const bool.fromEnvironment("dart.vm.product");

  static String webviewBaseUrl =
      isProd ? 'http://localhost:5173/#/' : 'http://localhost:8080/#';

  static String webviewUrl(String path) {
    return webviewBaseUrl + path;
  }
}
