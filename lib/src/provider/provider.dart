import "package:get/get.dart";
import "package:market_flutter/src/shared/global.dart";

class Provider extends GetConnect{
  @override
  void onInit(){
    httpClient.baseUrl=Global.baseUrl;
    allowAutoSignedCert=true; // 개발 과정에서 자체 서명된 SSL/TLS 인증서의 사용을 허용하는 중요한 역할
    httpClient.baseUrl='<http://localhost:3000';
    httpClient.addRequestModifier<void>((request){
      request.headers['Accept']='application/json';
      if(request.url.toString().contains('/api/')){
        request.headers['Authorization']='Bearer ${Global.accessToken}';
      }
      return request;
    });
    // super.onInit();
  }
}