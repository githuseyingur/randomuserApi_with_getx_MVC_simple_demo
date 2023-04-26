import 'package:get/get.dart';
import 'package:my_task/services/api_services.dart';

class ListController extends GetxController with StateMixin<List<dynamic>>{

  var _text = "".obs;

  List filteredList = RxList();  // Rx List
  List userList = [];  // get User List from API

  get getText => _text.value;
  void setText(String query) {
    _text.value = query;
  }

  void filterList() {  // filter the List (by name or lastName)
      final filtered = userList.where((item) => (item.name.toLowerCase().contains(_text.value.toLowerCase()))
          || (item.lastName.toLowerCase().contains(_text.value.toLowerCase())) ).toList();

      filteredList.assignAll(filtered); // Filtered List
      change(filteredList, status: RxStatus.success()); // update List
  }

  @override
  void onInit() {

    super.onInit();

    ApiServices().getUser().then((value) {
      Get.snackbar('Success', 'User list fetched successfully');
      userList = value;
      change(userList, status: RxStatus.success());

    },

        onError: (error){
      change(null, status: RxStatus.error(error.toString()));
    });

    ever(_text, (_) => filterList()); // listen Search box and filtering
  }

  void onDataReceived(users) {
    Get.snackbar('Success',
      'Data loaded successfully',
      duration: Duration(seconds: 3),
      snackPosition: SnackPosition.BOTTOM,);
  }
}