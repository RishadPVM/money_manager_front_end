import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maney_manager/screens/home/create.dart';
import 'package:maney_manager/screens/home/read.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {
            Get.to(const CreatePage());
          }, child:const Text('CREATE')),

         const SizedBox(height: 20,),

          ElevatedButton(onPressed: () {
            Get.to(const TransactionsHome());
          }, child:const Text('READ')),

          const SizedBox(height: 20,),

          ElevatedButton(onPressed: () {
            
          }, child:const Text('UPDATE')),

          const SizedBox(height: 20,),

          ElevatedButton(onPressed: () {
            
          }, child:const Text('DELETE'))
        ]),
    );
  }
}