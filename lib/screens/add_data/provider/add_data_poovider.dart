import 'package:flutter/cupertino.dart';
import 'package:sending_and_getting_data_from_api/screens/add_data/modal/ecommerce_modal.dart';
import 'package:sending_and_getting_data_from_api/utils/api_helper.dart';

class AddScreenProvider extends ChangeNotifier
{
  List<EcommerceModal> jsonData=[];
  Future<void> getApi() async{
    ApiHelper api = ApiHelper();
    jsonData = await api.getApi();
    notifyListeners();
  }
}