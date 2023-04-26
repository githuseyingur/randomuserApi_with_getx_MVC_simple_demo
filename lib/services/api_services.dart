import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:my_task/controller/list_controller.dart';
import 'package:my_task/model/user_model.dart';

class ApiServices extends GetConnect{
  final Dio _dio = Dio();

  Future<List<dynamic>> getUser() async{
    try {
      final response = await _dio.get('https://randomuser.me/api/?results=24');

      if (response.statusCode != 200) {    // if not successful
        throw Exception('Failed to load data !..');
      }

      final results = response.data['results'];

      final users = results.map((result) => User.fromJson(result)).toList(); //create User List

      Get.find<ListController>().onDataReceived(users);

      return users;

    } catch (e) {
      throw Exception('Failed to load data !..');
    }
  }

}