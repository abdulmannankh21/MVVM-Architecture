import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvm/user_list/models/users_list_model.dart';
import 'package:mvvm/user_list/repo/api_status.dart';
import 'package:mvvm/user_list/utils/constants.dart';

class UserServices {
  static Future<Object> getUsers() async {
    try {
      var url = Uri.parse(USERS_LIST);
      var response = await http.get(url);
      if (200 == response.statusCode) {
        return Success(
            response: usersListModelFromJson(response.body), code: 200);
      }
      return Failure(
        code: 100,
        errorresponse: "Invalid Response",
      );
    } on HttpException {
      return Failure(code: 101, errorresponse: "No Internet");
    } on FormatException {
      return Failure(code: 102, errorresponse: "Invalid Exception");
    } catch (e) {
      return Failure(code: 103, errorresponse: "Unknown error");
    }
  }
}
