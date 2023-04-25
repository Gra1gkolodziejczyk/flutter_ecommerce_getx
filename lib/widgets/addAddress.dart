import 'package:e_commerce_front_getx/core/app_export.dart';
import 'package:e_commerce_front_getx/data/api_client/api_client.dart';
import 'package:e_commerce_front_getx/data/models/address/address_request_model.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }

class ModalWidget extends StatefulWidget {
  const ModalWidget({super.key});

  @override
  _ModalWidgetState createState() => _ModalWidgetState();
}

class _ModalWidgetState extends State<ModalWidget> {
  final AddressRepository addressRepository = Get.find();

  addNewAddress() async {
    var newAddress = AddressRequestModel(
        address: _address.text,
        addressName: _addressName.text,
        addressNumber: _addressNumber.text,
        city: _city.text,
        country: _country.text,
        tel: _tel.text,
        postalCode: _postalCode.text,
        userFirstName: _userFirstName.text,
        userName: _userName.text,
        civility: _civility == Gender.male ? 'Mr' : 'Ms');

    await addressRepository.createAddress(newAddress);
    Navigator.of(context).pop();
  }

  final TextEditingController _addressName = TextEditingController();
  Gender? _civility = Gender.male;
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _userFirstName = TextEditingController();
  final TextEditingController _addressNumber = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _postalCode = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _tel = TextEditingController();

  void _showModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ajouter une adresse'),
          content: SizedBox(
            height: 320,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 30,
                    child: TextField(
                      controller: _addressName,
                      style: const TextStyle(fontSize: 16.0),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Nom de l'adresse",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: RadioListTile(
                          title: const Text('Mr'),
                          value: Gender.male,
                          groupValue: _civility,
                          onChanged: (value) {
                            setState(() {
                              _civility = value!;
                            });
                          },
                        )),
                        Expanded(
                          child: RadioListTile(
                            title: const Text('Mme'),
                            value: Gender.female,
                            groupValue: _civility,
                            onChanged: (value) {
                              setState(() {
                                _civility = value!;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: TextField(
                      controller: _userName,
                      style: const TextStyle(fontSize: 16.0),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Nom",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: TextField(
                      controller: _userFirstName,
                      style: const TextStyle(fontSize: 16.0),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Prenom",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: TextField(
                      controller: _addressNumber,
                      style: const TextStyle(fontSize: 16.0),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "numéro",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: TextField(
                      controller: _address,
                      style: const TextStyle(fontSize: 16.0),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "adresse",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: TextField(
                      controller: _postalCode,
                      style: const TextStyle(fontSize: 16.0),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "code postal",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: TextField(
                      controller: _city,
                      style: const TextStyle(fontSize: 16.0),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "ville",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: TextField(
                      controller: _country,
                      style: const TextStyle(fontSize: 16.0),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "pays",
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 30,
                      child: TextField(
                        controller: _tel,
                        style: const TextStyle(fontSize: 16.0),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "numéro de téléphone",
                        ),
                      )),
                ]),
          ),
          actions: [
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      addNewAddress();
                    },
                    child: const Text('Ajouter')),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Fermer'),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _showModal,
      child: const Text('Ajouter'),
    );
  }
}
