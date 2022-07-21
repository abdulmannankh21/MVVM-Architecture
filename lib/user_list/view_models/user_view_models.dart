import 'package:flutter/material.dart';
import 'package:mvvm/user_list/repo/api_status.dart';
import 'package:mvvm/user_list/repo/user_services.dart';

import '../models/users_list_model.dart';

class UsersViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _usersListModel = [];


  bool get loading => _loading;
  List<UserModel> get usersListModel => _usersListModel;

  UsersViewModel(){
    getUsers();
  }


  setLoading(bool loading) async{
    _loading = loading;
    notifyListeners();
  }
  setUsersListModel(List<UserModel> usersListModel ) async{
    _usersListModel = usersListModel;
  }

  getUsers() async{
    setLoading(true);
    var response = await UserServices.getUsers();
    if(response is Success){
      setUsersListModel(response.response as List<UserModel>);
    }
    setLoading(false);
  }


}