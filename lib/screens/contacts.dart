import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:project_my_app/screens/add_contacts.dart';
import 'package:project_my_app/screens/edit_contact.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

  Query query = FirebaseDatabase.instance.ref('Contacts').orderByChild('name');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Contacts');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My contacts'),
      ),

      body: SizedBox(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: query,
          itemBuilder: (
              BuildContext context,
              DataSnapshot snapshot,
              Animation<double> animation,
              int index){
            Map? contact = snapshot.value as Map?;
            contact!['key'] = snapshot.key;
            return buildContactItem(contact: contact);
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return const AddContacts();
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildContactItem({Map? contact}){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 2,
            spreadRadius: 1,
            offset: const Offset(0, 5)
          )
        ]
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const Icon(Icons.account_circle,color: Colors.grey,),
            const SizedBox(width: 10,),
            Text(contact!['name'])
          ],),
          const SizedBox(height: 10,),
          Row(children: [
            const Icon(Icons.phone_android,color: Colors.grey,),
            const SizedBox(width: 10,),
            Text(contact['number'])
          ],),
          const SizedBox(height: 10,),
          Row(children: [
            const Icon(Icons.home,color: Colors.grey,),
            const SizedBox(width: 10,),
            Text(contact['address'])
          ],),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>EditContacts(contact['key'])));
              },
              child: Row(children:const [
                Icon(Icons.edit,color: Colors.grey,),
                Text('Edit'),
                SizedBox(width: 15,)
              ]),
            ),
              GestureDetector(
                onTap: (){
                  showDeleteDialog(contact: contact);
                },
                child: Row(children:const [
                  Icon(Icons.delete,color: Colors.grey,),
                  Text('Delete'),
                  SizedBox(width: 15,)
                ]),
              )
          ],)

        ],
      ),
    );
  }

  showDeleteDialog({Map? contact}){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Delete ${contact!['name']}"),
        content: const Text("Are you sure you want to delete?"),
        actions: [
          TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text("cancel"),),
          TextButton(
            onPressed: (){
              reference.child(contact['key'])
                  .remove()
                  .whenComplete(() => Navigator.pop(context));
            },
            child: const Text("delete"),)
        ],
      );
    });
  }

}
