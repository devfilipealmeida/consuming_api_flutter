import 'dart:convert';
import 'dart:developer';

import 'package:consumindo_api_com_flutter/model/user_model.dart';
import 'package:consumindo_api_com_flutter/repository/i_user_repository.dart';
import 'package:http/http.dart' as http;

class UserHttpRepository implements IUserRepository {
  @override
  Future<List<UserModel>> findAllUsers() async {
    final url =
        Uri.parse('https://61b2802bc8d4640017aaf422.mockapi.io/api/users');

    try {
      final response = await http.get(url);

      final responseMap = jsonDecode(response.body);
      log(responseMap.toString());
      return responseMap
          .map<UserModel>((resp) => UserModel.fromMap(resp))
          .toList();
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }
}
