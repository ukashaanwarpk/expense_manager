import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../../view_model/customer_details/pick_contact.dart';

class PickContactScreen extends StatefulWidget {
  const PickContactScreen({super.key});

  @override
  State<PickContactScreen> createState() => _PickContactScreenState();
}

class _PickContactScreenState extends State<PickContactScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PickContactController>(context, listen: false)
          .getAllContact();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Customer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(flex: 1, child: Icon(Iconsax.search_normal)),
                Consumer<PickContactController>(
                  builder: (context, value, child) {
                    return Expanded(
                      flex: 6,
                      child: TextFormField(
                        controller: value.searchController,
                        cursorColor: blackColor,
                        onChanged: (val) {
                          value.filterContacts();
                        },
                        decoration: InputDecoration(
                          hintText: 'Search Customer',
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: blackColor,
                          )),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: blackColor,
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              value.searchController.clear();
                              value.filterContacts();
                              FocusScope.of(context).unfocus();
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Consumer<PickContactController>(
              builder: (context, value, child) {
                return value.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: blueAccentColor,
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              value.searchController.text.isNotEmpty == true
                                  ? value.contactsFiltered.length
                                  : value.allContact.length,
                          itemBuilder: (context, index) {
                            final contact = value.searchController.text.isNotEmpty == true ? value.contactsFiltered[index] : value.allContact[index];
                            final phoneNumber = contact.phones!.isEmpty
                                ? ''
                                : contact.phones!.first.value.toString();
                            return ListTile(
                              onTap: () {
                                value.addOrRemoveContact(phoneNumber);
                              },
                              leading: CircleAvatar(
                                backgroundColor: greyColor.shade200,
                                child: Text(
                                  contact.displayName![0].toString(),
                                  style: const TextStyle(color: blackColor),
                                ),
                              ),
                              title: Text(contact.displayName.toString()),
                              subtitle: Text(phoneNumber),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    value.tempList.contains(phoneNumber)
                                        ? null
                                        : Icons.add,
                                    color: blueAccentColor,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    value.tempList.contains(phoneNumber)
                                        ? 'Added'
                                        : 'Add',
                                    style: TextStyle(
                                        color:
                                            value.tempList.contains(phoneNumber)
                                                ? greyColor.withOpacity(0.50)
                                                : blueAccentColor,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
