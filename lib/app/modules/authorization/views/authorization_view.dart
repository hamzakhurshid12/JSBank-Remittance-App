import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/authorization_controller.dart';

class AuthorizationView extends GetView<AuthorizationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AuthorizationView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AuthorizationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
