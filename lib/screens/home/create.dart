import 'package:flutter/material.dart';
import 'package:maney_manager/services/api.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

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
              decoration: InputDecoration(labelText: 'Name'),
            ),
           const SizedBox(height: 16),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
           const SizedBox(height: 16),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
           const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Perform registration logic here
                String name = nameController.text;
                String phoneNumber = phoneNumberController.text;
                String age = ageController.text ; //int.tryParse(ageController.text) ?? 0;

                // You can now use the collected data as needed
                print('Name: $name, Phone Number: $phoneNumber, Age: $age');
                 var pdata = {
                      
                      "pname": name,
                      "phoneNumber" : phoneNumber,
                      "age": age
                   };
                   Api.addProduct(pdata);
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    ) ;
    }
}