import 'package:flutter/material.dart';
import 'package:funapp/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

late final Box box;

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
          init: HomeController(),
          initState: (_) {},
          builder: (controller) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                /*  child: Expanded(
                child: ListView.builder(
                  itemCount: Box.,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(items[index]),
                    );
                  },
                ),
                ),*/
              )
            );
          }),
    );
  }
}
