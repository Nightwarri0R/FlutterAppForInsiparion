import 'package:get/get.dart';
import 'package:my_test_app/services/service.dart';

class DataController extends GetxController {
  DataService dataService = DataService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<dynamic> _myQuotesData = [];
  List<dynamic> get myQuotesData => _myQuotesData;

  Future<void> getQuotes() async {
    _isLoading = true;
    Response response = await dataService.getQuotes();

    if (response.statusCode == 200) {
      _myQuotesData = response.body;
      print("Data received");
      update();
    } else {
      print("Unexpected error occured");
    }
  }

  Future<void> postQuotes(String quote, String quoteAuthor) async {
    _isLoading = true;
    Response response = await dataService
        .postQuotes({"quote": quote, "quotes_detail": quoteAuthor});

    if (response.statusCode == 200) {
      update();
      print("Data sent");
    } else {
      print("Unexpected error occured");
    }
  }
}
