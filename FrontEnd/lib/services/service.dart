import 'package:get/get_connect/connect.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class DataService extends GetConnect implements GetxService {
  Future<Response> getQuotes() async {
    Response response = await get("http://localhost:8090/getquotes",
        headers: {'Content-Type': 'application/json; charset=UTF8'});

    return response;
  }

  Future<Response> postQuotes(dynamic body) async {
    Response response = await post("http://localhost:8090/addquote", body,
        headers: {'Content-Type': 'application/json; charset=UTF8'});

    return response;
  }
}
