import 'package:flutter/material.dart';
import 'package:mvvm/user_list/view_models/user_view_models.dart';
import 'package:provider/provider.dart';

import '../models/users_list_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            _ui(usersViewModel),
          ],
        ),
      ),
    );
  }
}

_ui(UsersViewModel userViewModel) {
  if (userViewModel.loading) {
    return CircularProgressIndicator(
      color: Colors.red,
    );
  }
  return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            UserModel userModel = userViewModel.usersListModel[index];
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userModel.name),
                  Text(userModel.email),
                  Text(userModel.phone),
                  Text(userModel.username),
                  Text(userModel.website),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: userViewModel.usersListModel.length));
}
