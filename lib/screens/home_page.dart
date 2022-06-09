import 'package:flutter/material.dart';
import 'package:funapp/models/activity.dart';
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
              bottomNavigationBar: SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1,
                            color: const Color(0xffFF5E51),
                          )),
                      child: IconButton(
                        onPressed: (() {
                          controller.update();
                        }),
                        icon: const Center(
                          child: Icon(
                            Icons.close,
                            size: 50,
                            color: Color(0xffFF5E51),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xff07A6ff),
                            width: 1,
                          )),
                      child: IconButton(
                          onPressed: (() {
                            // Get.to(Quotes());
                          }),
                          icon: const Icon(Icons.star,
                              size: 20, color: const Color(0xff07A6ff))),
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1,
                            color: Colors.greenAccent,
                          )),
                      child: IconButton(
                          onPressed: (() {
                            FutureBuilder<Activity>(
                                future: controller.fetchActivity(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    _addInfo()  {
                                      // Storing key-value pair
                                      box.add(snapshot.data!.activity);
                                      print('Info added to box!');
                                    }
                                  }
                                  else if (snapshot.hasError) {
                               print(snapshot.error);
                              }
                               return const CircularProgressIndicator();

                                }
                                );
                          }),
                          icon: const Center(
                              child: Icon(Icons.favorite,
                                  size: 50, color: Colors.greenAccent))),
                    ),
                  ],
                ),
              ),
              body:  Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffD9D9D9).withOpacity(0.4),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 50.0, right: 20, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 90,
                          height: 60,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/boring.png"),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(
                          height: 150,
                        ),
                        Center(
                          child: SizedBox(
                            height: 300,
                            child: FutureBuilder<Activity>(
                              future: controller.fetchActivity(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    snapshot.data!.activity,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
              
                                // By default, show a loading spinner.
                                return const CircularProgressIndicator();
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              
            );
          }),
    );
  }
}
