// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

class BaseConnect extends GetConnect {
  static const String DEV = 'http://moplat.develop.mowork.cn'; // 开发环境
  static const String TEST = 'http://moplat.testing.mowork.cn'; // 测试环境
  static const String PROD = 'http://moplat.mowork.cn'; // 生产环境

  @override
  void onInit() {
    // 创建公共接口地址
    httpClient.baseUrl = DEV;

    // 请求拦截
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers["token"] = "token";
      return request;
    });

    // 响应拦截
    httpClient.addResponseModifier<ServerModel>((request, response) {
      // 处理逻辑
      return response;
    });
  }
}

class ServerModel {
  ServerModel(this.rcode, this.msg, this.data);

  final dynamic rcode;
  final String msg;
  final dynamic data;
}
