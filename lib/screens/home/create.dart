import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maney_manager/services/authApi.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  var authContoller = Get.put(Authapi());

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
           const SizedBox(height: 16),
            TextField(
              controller: phoneNumberController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
           const SizedBox(height: 16),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
           const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
               await authContoller.login();
                // // Perform registration logic here
                // String name = nameController.text;
                // String phoneNumber = phoneNumberController.text;
                // String age = ageController.text ; //int.tryParse(ageController.text) ?? 0;

                // // You can now use the collected data as needed
                //  var pdata = {
                      
                //       "pname": name,
                //       "phoneNumber" : phoneNumber,
                //       "age": age
                //    };
                  //  Api.addProduct(pdata);
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    ) ;
    }
}