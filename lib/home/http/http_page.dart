import 'package:consumindo_api_com_flutter/home/http/http_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/user_model.dart';

class HttpPage extends GetView<HttpController> {
  const HttpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP'),
      ),
      body: controller.obx((state) {
        return ListView.builder(
          itemCount: state.length,
          itemBuilder: (_, index){
            final UserModel item = state[index];
            return ListTile(
              title: Text(item.name),
            );
          },
        );
      }, onError: (error) {
        return Column(
          children: [
            TextButton(
              onPressed: () => controller.findUsers(),
              child: Text(error!)),
          ],
        );
      }),
    );
  }
}
