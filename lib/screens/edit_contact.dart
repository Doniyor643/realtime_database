import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class EditContacts extends StatefulWidget {
  String contactKey = '';

  EditContacts(this.contactKey, {Key? key}) : super(key: key);

  @override
  State<EditContacts> createState() => _EditContactsState();
}

class _EditContactsState extends State<EditContacts> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final DatabaseReference _reference = FirebaseDatabase.instance.ref().child('Contacts');

  String typeSelected = '';

  @override
  void initState() {
    super.initState();
    getContactDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Contacts'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                    hintText: 'Name',
                    prefixIcon: Icon(Icons.account_circle,size: 30,)
                ),
              ),
              const SizedBox(height: 20,),
              TextField(
                controller: _numberController,
                decoration: const InputDecoration(
                    hintText: 'Phone number',
                    prefixIcon: Icon(Icons.call,size: 30,)
                ),
              ),
              const SizedBox(height: 20,),
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(
                    hintText: 'Address',
                    prefixIcon: Icon(Icons.home,size: 30,)
                ),
              ),
              const SizedBox(height: 20,),

              buildContactType('Work'),
              buildContactType('Family'),
              buildContactType('Friends'),
              buildContactType('Other'),

              const SizedBox(height: 20,),

              Container(
                color: Theme.of(context).colorScheme.secondary,
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){
                      saveContact();
                    },
                    child: const Text('Update')),
              )

            ],),
        ),
      ),
    );
  }

  Widget buildContactType(String title){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: typeSelected == title ? Colors.green : Theme.of(context).colorScheme.secondary,
          ),
          child: Center(
            child: Text(title,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
        ),
        onTap: (){
          setState(() {
            typeSelected = title;
          });
        },
      ),
    );
  }

  void getContactDetail()async{
    DatabaseEvent snapshot = await _reference.child(widget.contactKey).once();
    
    Map contact = snapshot.snapshot.value as Map;

    _nameController.text = contact['name'];
    _numberController.text = contact['number'];
    _addressController.text = contact['address'];

    setState(() {
      typeSelected = contact['type'];
    });
    
  }

  void saveContact() {
    String name = _nameController.text.trim();
    String number = _numberController.text.trim();
    String address = _addressController.text.trim();

    Map<String,String> contact = {
      'name' : name,
      'number' : number,
      'address' : address,
      'type' : typeSelected,
    };

    _reference.child(widget.contactKey).update(contact).then((value) {
      Navigator.pop(context);
    });

  }

}
