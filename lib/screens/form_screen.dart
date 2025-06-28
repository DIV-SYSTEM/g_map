import 'package:flutter/material.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../models/form_data.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formData = Provider.of<FormData>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Address Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Name'),
              onChanged: (value) => formData.updateName(value),
            ),
            const SizedBox(height: 16),
            ListTile(
              title: Text(
                formData.homeAddress ?? 'Select Home Address',
                style: TextStyle(
                  color: formData.homeAddress == null ? Colors.grey : Colors.black,
                ),
              ),
              trailing: const Icon(Icons.map),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlacePicker(
                      apiKey: 'YOUR_API_KEY', // Replace with your API key
                      onPlacePicked: (PickResult result) {
                        formData.updateHomeAddress(result.formattedAddress);
                        Navigator.pop(context);
                      },
                      initialPosition: const LatLng(37.7749, -122.4194), // Default: San Francisco
                      useCurrentLocation: true,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            ListTile(
              title: Text(
                formData.officeAddress ?? 'Select Office Address',
                style: TextStyle(
                  color: formData.officeAddress == null ? Colors.grey : Colors.black,
                ),
              ),
              trailing: const Icon(Icons.map),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlacePicker(
                      apiKey: 'YOUR_API_KEY', // Replace with your API key
                      onPlacePicked: (PickResult result) {
                        formData.updateOfficeAddress(result.formattedAddress);
                        Navigator.pop(context);
                      },
                      initialPosition: const LatLng(37.7749, -122.4194),
                      useCurrentLocation: true,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (formData.name.isNotEmpty &&
                    formData.homeAddress != null &&
                    formData.officeAddress != null) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Form Submitted'),
                      content: Text(
                        'Name: ${formData.name}\n'
                        'Home Address: ${formData.homeAddress}\n'
                        'Office Address: ${formData.officeAddress}',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            formData.reset();
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all fields')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
